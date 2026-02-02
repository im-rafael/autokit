#!/usr/bin/env node

const fs = require("fs");
const fsp = fs.promises;
const path = require("path");

const BASE_DIR = path.resolve(__dirname, "..", "base");
const EXCLUDE_FILENAME = "exclude";

async function pathExists(targetPath) {
  try {
    await fsp.access(targetPath);
    return true;
  } catch (error) {
    return false;
  }
}

async function ensureDir(dirPath) {
  await fsp.mkdir(dirPath, { recursive: true });
}

async function readTextIfExists(filePath) {
  if (!(await pathExists(filePath))) {
    return "";
  }
  return fsp.readFile(filePath, "utf8");
}

function normalizeNewline(text) {
  if (!text) {
    return "";
  }
  return text.endsWith("\n") ? text : `${text}\n`;
}

async function appendExcludeRules(excludeSourcePath, gitDirPath) {
  const excludeTargetPath = path.join(gitDirPath, "info", "exclude");
  const sourceContent = await readTextIfExists(excludeSourcePath);
  if (!sourceContent.trim()) {
    return;
  }

  await ensureDir(path.dirname(excludeTargetPath));

  const existingContent = await readTextIfExists(excludeTargetPath);
  const contentToAppend = normalizeNewline(sourceContent);
  const existingNormalized = normalizeNewline(existingContent);

  if (existingNormalized.includes(contentToAppend)) {
    return;
  }

  const combined = existingNormalized + contentToAppend;
  await fsp.writeFile(excludeTargetPath, combined, "utf8");
}

async function resolveGitDir(startDir) {
  let current = startDir;

  while (true) {
    const gitPath = path.join(current, ".git");
    if (await pathExists(gitPath)) {
      const stat = await fsp.lstat(gitPath);
      if (stat.isDirectory()) {
        return gitPath;
      }
      if (stat.isFile()) {
        const content = await fsp.readFile(gitPath, "utf8");
        const match = content.match(/gitdir:\s*(.+)/i);
        if (match) {
          return path.resolve(current, match[1].trim());
        }
      }
      return null;
    }

    const parent = path.dirname(current);
    if (parent === current) {
      return null;
    }
    current = parent;
  }
}

async function copyDirContents(srcDir, destDir, options = {}) {
  const { excludeNames = [] } = options;
  await ensureDir(destDir);
  const entries = await fsp.readdir(srcDir, { withFileTypes: true });

  for (const entry of entries) {
    if (excludeNames.includes(entry.name)) {
      continue;
    }

    const srcPath = path.join(srcDir, entry.name);
    const destPath = path.join(destDir, entry.name);

    if (entry.isDirectory()) {
      await copyDirContents(srcPath, destPath, options);
      continue;
    }

    if (entry.isSymbolicLink()) {
      const linkTarget = await fsp.readlink(srcPath);
      await ensureDir(path.dirname(destPath));
      await fsp.symlink(linkTarget, destPath);
      continue;
    }

    await ensureDir(path.dirname(destPath));
    await fsp.copyFile(srcPath, destPath);
  }
}

async function main() {
  const targetDir = process.cwd();
  const excludeSourcePath = path.join(BASE_DIR, EXCLUDE_FILENAME);

  if (!(await pathExists(BASE_DIR))) {
    throw new Error(`Base directory not found: ${BASE_DIR}`);
  }

  await copyDirContents(BASE_DIR, targetDir, {
    excludeNames: [EXCLUDE_FILENAME],
  });

  const gitDir = await resolveGitDir(targetDir);
  if (gitDir) {
    await appendExcludeRules(excludeSourcePath, gitDir);
  }
}

main().catch((error) => {
  console.error(error.message || error);
  process.exitCode = 1;
});
