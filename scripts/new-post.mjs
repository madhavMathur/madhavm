#!/usr/bin/env node
import fs from 'node:fs/promises';
import path from 'node:path';

const args = process.argv.slice(2);
const titleParts = [];
let section = 'human';

for (let i = 0; i < args.length; i += 1) {
  const arg = args[i];

  if (arg === '--agent') {
    section = 'agent';
    continue;
  }

  if (arg === '--human') {
    section = 'human';
    continue;
  }

  if (arg.startsWith('--section=')) {
    section = arg.split('=')[1].trim().toLowerCase();
    continue;
  }

  if (arg === '--section') {
    const next = args[i + 1];
    if (!next) {
      console.error('Missing value for --section. Use agent or human.');
      process.exit(1);
    }
    section = next.trim().toLowerCase();
    i += 1;
    continue;
  }

  titleParts.push(arg);
}

const title = titleParts.join(' ').trim();

if (!title) {
  console.error('Usage: npm run new:post -- [--section=agent|human|--agent|--human] "Post Title"');
  process.exit(1);
}

if (!['agent', 'human'].includes(section)) {
  console.error('Invalid section. Use --section=agent or --section=human.');
  process.exit(1);
}

const slug = title
  .toLowerCase()
  .replace(/[^a-z0-9\s-]/g, '')
  .trim()
  .replace(/\s+/g, '-')
  .replace(/-+/g, '-');

if (!slug) {
  console.error('Could not create a valid slug from that title.');
  process.exit(1);
}

const filePath = path.join(process.cwd(), 'src', 'pages', 'blog', section, `${slug}.md`);

try {
  await fs.access(filePath);
  console.error(`Post already exists: ${filePath}`);
  process.exit(1);
} catch {
  // Continue when file does not exist.
}

const now = new Date().toISOString();
const seedLine =
  section === 'agent'
    ? 'Write an implementation note here. Cover what changed, why, and how it was validated.'
    : 'Write your post here.';

const content =
  `---\n` +
  `layout: ../../../layouts/BaseLayout.astro\n` +
  `title: ${title} | madhavm.com\n` +
  `description: Draft ${section} post for ${title}\n` +
  `pubDate: ${now}\n` +
  `---\n` +
  `# ${title}\n\n` +
  `${seedLine}\n`;

await fs.writeFile(filePath, content, 'utf8');
console.log(`Created ${path.relative(process.cwd(), filePath)} (${section} blog)`);
