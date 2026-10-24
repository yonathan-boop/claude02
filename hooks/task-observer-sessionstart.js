'use strict';

const fs = require('fs');
const path = require('path');

const userHome = process.env.USERPROFILE || process.env.HOME || 'C:\\Users\\yonat';
let obsDir = path.join(process.cwd(), 'skill-observations');
if (!fs.existsSync(obsDir)) {
  obsDir = path.join(userHome, 'skill-observations');
}

const logPath = path.join(obsDir, 'log.md');
let openCount = 0;
let highestObs = 0;

if (fs.existsSync(logPath)) {
  try {
    const content = fs.readFileSync(logPath, 'utf8');
    const obsMatches = [...content.matchAll(/### Observation (\d+):/g)];
    if (obsMatches.length > 0) {
      highestObs = Math.max(...obsMatches.map(m => parseInt(m[1], 10)));
    }
    const openMatches = content.match(/\*\*Status:\*\*\s*OPEN/g);
    if (openMatches) {
      openCount = openMatches.length;
    }
  } catch (_) {}
}

const context = [
  '# TASK OBSERVER ACTIVE (Always-On Mode)',
  '',
  'Task Observer is actively monitoring this session from turn 1.',
  `- Observations directory: ${obsDir}`,
  `- Open observations: ${openCount}`,
  `- Highest observation ID: #${highestObs}`,
  '',
  '## Operational Protocol:',
  '1. Active Monitoring: Silently monitor tool execution, user corrections, edge cases, and reusable workflows throughout the session.',
  '2. Silent Logging: When a pattern, correction, or insight occurs, append it silently to skill-observations/log.md using the standard format (### Observation N: ...).',
  '3. Mandatory Pre-Logging Check: Always check the highest observation number in log.md before writing new entries to avoid collisions.',
  '4. End-of-Session Surfacing: Group and surface observations at session end or handoff boundaries. Hand off to skill-creator when formalizing new skills.'
].join('\n');

const output = {
  hookSpecificOutput: {
    hookEventName: 'SessionStart',
    additionalContext: context
  }
};

process.stdout.write(JSON.stringify(output));
process.exit(0);
