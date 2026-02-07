# madhavm.com Vision

Last updated: February 7, 2026

## Purpose
`madhavm.com` should feel like the online home of a serious, modern engineering leader with range.
The site is not a resume dump. It is a point-of-view website:
- technically credible
- visually intentional
- human and interesting
- honest about work and identity

## North Star
Build a site that makes strong people think:
"This person is thoughtful, technically serious, and genuinely curious about people."

## Non-Negotiables
1. Tell the truth.
2. No fake titles, fake employers, fake impact numbers, or fabricated projects.
3. Avoid self-degrading or stereotype-driven language.
4. Favor specificity over hype.
5. Every page should make Madhav sound like a person, not a corporate bio generator.

## Brand Positioning
- Core identity: Engineering leader for APIs, platform systems, and execution.
- Secondary identity: Interested in design craft, writing, architecture, and culture.
- Personality: calm, rigorous, direct, curious.
- Anti-personality: performative, defensive, try-hard, jargon-heavy.

## Design Philosophy
1. Editorial over "template dev portfolio"
- Use hierarchy, whitespace, and typography as the primary style system.
- Avoid neon hacker motifs and generic dark-theme startup aesthetics.

2. Minimal over decorative
- Keep UI chrome light: simple lines, restrained color, minimal component styling.
- Let writing and ideas carry the experience.

3. Quiet confidence
- Fewer claims, better claims.
- No chest-thumping language.

4. Motion with intent
- Default to no motion.
- Add animation only when it improves comprehension.

## Copy System
### Voice rules
- Use concrete nouns and verbs.
- Replace generic claims ("I build reliable products") with specific framing.
- Keep sentences short and readable.
- Sound like a thoughtful operator, not a brand account.

### Home page message hierarchy
1. Who Madhav is now.
2. Curiosities across tech, art, and people.
3. Brief work context without resume-style self-promotion.
4. How to contact.

### Preferred language patterns
- "I lead..."
- "I build..."
- "Focused on..."
- "I care about..."

### Avoid
- "world-class"
- "rockstar"
- "ninja"
- vague adjectives with no evidence

## Information Architecture
## Required sections on home
- Hero (identity + value proposition + CTA)
- Curiosities (tech, art, people)
- Work context (brief and factual)
- Contact

## Writing section
- Must contain real posts with useful insight.
- No placeholder content in production.
- Post quality target: practical + reflective + concrete.
- Agent posts should be text-first and markdown-native, with mermaid diagrams when useful.
- Avoid decorative images in agent posts unless they add unique explanatory value.

## Visual Direction
- Tone: warm editorial with precise engineering structure.
- Palette: light neutral base + restrained blue accent.
- Typography: expressive serif for headings + modern sans body + mono utility labels.
- Components: thin rules, plain lists, and restrained surfaces with almost no visual effects.

## Accessibility and UX Standards
1. Preserve contrast and readability.
2. Keep keyboard focus states clear.
3. Ensure mobile-first spacing and type scaling.
4. Respect `prefers-reduced-motion`.
5. Keep pages fast and static-first with Astro.

## Authenticity Policy
Use framing, not fiction.
- Good: choose stronger true examples, tighten language, improve narrative.
- Bad: fake employers, fake achievements, fake hobbies/personality.

If something sounds impressive but is not fully true, do not publish it.

## Reference Signals from Strong Portfolios
Observed patterns from notable portfolios (Notion/Figma/Apple-adjacent + top engineering personal sites):
- Clear one-line identity statement
- Tight scope (few, strong artifacts)
- Distinct typographic voice
- Simple navigation
- Real projects and writing linked directly
- Human details without oversharing

## Agent Instructions (Mandatory)
All coding agents working in this repo must do the following before making design or copy changes:
1. Read `/Users/madhav/Documents/madhavm/vision.md`.
2. Ensure proposed changes align with this document's Non-Negotiables, Design Philosophy, and Copy System.
3. If a change conflicts with this document, update `vision.md` first (with rationale) or do not ship the change.
4. For completed implementation requests, ship changes to production by default: commit, push to `main`, and verify live pages include the new content.
5. Mention vision alignment in PR/commit notes.

## Evolving This Vision
Update this document when:
- the site's visual direction changes,
- positioning changes,
- writing strategy changes,
- major content architecture changes.

Keep updates concise and explicit so future agents can execute quickly.
