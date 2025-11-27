# Content & Post Styling

<!-- AI Agent Quick Reference -->
## TL;DR
- **Scope**: `.post-content` class wraps all CMS/markdown content
- **Elements**: Links (aqua), blockquotes (gold border), tables, code blocks, images, lists
- **Rule**: All content elements use palette variables only
- **Headings**: Always `var(--gold-300)` (already defined globally)

---

## Overview

You must ensure that **links, blockquotes, tables, code blocks, images, dividers, and list text content all use palette variables**. This includes content rendered from Payload.

Create a scoped class `.post-content` (or similar) and style raw HTML elements inside it in `globals.css` or in a dedicated `PostContent.css` that the post detail page imports.

## Links

```css
.post-content a {
  color: var(--aqua-300);
  text-decoration: none;
  border-bottom: 1px solid color-mix(in srgb, var(--aqua-300) 40%, transparent);
}

.post-content a:hover {
  color: var(--aqua-200);
  border-bottom-color: var(--aqua-200);
}
```

## Blockquotes

```css
.post-content blockquote {
  border-left: 2px solid color-mix(in srgb, var(--gold-300) 50%, transparent);
  padding-left: 1rem;
  margin: 1.5rem 0;
  color: var(--neutral-d-100);
  background: linear-gradient(
    to right,
    color-mix(in srgb, var(--surface-glow-2) 40%, transparent),
    transparent
  );
}
```

## Tables

```css
.post-content table {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid var(--surface-border-soft);
  background: color-mix(in srgb, var(--ocean-900) 80%, var(--ocean-800));
}

.post-content th,
.post-content td {
  border: 1px solid var(--surface-border-soft);
  padding: 0.5rem 0.75rem;
  color: var(--neutral-d-100);
}

.post-content th {
  background: color-mix(in srgb, var(--ocean-700) 70%, transparent);
  color: var(--gold-300);
}
```

## Code Blocks

```css
.post-content pre {
  background: radial-gradient(circle at top left, var(--surface-glow-1), var(--ocean-900));
  border-radius: 0.75rem;
  border: 1px solid var(--surface-border-soft);
  padding: 1rem 1.25rem;
  color: var(--aqua-200);
}

.post-content code {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
}
```

## Images

```css
.post-content img {
  display: block;
  max-width: 100%;
  border-radius: 1rem;
  border: 1px solid var(--surface-border-soft);
  background: radial-gradient(circle at center, var(--surface-glow-2), transparent);
}
```

## Lists and Dividers

```css
.post-content ul,
.post-content ol {
  padding-left: 1.5rem;
  color: var(--neutral-d-100);
}

.post-content li::marker {
  color: var(--gold-300);
}

.post-content hr {
  border: 0;
  border-top: 1px solid color-mix(in srgb, var(--gold-300) 20%, transparent);
  margin: 2rem 0;
}
```

## Post Detail Page Example

File: `PostDetailPage.css`

```css
.post-detail-root {
  @apply max-w-3xl mx-auto py-12 md:py-16;
}

.post-detail-header {
  margin-bottom: 2rem;
  border-bottom: 1px solid var(--surface-border-soft);
  padding-bottom: 1.25rem;
}

.post-detail-title {
  @apply text-3xl md:text-4xl font-semibold tracking-tight;
  color: var(--gold-300);
}

.post-detail-meta {
  @apply text-sm;
  color: var(--neutral-d-400);
}

.post-detail-body {
  margin-top: 2rem;
}
```
