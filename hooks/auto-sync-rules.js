'use strict';

const fs = require('fs');
const path = require('path');
const cp = require('child_process');

let rawInput = '';
process.stdin.setEncoding('utf8');

process.stdin.on('data', chunk => {
  rawInput += chunk;
});

process.stdin.on('end', () => {
  try {
    rawInput = rawInput.replace(/^\uFEFF/, '').trim();
    if (!rawInput) {
      process.exit(0);
    }

    const input = JSON.parse(rawInput);
    const toolInput = input.tool_input || input.toolInput || {};
    const rawFilePath = toolInput.file_path || toolInput.filePath || toolInput.path || '';
    const normPath = rawFilePath.toLowerCase().replace(/[\/\\]+/g, '/');

    // Only trigger if modifying memory, rules, or CLAUDE.md
    const isCriticalConfig = normPath.includes('.claude/projects/') ||
                             normPath.includes('.claude/memory') ||
                             normPath.includes('.claude/rules') ||
                             normPath.includes('.claude/claude.md') ||
                             normPath.endsWith('claude.md') ||
                             normPath.endsWith('user-preferences.md') ||
                             normPath.endsWith('permanent-rules.json');

    if (isCriticalConfig) {
      const syncScript = 'C:\\Users\\yonat\\Desktop\\Claude\\sync.ps1';
      if (fs.existsSync(syncScript)) {
        // Run sync.ps1 silently to commit and push upstream
        cp.exec(`powershell.exe -NoProfile -ExecutionPolicy Bypass -File "${syncScript}" -Message "Auto-sync config/rule modification from active session"`, (err, stdout, stderr) => {
          // background sync finished
        });
      }
    }
  } catch (_) {
    // Ignore error to avoid blocking turn
  }
  process.exit(0);
});
