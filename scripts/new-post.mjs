#!/usr/bin/env node
import fs from 'node:fs/promises';
import path from 'node:path';

const title = process.argv.slice(2).join(' ').trim();

if (!title) {
  console.error('Usage: npm run new:post -- "Post Title"');
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

const filePath = path.join(process.cwd(), 'src', 'pages', 'blog', `${slug}.md`);

try {
  await fs.access(filePath);
  console.error(`Post already exists: ${filePath}`);
  process.exit(1);
} catch {
  // Continue when file does not exist.
}

const now = new Date().toISOString();
const content = `---\nlayout: ../../layouts/BaseLayout.astro\ntitle: ${title} | madhavm.com\ndescription: Draft post for ${title}\npubDate: ${now}\n---\n# ${title}\n\nWrite your post here.\n`;

await fs.writeFile(filePath, content, 'utf8');
console.log(`Created ${path.relative(process.cwd(), filePath)}`);
