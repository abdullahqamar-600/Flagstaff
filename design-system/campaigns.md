# Campaigns — Design System

A working reference for anyone designing or building inside the Campaigns module. This document is scoped to Campaigns specifically; for the app-wide design language see [design-language.md](./design-language.md).

> **Status.** Living document — updated as the module grows. When you make a decision that others should follow, add it here. When a rule turns out to be wrong, revise it — don't paper over.
>
> **Scope.** The visual language documented here originated with the Campaigns module but is now **shared** with the Home dashboard — both use the same shell (backdrop, sidebar treatment, topbar, panel), the same header pattern, and the same card treatments. Any new *primary dashboard* surface (Scheduler, Analytics) should adopt the same shell unless it has a specific reason not to.
>
> Onboarding, the Scout conversation, and the splash are governed by [design-language.md](./design-language.md) — they remain in the earlier visual language on purpose (they're conversational, not managerial).
>
> **Reference sources.**
> - `Campaigns Dashboartd.png` — the canonical mockup for the list view.
> - Figma CSS spec (1440px screen) — the tighter design token layer.
> - This file — where the two meet and where extensions live.
> - [`design-system/references-patterns.md`](./references-patterns.md) — catalogue of every UI pattern derived from `References/` (Figma exports), with purpose / when-to-use / anatomy / do-don't per pattern. Consult this before adding a new component to the module.
> - [`designs/campaign-components.html`](../designs/campaign-components.html) — visual spec sheet for every component below.
> - [`designs/_campaigns-components.css`](../designs/_campaigns-components.css) — the shared stylesheet. Import this to use any component from §3.7 onward.

---

## 1. Design Intent

Campaigns is a **management surface**, not a conversation. It's where the user comes to see what's scheduled, what's in review, what's live — and to take action across many posts at once. The tone is quieter than the onboarding/Posts conversation with Scout.

**Three principles:**

1. **Panel over page.** The module lives inside a floating, translucent white panel on a soft gray canvas — like a document on a desk. Chrome (nav, breadcrumb, account) reads as environment; the panel reads as the work.
2. **Status is a first-class citizen.** A campaign's approval state is the primary signal on any card, row, or drawer. Never hide status behind hover.
3. **No Scout in the chrome.** Scout speaks when creating or refining a campaign, but the list, detail, and management surfaces are silent. The user is in charge here.

---

## 2. Tokens

### Colors — module-specific

| Token | Value | Where |
|---|---|---|
| Canvas | `#ECECEC` | Body background beneath the panel (exposed as `--camp-surface-canvas`) |
| Panel surface | `rgba(255, 255, 255, 0.4)` | The floating content panel (exposed as `--camp-surface-panel`; paired with `backdrop-filter: blur(2px)`) |
| Panel radius | `24px` | Panel corners (exposed as `--camp-radius-panel`) |
| Ambient violet blob | `#E0E1FF` @ blur 160px, rotate 73° | Bottom-left atmospheric fill |
| Ambient indigo blob | `#545BD1` @ 30% opacity, blur 140px | Bottom-left atmospheric fill |
| Nav pill (inactive) | `#F5F5F5` bg, `#263238` icon | Sidebar nav buttons |
| Nav pill (active) | `#545BD1` bg, `#FFFFFF` icon | Sidebar nav buttons |
| Topbar icon-btn | `rgba(255, 255, 255, 0.4)` bg | Search, bell |
| Notification dot | `#F44336` | Bell unread indicator |

### Colors — status badges

Each state has a **bg + border + text** trio. Border and text share the same hue family; bg is the palest tint. Do not mix hues across the trio.

| Status | bg | border | text |
|---|---|---|---|
| In Draft | `#F4F3FF` | `#D9D6FE` | `#5925DC` |
| In Review | `#FFFAEB` | `#FEDF89` | `#B54708` |
| In Progress | `#EFF8FF` | `#B2DDFF` | `#175CD3` |
| Published | `#ECFDF3` | `#ABEFC6` | `#067647` |
| Revision Requested | `#FEF6EE` | `#F9DBAF` | `#B93815` |
| Rejected | `#FEF3F2` | `#FECDCA` | `#B42318` |

### Module tokens — `--camp-*`

The component stylesheet [`_campaigns-components.css`](../designs/_campaigns-components.css) defines an additive layer of module tokens on `:root`. All components below read from these — do NOT bury a raw hex inside a component. If you need a value that isn't in this table, add a `--camp-*` token first.

| Token | Value | Where |
|---|---|---|
| `--camp-primary` | `#545BD1` | Primary buttons (`.btn-create`), active tab underline (`.camp-tab--active`), selected calendar day, location chip text |
| `--camp-primary-hover` | `#4848E0` | Primary hover state (`.btn-create:hover`) |
| `--camp-primary-tint` | `#EEEFFA` | Analytics tile bg, location chip bg, `.postrow__go` |
| `--camp-primary-tint-cool` | `#EEF2F6` | Audience chip bg, selected time-cell bg |
| `--camp-primary-tint-hover` | `#DFE1F5` | `.postrow__go` hover |
| `--camp-text-primary` | `#263238` | Titles, values |
| `--camp-text-secondary` | `#4B5565` | Labels, meta |
| `--camp-text-tertiary` | `#697586` | Muted values, out-of-month dates |
| `--camp-text-quiet` | `#4E4E5B` | Post body copy, comment body |
| `--camp-text-support` | `#455A64` | Confirmation modal description |
| `--camp-text-code` | `#202939` | Selected time-cell text |
| `--camp-text-strong` | `#282828` | X-post author name, refine-button text |
| `--camp-text-modal-title` | `#344054` | Confirmation-modal cancel button text |
| `--camp-surface` | `#FFFFFF` | Cards (`.camp-card`), drawers, modals, `.acct-switch`, `.btn-create` text |
| `--camp-surface-panel` | `rgba(255,255,255,0.4)` | Floating dashboard panel (`.campaigns-panel`); pair with `backdrop-filter: blur(2px)` |
| `--camp-surface-field` | `#F8FAFC` | `.cfield` background |
| `--camp-surface-hover` | `#F5F7FA` | Icon-button hover, cancel-button hover |
| `--camp-surface-comment` | `#F4F4F4` | Comment bubble bg |
| `--camp-surface-canvas` | `#ECECEC` | Panel-behind canvas |
| `--camp-surface-today` | `#F9FAFB` | Date-picker "today" pill |
| `--camp-surface-logo-tile` | `#000000` | 24×24 black logo tile inside `.acct-switch__x` (7px radius). Do NOT reuse elsewhere — this is scoped to the account chip. |
| `--camp-border` | `#ECEFF1` | Modal dividers, calendar column separator |
| `--camp-border-input` | `#D0D5DD` | Inputs, selects |
| `--camp-border-subtle` | `#EBEBEB` | Compose input, refine-button outline |
| `--camp-border-quiet` | `#EEEEEE` | Refine-button outline (v2) |
| `--camp-status-progress-*` | see §2 status table | Any surface showing "In Progress" or "In Review" state |
| `--camp-skeleton` | `rgba(0,0,0,.08)` | Loading skeleton bars |
| `--camp-tag` | `#0077B5` | Hashtag color |
| `--camp-verified` / `--camp-verified-x` | `#21C8F2` / `#1D9BF0` | Verified badges (drawer / X card) |
| `--camp-shadow-post` | `4 4 64 rgba(33,50,113,.08)` | `.xpost` card |
| `--camp-shadow-drawer` | `-18 0 40 -14 rgba(38,50,56,.16)` | `.drawer` |
| `--camp-shadow-dtp` | `0 0 72 4 rgba(0,0,0,.12)` | `.dtp` |
| `--camp-shadow-dtp-cal` | shadow-xl | `.dtp__cal` |
| `--camp-shadow-menu` | shadow-sm | `.ddmenu` |
| `--camp-shadow-modal` | shadow-lg | `.cfm` |
| `--camp-shadow-modal-lg` | 20 40 -12 rgba(16,24,40,.16) + | `.fbmodal` |
| `--camp-shadow-btn-xs` | `0 1 2 rgba(16,24,40,.05)` | Primary buttons |
| `--camp-shadow-btn-glow` | `0 0 16 rgba(0,0,0,.06)` | `.fbmodal` cancel |
| `--camp-shadow-chip` | `0 4 4 rgba(0,0,0,.06)` | `.cfm__chip--purple` |
| `--camp-radius-modal` | `12px` | Modals, cards, fields |
| `--camp-radius-modal-round` | `18px` | `.fbmodal` (uses larger radius on purpose) |
| `--camp-radius-btn` | `8px` | Buttons |
| `--camp-radius-pill` | `9999px` | Pills, avatars, calendar day cells |
| `--camp-radius-menu-item` | `6px` | `.ddmenu__item-inner` |
| `--camp-cfm-*` | gradient, ring, chip colors | **Only** inside `.cfm` hero — do not reuse |
| `--font-x-preview` | `'Outfit', …` | `.xpost` and any other X-mirroring surface |

### Type — module-specific overrides

Family is SF Pro Display (inherits from `design-language.md`). Roles below override the MUI scale where the CSS spec diverges from it.

| Role | Size / Line / Weight | Color | Where |
|---|---|---|---|
| Page title | 22 / 27 / 500, letter-spacing 0.25px | `#263238` | "Campaigns" |
| Page subtitle | 14 / 21 / 400, letter-spacing 0.15px | `#4B5565` | Description below title |
| Filter tab | 16 / 24 / 500 | `#697586` inactive, `#545BD1` active | Tab strip |
| Tab count badge | 14 / 14 / 500 | `#FFFFFF` on `#4B5565` | The dark-gray count pill |
| Card title | 16 / 20 / 600 | `#263238` | Campaign name on card |
| Card description | 14 / 17 / 400 | `#4E4E5B` | 2-line clamped preview |
| Card meta | 12 / — / 400 (500 for emphasis) | `#4B5565` | Date, posts, comments |
| Card timestamp | 12 / — / 400 | `#919DAE` | Right-aligned created-at |
| Card status pill | 12 / 18 / 500 | see status table | Approval-state badge |
| Breadcrumb | 16 / — / 500 | `#4B5565`, `#545BD1` for current | Topbar left |

### Layout

| Token | Value | Notes |
|---|---|---|
| Viewport target | 1440px | Design is authored at this width; lower widths degrade gracefully |
| Sidebar column | 80px | Widened from the 72px used in onboarding |
| Sidebar nav pill | 44×44, radius 32px | All primary + footer buttons |
| Sidebar padding | 16px top, 24px bottom, 0 sides | Container |
| Sidebar nav gap | 12px | Between pill buttons |
| Sidebar group gap | 28px | Between logo and nav, between nav and footer |
| Topbar height | 66px | 12px vertical, 24px horizontal padding |
| Topbar round button | 42×42, radius 24px | Search, bell |
| Topbar gap | 14px | Between right-side elements |
| Panel offset | 25px on right and bottom, 0 on top-left | Panel hugs the topbar and sidebar |
| Panel padding | 16px top, 24px sides, 0 bottom | Content inside the panel |
| Panel section gap | 16px | Header → tabs → grid |
| Card grid | `repeat(2, minmax(0, 1fr))` | 2 columns at 1440px |
| Card grid gap | 16px | Horizontal + vertical |
| Card padding | 16px | All sides |
| Card interior gap | 12px | Between rows inside a card |
| Card radius | 12px | No border |
| Button height | 44px | Create, account chip |
| Button radius | 8px | Create, account chip |
| Input/badge radius | 9999px | All status pills, count badges |

### Motion

Inherit from the app's motion tokens (`--duration-fast: 140ms`, `--ease-standard`). Two module-specific patterns:

- **Panel enter.** `fadeUp` at 360ms, emphasized easing. Runs once when Campaigns mounts.
- **Filter switch.** Cards do not animate on filter change — instant swap. Filtering is a *find* action, not a state change to celebrate.

---

## 3. Component patterns

### 3.1 Campaign card (`.camp-card`)

The atomic unit of the list view. One card = one campaign.

**Anatomy (top to bottom):**

1. **Head** — campaign title (16/600, one-line ellipsis) + kebab menu (top-right, 22×22 hit target, 16×16 icon).
2. **Description** — 14/400, 2-line clamp, `#4E4E5B`.
3. **Meta row A** — date range (`[cal icon] 07 May 2026 - 15 May 2026`) on the left, `Posts N` on the right.
4. **Meta row B** — status badge on the left, `[red dot] N Comment` on the right.
5. **Divider** — 1px `#EDEEF2` hairline.
6. **Footer** — avatar (20×20) + author handle on the left, timestamp on the right.

**Do**
- Show the status badge prominently. It's the fastest read on the card.
- Keep the description to two lines and let it truncate — the detail view is where full copy belongs.
- Preserve the divider even if the footer is quiet — the visual break separates *the campaign* from *when someone created it*.

**Don't**
- Nest cards inside cards. Campaign cards are terminal — they open the detail view.
- Use hover to reveal information (dates, author, comments). Everything meaningful stays visible.
- Introduce a border. Cards distinguish themselves by the 12px radius and shadow-on-hover, not a line.

### 3.2 Status badge (`.camp-status--*`)

A pill with a colored bg, matching border, and text in the same hue family. Six variants (see table above).

**Do**
- Use the same badge component for the status *anywhere it appears* — card, detail header, filter tab count, activity log.
- Keep the label short (max ~18 chars). "Revision Requested" is at the edge — anything longer needs a shorter phrasing.

**Don't**
- Invent new statuses without adding them to the color table above.
- Use these color families for anything that isn't approval-state (e.g., don't reuse `#F4F3FF` for a "beta" flag).
- Remove the border. The border is what keeps the badge visible on the translucent panel.

### 3.3 Filter tab strip (`.campaigns__tabs`)

Left-aligned, 16px gap between tabs. Active tab has 2px indigo underline + indigo text. Optional count badge (dark-gray pill) sits to the right of the label.

**Do**
- Order tabs by workflow flow: `All → In Review → In Draft → Published → In Progress → Revision Requested → Rejected`. Left is neutral, middle is pending, right is terminal.
- Show a count badge only when a state has non-zero campaigns. Zero-count states are quiet.

**Don't**
- Wrap tabs to multiple lines. If they overflow, the container scrolls horizontally (already implemented via `overflow-x: auto`, scrollbar hidden).
- Style the badge with the status color family. The tab-count badge is always neutral gray — the status colors are for the state itself, not for counting.

### 3.4 Page header (`.campaigns__header`)

Title + subtitle stack on the left; account chip + Create button on the right. Aligned to top (`align-items: flex-start`) so buttons and title share a top edge.

**Do**
- Keep the subtitle at ~1 sentence describing what this dashboard covers. It's a wayfinding aid, not marketing copy.
- Put page-level filters (like an account switcher) here — not in the topbar. The topbar's account is workspace-level; the header's account is content-level (which X handle we're viewing).

**Don't**
- Add tabs, chips, or search to the header row. Those go below, in their own strip.
- Push the Create button somewhere else (FAB, kebab). Create is the module's primary action — always visible, always top-right.

### 3.5 Sidebar in campaigns mode

The onboarding-era sidebar (72px, sunken bg, 40px icon-only buttons) is *replaced* when `body.mode-campaigns` is set: 80px column, transparent bg, 44×44 pill buttons on `#F5F5F5`, active pill flips to solid `#545BD1` with a white icon.

**Do**
- Add nav items using the `sidebar__btn--campaigns-only` class if they should appear only in this module. Add `sidebar__btn--onboarding-only` for the inverse.
- Keep the icon set consistent with the rest of the app's line-icon family (1.3–1.5px stroke, rounded joins).

**Don't**
- Change the active-pill color per module. Indigo `#545BD1` is the app-wide "you are here" signal.
- Introduce nav labels. The sidebar is icon-only by design; use the button's `title` attribute for tooltip fallback.

### 3.6 Home dashboard content

The Home surface uses the same shell as Campaigns, but the *content* pattern is different — it's an overview, not a list. Three blocks stack vertically inside the panel:

1. **Stat strip (`.home-stats`)** — 4 stat cards in a row on wide screens (2 on 1200px, still 1 per column on mobile). Each is a white 12px-radius tile with an uppercase label (12/500), a big value (28/600), and a small delta line. Delta text uses the campaign status color families (`--draft`, `--progress`, `--review`, `--published`) so at-a-glance color tells you which direction the number is trending.
2. **Two-column card row (`.home-two-col`)** — a paired layout for wider recap cards. Currently: **Recent activity** (a list of who-did-what) on the left, **Scout's next moves** (a stack of nudge cards on a subtle indigo→violet gradient) on the right. The gradient is the *only* Scout-authorship signal on this dashboard — no avatars, no Scout speech bubbles.
3. Any future "detail below the fold" content follows the same 12px card, 16px padding rhythm.

**Do**
- Keep stat labels short (2-3 words) and always uppercase. The value is the loudest thing on the tile.
- Reserve the gradient background (`.home-suggestion`) for *Scout-authored* nudges. If the user or another human authored something, don't gradient it.
- Use `home-activity__actor--scout` (indigo→violet gradient) vs. `home-activity__actor--user` (solid `#263238`) to distinguish who did what in the activity log.

**Don't**
- Replace stat tiles with dense charts. This dashboard is a *glance*, not a report. Dense charts belong in Analytics.
- Add more than one Scout-branded gradient element per screen. The gradient is a spotlight — overusing it dilutes the signal.
- Introduce a distinct "Home" header color or type. The header pattern (`.campaigns__header` and its parts) is the same class family across dashboards. Only the *content* — title text, subtitle text, and rendered stats — is home-specific.

### 3.7 Topbar in campaigns mode

Left: breadcrumb (16/500, current in indigo). Right, in order: **account switcher** (workspace-level, e.g. "PepsiCo, Inc.") → **search** (42px round) → **bell** with red-dot indicator → **avatar + chevron**. 14px gap between elements.

**Do**
- Keep the round icon-buttons at `rgba(255, 255, 255, 0.4)` translucent bg. This is the *only* place in the app where controls read as glass — it's how the module says "we're floating on a canvas."
- Show the red notification dot only when there's an unread notification. Empty state is a bare bell.

**Don't**
- Add a search input inline. The 42px round button opens a search overlay/palette; the header stays quiet.
- Show both the campaigns-mode user avatar and the onboarding-mode `.profile-chip` at once. The body class handles the swap — trust it.

### 3.8 Campaign detail — two-column conversation + canvas (`.detail-two-col`)

The canonical surface for **any** campaign the user clicks into — running, upcoming, in-draft, in-review. Replaces the earlier side-panel idea. This is the only detail pattern; the dashboard is the only list pattern.

**Structure.** Inside the panel, the detail splits into two vertical columns:

- **Left column (`.detail-conv`) — 440px, fixed.** A conversation with Scout, scoped to this campaign. Composer sticky at the bottom; scrollable message history above. Every Scout narration, every user steer, every scoped-regen dialogue lives here.
- **Right column (`.detail-canvas`) — fluid.** The work-in-progress: plan chips, drafts, image slots, CTA chips, schedule. This is where the *artifact* lives; the left is where the *reasoning* lives.

**Independent scroll.** Left and right scroll separately. A long chat history doesn't drag the canvas up; a long draft list doesn't scroll the conversation. Both columns own their own overflow.

**Composer.** Sticky at the bottom of the left column. Ghost-tag classifies intent · steer · question live. Slash commands (`/ask`, `/steer`, `/new`) override. Composer is the *only* place free-text goes — everything else is chip edits or option-primitive picks (see §3.9).

**Running variant.** When the campaign is live, the right canvas gets a compact **live summary strip** (`.detail-live`) above the plan block:

```
LIVE · Reach 14.2k · Replies 128 · Next post Tue 10am (in 3h)
```

- Height matches the plan header row (~32px).
- Never becomes a chat notification. If Scout has something urgent to say about a live event ("post 1 is 3× baseline — want a companion thread?"), that goes into the conversation as a normal Scout turn.
- Read-only. Actions on the live campaign happen through chips and options, not through the summary.

**Do**
- Keep the ratio fixed. Chat has a natural readable width; if the left column grows past ~440px it just wastes room on chrome. The right does the work — give it the elastic space.
- Preserve the composer's ghost-tag classifier across the entire detail view. If the user types anywhere in the composer, Scout should classify the intent the same way as in Phase 1.
- Use the option primitive (§3.9) for any decision Scout genuinely can't resolve on its own. Chip edits without ambiguity should just execute.

**Don't**
- Nest a second right-rail side panel inside this view. Two columns is the whole surface. If a modal is needed for a deep action (image crop, regenerate scope picker), use a real modal overlay — not a third column.
- Push chat notifications into a corner toast. If Scout wants attention, it speaks in the conversation column. Nowhere else.
- Duplicate content across columns. Drafts render on the right; the left may *reference* a draft ("Post 3 came out pushier — soften?") but doesn't repeat it inline.

### 3.9 Option primitive — ambiguity resolver (`.opt-group`, `.opt-card`)

A reusable component for the moments when Scout **cannot resolve a decision on its own**. This is not a preference picker; it is not "which do you like better?" It surfaces only at genuine forks — mixed-quality photos, tone requests that conflict with the KB, schedule slots that miss the peak window, pattern promotions that need user judgment.

**Firing rule.** Scout is confident by default. It picks, executes, and narrates. Options surface **only** when:

1. The user did something Scout can't reconcile without judgment (uploaded 4 photos, one off-brand).
2. A KB event needs an explicit human decision (a pattern crossed n=3, ready to promote).
3. A chip edit has multiple plausible downstream effects (change the audience — does the tone follow?).
4. A scoped-regen offers meaningfully different paths (regenerate just Post 3, or the whole tail?).

Everything else, Scout just does. If you find yourself surfacing options for "which tone do you prefer?" the answer is wrong — pick the KB-consistent tone and narrate.

**Anatomy — every option carries four things:**

1. **Label** (1–4 words, plain-cap): `"Warm-urgent"`, `"Skip that photo"`, `"Move to Tue 10am"`.
2. **Preview / value** — one line, may include a mini render (a chip cluster, a photo thumb, a schedule slot). Optional if the label carries the meaning.
3. **Why · [5–10 words]** — cites the KB, a pattern, or a hard constraint: `"Why · Matches your March campaign that hit 2.1× replies."`
4. **If you pick this · [1 sentence]** — the concrete implication: `"If you pick this · I'll shift Post 3 to Sat and rewrite the CTA."`

**Recommended pill.** Exactly one option carries the `Recommended by Scout` pill (indigo border + small pill top-right). No preselection — the user must click. Recommended options can be non-obvious — the pill is Scout's judgment, not a UI default.

**Custom fallback.** There is no "Other" option card. The composer at the bottom of the left column is the custom affordance. If none of the options fit, the user types their steer.

**Two densities:**

- **Inline (`.opt-group--inline`)** — sits in the left conversation, right under a Scout message. Cards are ~200–280px wide, stacked or 2-across. Used for quick forks (schedule slots, tone tweaks, CTA kinds).
- **Canvas (`.opt-group--canvas`)** — sits on the right canvas, side-by-side. Cards are wider (~320–400px each), more preview real estate. Used for higher-stakes forks (draft variants, image variants, campaign-level choices in Phase 1 curated).

**Behavior:**

- Click a non-recommended → Scout narrates the tradeoff in the conversation: `"Fair — that's the more conservative choice. I'll shift Post 3 accordingly."`
- Click the recommended → Scout confirms briefly and moves on.
- Options that would violate a guardrail are shown with a red border and a `Blocked · why` line instead of `Recommended`.

**Do**
- Cite the KB in the `Why` line whenever possible. `"Matches your Q2 warm-portrait moodboard"` is stronger than `"Matches your style"`.
- Order options by Scout's ranking — most-recommended first. Never alphabetical.
- When a user picks a non-recommended option twice in a row for the same class of decision, log it. That's a signal the KB is drifting and the pattern-findings section should get a `watching` entry.

**Don't**
- Fire options for aesthetic preference. Pick and narrate.
- Show more than 4 options. If the tree branches wider than that, the decision is too big for a chip-scale choice — open a scoped-regen dialog on the canvas instead.
- Preselect the recommended option or hide the others. Agency is preserved by *the user's click*.
- Reuse this component for confirmation dialogs (`"Are you sure?"`). Those are modals, not option groups.

### 3.10 Approval side drawer (`.drawer`)

Right-side drawer opened from any post in a campaign for review. Two visible variants share the shell:

- **v1 — approval + comments.** Post preview at top, `Refine Post` action, comment thread + write-a-comment input at bottom.
- **v2 — post-publish analytics.** Same shell, but the comment block is replaced by a hashtag row, a 1-big + 2-small image grid, an author/date meta row, and a Post Analytics tile grid (§3.12).

**Anatomy.** `.drawer` (407×876, `--camp-surface`) → `.drawer__inner` (359w, centered) → `.drawer__titlerow` (title + close) → `.drawer__body` (author row, copy, media) → optional actions (`.drawer__refine`) → optional `.drawer__comments` OR `.analytics` block.

**Do**
- Reuse the shell. Both v1 and v2 use the same `.drawer` + `.drawer__inner`. Vary the content, not the container.
- Keep the close-X on the same row as the title. Height is 24px; the X is the only affordance on the right.
- Use `--camp-verified` on the drawer author row and `--camp-verified-x` on the X-card. They're different blues on purpose — the X card is X's official blue, the drawer's is a warmer Scout blue.

**Don't**
- Nest the drawer inside a panel. It anchors to the viewport, not to any content block.
- Swap the post image for the analytics grid — v1 keeps the image *and* the comment block; v2 is a distinct read state.

### 3.11 Generated post — X card (`.xpost`)

Preview surface for a scheduled or drafted X post inside a campaign detail view. The layout mirrors X (Twitter) so authors preview what actually publishes.

**Anatomy.** `.xpost` (421w, 24px radius, `--camp-shadow-post`) → `.xpost__body` = 40×40 avatar + `.xpost__main` (name/verified/handle/date + kebab, post text, image). Optional `.xpost__footer` with `Draft` / `Schedule` / `Post` actions.

**Typography.** The whole card uses `--font-x-preview` (`'Outfit', …`) — it's the only place in the app that mirrors X's type. Do not swap it for SF Pro.

**Loading state.** Reuse the same shell with the modifier `.xpost--loading`. Avatar hides, header collapses to a `.skeleton` chip + kebab, body renders three `.xpost__skeleton-lines` at 100% / 81% / 50%. See §3.11a.

**Do**
- Keep the kebab as three static gray dots (not the app's `.i-kebab` symbol). It's decoration on X's post, not an active menu.
- Preserve the 8px top-margin on `.xpost__footer` when it's present — it establishes a beat before the actions.

**Don't**
- Use `.xpost` for any non-X preview surface. If the post is for another network, create a sibling class (`.li-post`, `.ig-post`) rather than parametrizing the X card.
- Style the image with a shadow. X posts sit flat; the shadow is on the card container.

#### 3.11a Loading skeleton (`.xpost--loading`, `.skeleton`)

A reusable pulsing tile at `--camp-skeleton`, 3px radius, 1.4s ease-in-out. Wrap it in `.xpost--loading` for the post-card null state; use `.skeleton` on its own for other loading strips.

**Do**
- Keep the pulse subtle (opacity 0.45 → 0.85). Aggressive skeletons feel like a broken page.
- Use skeleton widths that suggest text length (100% / 81% / 50%) rather than uniform bars. The card feels alive even at rest.

**Don't**
- Animate the skeleton with a moving gradient wipe. The app's motion language is calm; a wipe reads as anxious.

### 3.12 Campaign detail panel (`.cpanel` + `.cfield`)

Plan-and-configure surface. Title + status badge, six field cards (Objective / Audience / Categories / Timeline / Locations / Notes), sticky footer with Save-as-Draft + Run.

**Anatomy.**
- `.cpanel` (421w, 12px radius, `--camp-surface`) → `.cpanel__inner`
- `.cpanel__head`: title (28/500) + `.cpanel__badge` (In Progress family) + `.cpanel__kebab`
- `.cpanel__fields`: stack of `.cfield` (12px pad, `--camp-surface-field`, 12px radius). Each has `.cfield__icon` (18×18, `--camp-text-secondary`) + `.cfield__body` (`.cfield__label` + `.cfield__value` | `.cfield__chips` | `.cfield__value-loc`).
- `.cfield--split` for two side-by-side fields (Categories + Timeline).
- `.cpanel__foot`: `.cpanel__btn-draft` (transparent) + `.cpanel__btn-primary` (`--camp-primary`).

**Chip flavors.** Audience uses `.cfield__chip` (grey `--camp-primary-tint-cool`). Locations use `.cfield__loc` (indigo `--camp-primary-tint` bg + `--camp-primary` text) — that's the *only* place the indigo pill appears; audience segments are neutral because they're facts, not choices.

**Do**
- Order fields: Objective → Audience → (Categories + Timeline split) → Locations → Notes. This mirrors the mental model of "who + when + where + how."
- Keep field labels short (1 word wherever possible). The label is the field's role; the value carries the content.

**Don't**
- Wrap the whole `.cpanel__foot` when horizontal space tightens. Both buttons stay on one row — if the surface can't hold them, the panel is too narrow for a detail view.
- Add a border to `.cfield`. Its separation from the panel comes from the `--camp-surface-field` fill, not from an outline.

### 3.13 Post Analytics grid (`.analytics`)

Six-tile metric grid rendered inside a drawer or detail panel after a post publishes.

**Anatomy.** `.analytics__title` (16/500 `--camp-text-primary`) → `.analytics__grid` (vertical, 6px gap) → six `.analytics__tile` (8px radius, `--camp-primary-tint`) each with `.analytics__tile-label` (13/400, 60% black) and `.analytics__tile-value` (16/500, 87% black + optional `.analytics__tile-delta` in `--success-main`).

**Do**
- Keep tiles at fixed count (6). Likes / Repost / Replies / CTR / Engagement / Conversion is the canonical order.
- Use `--success-main` (green) for a positive delta only. Negative deltas need a distinct pattern — decide before shipping the negative case.

**Don't**
- Use `--camp-primary-tint` for anything that isn't an analytics tile or a location chip. It's the module's "quiet indigo wash" and losing that visual consistency dilutes the reading.

### 3.14 Horizontal post row (`.postrow`)

Compact list row for text-only scheduled posts inside a campaign.

**Anatomy.** `.postrow` (842×135, 12px radius) → `.postrow__grip` (24px gutter, drag dots) → `.postrow__cell` (main content). Inside the cell: `.postrow__row` (header + status/minus) + `.postrow__foot` (attachments chip + circular `.postrow__go`).

**AI badge.** `.postrow__ai-badge` is a 20px circle with the indigo→violet gradient `linear-gradient(295.57deg, #A448F9 2.63%, #3944FF 79.1%)`. Reserved for surfaces that indicate Scout-generated content. Same rules as the Home dashboard's Scout-authored gradient (§3.6): one per row, do not re-skin.

**Do**
- Reserve the 24px left gutter for the drag grip even when drag isn't wired up yet. The visual convention says "this can move" before the interaction lands.
- Keep the copy to two lines with a clamp — the row is a summary, not a detail.

**Don't**
- Swap `.postrow__ai-badge` for a text label ("AI"). The badge is intentionally quiet; typography would over-explain.

### 3.15 Date + time picker (`.dtp`)

Modal opened from any timeline / schedule field. Calendar left, three-column time picker right.

**Anatomy.**
- `.dtp` (516w, 12px radius, `--camp-shadow-dtp`) → `.dtp__head` + `.dtp__body` + `.dtp__foot`.
- `.dtp__cal` (328w) has its own shadow layer (`--camp-shadow-dtp-cal`) so the calendar visually lifts off the time picker without a hard border.
- Days grid: 7 columns × 6 weeks + weekday header row. Cells at 40×40, radius pill.
- Cell states: default, `.dtp__day--muted` (out-of-month), `.dtp__day--selected` (indigo fill), `.dtp__day--today` (`--camp-surface-today` fill), `.dtp__day--has-event` (dot below the number).
- `.dtp__time` columns: hours / minutes / AM-PM. Cells at 44×44, radius 4. Selected cell uses `--camp-primary-tint-cool`.

**Do**
- Use `--font-x-preview` (`'Outfit'`) on time cells and the selected day. Not for stylistic parity with X — it's simply the numeric weight that reads best at these sizes in the picker.
- Show the event dot at the bottom of the day cell, not inside a badge. The badge would compete with the day number.

**Don't**
- Combine "today" and "selected" states visually. If today *is* the selected day, `.dtp__day--selected` wins — do not stack the two backgrounds.

### 3.16 Dropdown options menu (`.ddmenu`)

Anchored options menu — the app's default for kebab and inline dropdowns.

**Anatomy.** `.ddmenu` (320w, 12px radius, `--camp-shadow-menu`, 4px vertical padding) → `.ddmenu__item` → `.ddmenu__item-inner` (10/10/10/8 padding, 6px radius on hover) → 20×20 line icon + label (14/500).

**Do**
- One line-icon per row, always. Icons in the sprite must be 20×20 line-weight (1.66667px stroke) to match `#i-file-check` / `#i-columns` / `#i-x-square`.
- Keep row height 46px. Shorter feels cramped; taller reads as a nav list.

**Don't**
- Add supporting text under the label. If a row needs explanation, it belongs in a dialog, not a menu.
- Style destructive rows with red type. The app calls out destructive actions in a modal, not by paint.

### 3.17 Campaign disclaimer confirmation (`.cfm`)

Pre-launch confirmation modal. Shown when the user hits Run Campaign in `.cpanel`.

**Anatomy.**
- `.cfm` (469×~519, 12px radius, `--camp-shadow-modal`).
- `.cfm__hero` (204h): `--camp-cfm-gradient` background + concentric `.cfm__ring--1..6` rings (radial mask fades edges) + `.cfm__logo` (32px black square, X mark) + three floating `.cfm__chip` example posts.
- Body: `.cfm__title` (18/500 centered) + `.cfm__desc` (14/400 centered) + `.cfm__fields` (Categories row + Categories/Timeline split + duration line) + `.cfm__foot` (Cancel + Confirm).

**The hero is scoped colorwork.** `--camp-cfm-*` tokens (gradient, rings, chip colors) live ONLY in this modal. Do not reuse them elsewhere — the gradient is the "Scout is about to do something" signature, and diluting it flattens the moment.

**Do**
- Keep both footer buttons the same width (both `flex: 1`). Confirmation is a symmetric choice — asymmetric buttons imply an obvious answer.
- Use the black-square X mark on the chips as the source icon. If another network's chip appears in this hero, use *that* network's monochrome mark.

**Don't**
- Add a subtitle / eyebrow above the hero. The hero already sets the mood; a subtitle would fight it.
- Show more than 3 chips in the hero. It's decorative — the count is about rhythm, not content.

### 3.18 Rejection feedback modal (`.fbmodal`)

Small single-field feedback modal shown when a reviewer rejects a campaign or post.

**Anatomy.** `.fbmodal` (469×~230, **18px radius** — larger than the standard `--camp-radius-modal`, on purpose, so the modal feels like a quick action rather than a decision surface). `.fbmodal__head` (title + supporting text + close-X) → `.fbmodal__body` (one `.fbmodal__field` = label + `.fbmodal__select`) → `.fbmodal__foot` (Cancel + Submit).

**Do**
- Keep the field count at one. If more than one reason field is needed, the flow deserves a full page, not this modal.
- Use `--camp-radius-modal-round` (18px) — the larger radius is the tell that this is a lightweight ask.

**Don't**
- Convert this into a textarea. The point is a *categorized* reason that Scout can act on; free text belongs in the comment thread, not this modal.

### 3.19 Read-only mode banner (`.robanner`)

Full-width bar shown above a campaign or post surface when the current viewer has view-only access — for example, a stakeholder invited to review but not edit, or the author's own view after Publish-lock.

**Anatomy.** `.robanner` (1336w max, min-height 48, 12px radius, `--camp-surface`) →
`.robanner__body` (`.robanner__icon` = 24×24 eye + `.robanner__text` = 16/500 `--camp-text-secondary`) +
`.robanner__actions` (`.robanner__btn` — primary indigo, 34h + `.robanner__close`).

**Anchor position.** Sits inside the panel, immediately above the detail content — never floating, never sticky. If it scrolls out with the content, the user's mental model that "the whole surface is frozen" stays intact.

**Do**
- Keep the copy short and specific — say *why* it's read-only, not just *that* it is. "You're viewing in read-only mode" is the floor; a hint about who can unlock it is better.
- Use `--camp-primary` on the action button. This is the only place a primary indigo button lives inline with body content — its weight signals "the way out."
- Let the eye icon carry the affordance. Do not double up with an "info" or "lock" glyph.

**Don't**
- Style the banner with a colored tint (yellow warning, blue info). Read-only is a *mode*, not an alert — the banner is quiet white on the panel canvas.
- Use `.robanner` for permission errors ("You don't have access"). That's a full-page state, not a banner. Reserve this component for viewable-but-locked surfaces.
- Add a border. The banner distinguishes itself from the canvas by the fill + radius, matching the card treatment.

### 3.20 Chat-first campaign creation flow (`.cc-*`)

Scope: the surface used **only** when a user is *creating or refining a single campaign*. Not for dashboards, not for detail views of published campaigns. Lives at [`designs/campaign-create.html`](../designs/campaign-create.html) and inherits the shell (`body.mode-campaigns`, sidebar, atmosphere) from the campaigns module.

**Design intent.** Creation is a **conversation**, not a form. Scout is present in the chrome here (deliberate exception to §1's "no Scout in the chrome" rule; the rule applies to management surfaces, not creation). The flow moves from full-width chat → tone card selection → split view with the chat on the left and a live generation canvas on the right. Two disjoint panels with an 8px gap between them; the canvas gray shows through.

#### 3.20.1 Page header (`.cc-page-header`)

Sits **below the topbar, above the panel**. Replaces the older pattern of putting titles inside the panel. Owns the campaign's identity display (title + subtitle).

**Anatomy.** `.cc-page-header` (padding `6px 24px 12px`, gap 4px, `flex-direction: column`) →
- `.cc-page-header__title-row` (row, gap 8px) with:
  - `.cc-page-header__title` — 22/500 SF Pro Display, letter-spacing 0.25px, color `--camp-text-primary`. Contenteditable. Placeholder state uses `--camp-text-tertiary` + italic.
  - `.cc-page-header__edit` — 24×24 pencil button, `opacity: 0` at rest, revealed on title-row hover.
- `.cc-page-header__subtitle` — 14/400, line-height 150%, letter-spacing 0.15px, color `--camp-text-secondary`, `max-width: 640px`.

**Copy behavior.**
- Landing: title `New campaign` (placeholder), subtitle *"Start with a prompt, or let Scout pull three shapes from your KB."*
- After shape selection: title becomes the Scout-authored campaign name (e.g. *"Summer heatwave, reactive drive"*); subtitle becomes a one-line factual summary (e.g. *"3 posts scheduled Tue, Thu, Sat next week. Riding the heatwave forecast."*).
- Cross-fade the title (`opacity 320ms`) when Scout commits.

**Do**
- Use this header for creation. Any other module surface uses `.campaigns__header` (§3.4).
- Keep the subtitle factual and short. If Scout wants to *explain*, it goes in chat, not the subtitle.

**Don't**
- Duplicate the title inside the right panel canvas. The page header owns it.
- Style the subtitle with color-family tints. It's `--camp-text-secondary` in every state.

#### 3.20.2 Split viewport (`.cc-viewport--split`)

The moment Scout starts generating, the single-column chat splits into a two-column grid: `minmax(440px, 520px) 1fr` with `gap: 8px`.

**Two disjoint panels.** Each side is its own white card (24px radius, `--camp-shadow-post`). The gap between them reveals the canvas gray. The outer `.panel` becomes transparent when split (`.panel:has(.cc-viewport--split)`) to allow the two panels to read as sibling surfaces.

**Do**
- Preserve the 8px gap. It's not decorative — it's what makes the two panels read as disjoint.
- Give each panel its own scroll. Chat history and post canvas should never move together.

**Don't**
- Add a divider line between the panels. The gap does the work.
- Try to merge back to a single panel post-split. Once creation starts, the split is durable.

#### 3.20.3 Shape summary chip (`.cc-shape-summary`)

Compact chip that **replaces the three tone cards** after the user picks a shape. Sits at the top of the chat column as a persistent reminder of the chosen shape.

**Anatomy.** Flex row, gap 12px, padding `12px 16px`, 14px radius, `1px solid rgba(84,91,209,0.20)` border, subtle shadow →
- `.cc-shape-summary__pill` — indigo pill (`#EEF0FF` bg, `--camp-primary` text, sparkle icon, 11/600).
- `.cc-shape-summary__body` — column with `.cc-shape-summary__title` (14/500) + `.cc-shape-summary__meta` (12/500 `--camp-text-tertiary`).
- `.cc-shape-summary__adjust` — right-aligned indigo text link.

**Do**
- Keep exactly one shape summary per creation. It represents the *current* chosen shape.
- Use `Adjust` for the affordance; it's less committal than `Change` and matches Scout's collaborative tone.

**Don't**
- Replace the summary with the full 3-card grid when the user clicks Adjust. Open a small option group inline instead (§3.9 inline density).

#### 3.20.4 Post card (`.cc-postcard`)

The generation-canvas atomic unit. One card = one post in the campaign. Distinct from `.postrow` (§3.14) which is used for the dashboard list. Uses `--camp-*` tokens and follows the same 12px radius as `.camp-card`.

**Anatomy (top to bottom).**
1. **Topbar** (`.cc-postcard__topbar`, min-height 22px) — meta row on the left, single kebab (`.cc-postcard__kebab-top`, 24×24) on the right.
   - `.cc-postcard__meta__num` — indigo pill (`Post N`, 11/600, `--camp-primary` on `#EEF0FF`).
   - `.cc-postcard__ai-badge` — 18×18 gradient circle with sparkle. Reuses the `.postrow__ai-badge` gradient (§3.14). This is the Scout-authored signal — one per post, never removed.
   - `.cc-postcard__version` — 11/500 outlined pill (`V1.N`) that appears **only** after Scout revises the post. Never pre-populated.
2. **Body** (`.cc-postcard__body`, grid `108px 1fr`) — 108×108 image slot on the left; text stack on the right. Body copy uses `--camp-text-quiet`; the hook uses `--camp-text-primary`. Minimum body height matches the image so short posts don't stack weirdly.
3. **Panel slot** (`.cc-postcard__panel`) — inline functionality panel, collapsed by default (§3.20.6).
4. **Footer** (`.cc-postcard__footer`, 12px top padding, 1px dashed top border) — labeled dropdown buttons for **Tone** and **Schedule**, plus the **AI button** on the right.

**Footer buttons (`.cc-post-btn`).** Labeled, not icon-only. Each shows an icon (`--camp-text-tertiary`), a static label (`--camp-text-tertiary`), a live value (`--camp-text-primary`), and a chevron. Example: `[🎨 Tone Warm ▾]`. Clicking toggles the inline panel. Active state uses `#EEF0FF` bg + `--camp-primary` text/icon.

**AI button (`.cc-post-btn--ai`).** 32×32 gradient circle with the AI gradient (`--ai-gradient` linear indigo→violet at 135°). Sits right-aligned in the footer. When active: 2px indigo focus ring + drop shadow. This is the *only* place the AI gradient appears on the post card; reserved for opening the AI command panel (§3.20.7).

**Do**
- Include the AI badge on every Scout-generated post. If the user hand-authors a post from scratch, the badge is absent.
- Use `--camp-text-quiet` (`#4E4E5B`) for the body copy — matches other post-body surfaces in the module.
- Preserve the 108×108 image slot even for text-only posts. It reads as "image pending" via the tissue-paper placeholder, not as broken layout.

**Don't**
- Move the AI button anywhere except bottom-right of the footer. The position is the affordance.
- Nest actions inside the top row. Everything actionable lives in the footer; the top row is meta only.
- Show all-caps text anywhere on the card. Meta, labels, and pills stay sentence case.

#### 3.20.5 Image mismatch state

When Scout auto-assigns a user-uploaded image to a post whose tone doesn't match, the image gets a **prominent** flag treatment. Not subtle — the whole image slot changes.

**Anatomy.**
- `.cc-postcard__image` gets an outer `outline: 2px solid #F79009` and a pulsing `box-shadow` at `rgba(247, 144, 9, 0.12–0.20)` (2.2s cycle).
- `.cc-postcard__image-mismatch` — solid amber banner (`#B54708` bg, white text, 12/600) spans the top of the image with a `Mismatch` label + warn icon. Not a small corner chip; it's a full-width top strip inside the image.

**Do**
- Keep the mismatch treatment loud. The whole point is that the user cannot miss it.
- Pair the visual flag with a Scout message in chat and a resolution `.chips-group`. The visual is the *signal*; chat is the *conversation*.

**Don't**
- Use this treatment for anything except a genuine tone/brand mismatch. Not for low-resolution warnings, not for aspect-ratio warnings — those get their own quieter chip.
- Auto-dismiss the mismatch. It clears only when the user explicitly chooses a resolution (generate / use anyway / try different post).

#### 3.20.6 Floating dropdown (`.cc-dropdown`)

Anchored dropdown menu used for the **Tone** and **Kebab** buttons on any post card, and any other lightweight ambient choice. Replaces the earlier inline panel pattern — the dropdown floats above the card rather than expanding it.

**Anatomy.** `.cc-dropdown` (fixed position, `min-width: 220px`, 10px radius, `box-shadow: 0 0 24px rgba(17,17,20,0.14)` per Figma "Menu Item" spec, 4px vertical padding, 2px gap between rows) →
- `.cc-dropdown__section-label` — 11/600 `--camp-text-tertiary`, tight letter-spacing. One per section.
- `.cc-dropdown__item` — 14/400 row, 9/14 padding, `--camp-text-primary` text, optional leading icon (16×16 in `--camp-text-secondary`, shifts to `--camp-primary` on hover). Optional trailing hint (12/400 `--camp-text-tertiary`). Active state adds a 6px indigo dot on the right.
- `.cc-dropdown__sep` — 1px `--camp-border-quiet` divider with 8px side-padding.

**Schedule variant (`.cc-dropdown--schedule`).** Wider (280px), 12px padding, contains two `.cc-dropdown__row` blocks: `Day` and `Time`. Rows are 42px labeled with a chip grid of `.cc-dropdown__pill` (5/10 padding, 8px radius). Active pill flips to `--camp-primary` bg with white text. Selection commits automatically when both a day and a time are picked.

**Behavior.**
- **One-at-a-time.** Opening a dropdown closes any other dropdown or popover.
- **Toggle on anchor re-click** — clicking the same button that opened it re-closes.
- **Dismiss on click-outside, Escape, or window scroll.**
- **Auto-flip.** If the dropdown would overflow the viewport bottom, it flips above the anchor.

**Do**
- Use the dropdown pattern for any *simple pick from a list* action on a post card. Tone, kebab, small filter menus.
- Highlight the anchor button (`is-active`) while the dropdown is open — the user should always know which control produced it.

**Don't**
- Nest one dropdown inside another. If a selection needs a follow-up, close the parent first and open the child.
- Use the dropdown for multi-select or free-text input. Multi-select belongs in an option group (§3.9); free-text belongs in the AI popover (§3.20.7).

#### 3.20.7 AI popover (`.cc-ai-popover`)

Opened by the AI button (`.cc-post-btn--ai`) on any post card. Larger than the standard dropdown — the AI popover is a **427px** anchored panel modeled on the Figma "Purchase Credit" anatomy.

**Anatomy.** `.cc-ai-popover` (fixed, 427px wide, 1px border `rgba(154,164,178,0.20)`, 12px radius, `box-shadow: 0 20px 48px rgba(17,17,20,0.20)`, 12px padding, 16px gap) →
- **Header row.** `.cc-ai-popover__title` (18/500 SF Pro Display, `rgba(0,0,0,0.87)`, letter-spacing 0.15px) with a small 20×20 gradient-mark sparkle preceding it. `.cc-ai-popover__close` on the right (24×24, `--camp-text-secondary`, X icon).
- **Description card.** `.cc-ai-popover__desc-card` — inner `#F8FAFC` panel, 1px border `rgba(154,164,178,0.20)`, 12px radius, 12/14 padding. Contains `.cc-ai-popover__desc-label` (11/500 quiet) + `.cc-ai-popover__desc-text` (13/400, letter-spacing 0.17px, `rgba(0,0,0,0.72)`). Names the post being edited and explains what happens next.
- **Preset tile row.** `.cc-ai-popover__tiles` — flex-wrap row of `.cc-ai-popover__tile` buttons (6/12 padding, min-height 34, `#FFFFFF` bg, 1px `rgba(154,164,178,0.30)` border, 6px radius). Six defaults: `Shorten`, `Expand`, `Rewrite`, `Make it punchier`, `Softer tone`, `Stronger CTA`. Clicking a preset commits immediately.
- **Text input.** `.cc-ai-popover__input` — 100% width, 10/14 padding, 1px border, 8px radius. Placeholder: *"Or type your instruction, like 'add a question at the end'…"*.
- **Primary CTA.** `.cc-ai-popover__submit` — full-width 42px height, `#3C4194` background, white 14/500 letter-spaced label reading *"Apply to Post N"*. Disabled until input has content (or a preset was queued).

**On commit.** Popover closes. A user message appears in the left chat (*"On Post N. {instruction}"*). Scout replies briefly. Post body skeleton-swaps to a new version; version chip stamps `V1.N`. A success toast fires (§3.20.10).

**Do**
- Anchor the popover to the AI button and align to the button's right edge. This keeps the popover from overlapping the post it's editing.
- Preset presses commit immediately (no confirmation). Preset copy already reads as an intent.
- Echo the instruction into the left chat verbatim. Chat is the campaign's audit trail.

**Don't**
- Use the AI popover for image edits. Image changes go through the AI panel's "generate" path only when text needs a new image to match; standalone image swaps belong in a future image popover (parked).
- Skip the toast. The popover closes on commit, and without a toast the user has no confirmation their instruction landed.

#### 3.20.10 Toasts (`.cc-toast`, `.cc-toasts`)

Bottom-right stacked notifications for action confirmations. Modeled on the Figma "Submitted" spec: 420px wide, white surface with `box-shadow: 0 0 21px rgba(0,0,0,0.14)`, 12px radius, 12/12 padding.

**Anatomy.** `.cc-toast` = 22×22 leading icon (default `#2E7D32` check-circle) + `.cc-toast__body` (title 16/500 + optional description 14/400, both `#2E7D32` for success) + optional `.cc-toast__actions` (single 14/500 text button) + 26×26 `.cc-toast__close` on the right.

**Variants.**
- Default (success) — green `#2E7D32` for icon and copy.
- `.cc-toast--info` — indigo icon (`--camp-primary`) + neutral copy. Used for non-success confirmations (e.g. Scout is doing something long-running).
- `.cc-toast--warn` — amber icon `#B54708` + copy `#7C4A1E`. Used only for destructive actions with an Undo affordance (e.g. Post deleted).

**Behavior.** Stack bottom-right, gap 10px. Auto-dismiss at 4.2s. Manual dismiss via close button. Toasts do not block interaction.

**Do**
- Fire a toast for every terminal user-visible change: post updated, image swapped, schedule changed, post approved.
- Pair destructive toasts (`--warn`) with an Undo action button. Never destructive-toast without a way back.

**Don't**
- Toast for Scout-narrated intermediate steps (drafting, reading images). Those belong in the chat, not the toast rail.
- Stack more than 3 toasts at once. If the app fires that many, batch them into one summary toast.

#### 3.20.8 Status pill on the topbar (`.cc-status`)

Uses the canonical §2 status families. Progression through the flow:

| Stage | Status | Family |
|---|---|---|
| Landing / Intent / Suggestion | `Draft` | In Draft (`#F4F3FF/#D9D6FE/#5925DC`) |
| Scout drafting posts | `In draft` (unchanged) or `Drafting` | In Draft, animated dot |
| All posts drafted | `In review` | In Review (`#FFFAEB/#FEDF89/#B54708`) |
| Post-approve, awaiting schedule | `Ready to publish` | Published (`#ECFDF3/#ABEFC6/#067647`) |

**Do**
- Use the pulsing dot only during "actively working" states (Scout is drafting). Static dot for terminal states.

**Don't**
- Invent new status labels. Map every state onto the six canonical families in §2.

#### 3.20.9 Voice discipline

Applies to every Scout string in the creation flow.

- **No dashes or hyphens.** Rewrite as full sentences. `Heatwave — question-opener sprint` → `Summer heatwave sprint`. `first-person warm` → `first person warm`. This applies to titles, hooks, body copy, chat, tooltips.
- **First-person accountable.** *"I'll queue 3 posts…"* not *"Scout will queue…"*.
- **Craft hedges, never outcome.** *"product-1.png reads corporate"* names the visual quality. *"This might not work"* names the outcome — banned.
- **No exclamation points.** Ever.
- **No all caps.** Sentence case throughout. Meta labels ("Post 1", "Tue 10:00 AM"), status pills, chip labels are never uppercase.
- **Accessibility floor.** Body text at least 12px, primary contrast at least 4.5:1 (`--camp-text-secondary` `#4B5565` on white), meta at least 3:1 (`--camp-text-tertiary` `#697586` on white). `#98A2B3` is placeholder-only, never body copy.

---

## 3.20 · Semantics and selection guide (chat-first creation)

### Icon semantics for post actions

| Icon | Sprite id | Semantic role | Where |
|---|---|---|---|
| Sliders | `i-tone` | Adjust an ambient setting (a value that has a small enumerable range) | Tone dropdown |
| Clock | `i-clock` | Time-bound value with concrete units | Schedule dropdown |
| Sparkle | `i-sparkle` | AI action or Scout-authored content | AI popover button, AI badge on posts, page-header edit affordance |
| Kebab | `i-kebab` | Actions that don't belong on the primary toolbar | Post kebab (Duplicate / Regenerate / Lock / Delete) |
| Warn triangle | `i-warn` | Flagged mismatch or hedge that needs a decision | Image mismatch chip, warn toast |
| Check circle | `i-check-circle` | Terminal success confirmation | Success toast |
| Chevron down | `i-chevron-down` | Dropdown or expandable disclosure | Every `.cc-post-btn`, details drawer chevron |

**Do**
- Reuse `i-sparkle` for anything Scout-authored. The gradient AI badge + this icon is the single unified Scout-signature.
- Pair `i-warn` with warn-family colors (`#B54708`) or the mismatch treatment. Never on a neutral surface.

**Don't**
- Reuse `i-tone` (sliders) for a schedule or numeric input. It's specifically "there is an enumerable set of values, pick one."
- Use `i-quote` or `i-mic` for tone — those imply *voice as speech*, not *adjustable register*. The metaphor is a slider.

### Post footer button (`.cc-post-btn`) shape

Rest state is a visible pill: `#FFFFFF` bg, 1px `#E4E7EC` border, 8px radius, 7px/10px padding. Inside: icon (14px `--camp-text-tertiary`) + value (13/500 `--camp-text-primary`) + chevron (10px `--camp-text-tertiary`).

**No text label.** The icon carries the category; the button's value is the label. `[🎚 Warm ▾]` and `[🕐 Tue 10:00 AM ▾]` read fine — the icon disambiguates.

**Active state** (dropdown open): background flips to `#EEF0FF`, border and text to `--camp-primary`, adds a 3px `rgba(84,91,209,0.10)` focus ring.

**Do**
- Keep the icon → value → chevron rhythm consistent across every footer button.
- Match the rest-state pill treatment across dropdown buttons. If the button doesn't open a menu, don't use `.cc-post-btn`.

**Don't**
- Add a text label next to the value. The value *is* the label. Doubling it up reads as "Tone Warm" which parses like two adjectives.
- Style the AI button (`.cc-post-btn--ai`) like the others. It's the only footer button with the gradient fill and no chevron — that's the affordance signal.

### Selection guide: dropdown vs popover vs option group vs toast vs modal

Which container to use for which decision.

| Situation | Container | Why |
|---|---|---|
| Pick one value from ≤6 known options | **`.cc-dropdown`** (§3.20.6) | Simple, anchored, low commitment. E.g. Tone chooser. |
| Pick multiple values or set a date | **`.cc-dropdown--schedule`** | Same shape, wider, supports multi-row picking. |
| Free-text instruction + preset shortcuts | **`.cc-ai-popover`** (§3.20.7) | Needs an input field and a primary CTA. Bigger commitment. |
| Ambiguity Scout can't resolve on its own | **`.opt-group`** (§3.9) | Requires a `Why` + `If you pick this` per option. Not a preference picker. |
| Confirming a terminal user-visible change | **`.cc-toast`** (§3.20.10) | Fire-and-forget acknowledgment, bottom-right, auto-dismiss. |
| Destructive action needing Undo | **`.cc-toast--warn`** with Undo action | Toast + action is the app's soft-undo pattern. |
| Multi-field decision or pre-launch confirm | **`.cfm`** modal (§3.17) | Symmetric buttons, blocks the surface. |
| Categorized rejection reason | **`.fbmodal`** (§3.18) | One field, lightweight ask, 18px radius. |

**Rules of thumb**
- **Dropdown by default.** If you're reaching for a modal for a small pick, you're wrong — use a dropdown.
- **Popovers are for input + submit.** If the user only picks from a list, drop the popover and use a dropdown.
- **Toasts confirm, don't decide.** If the user needs to answer a question, don't toast — surface an option group in chat.
- **Option groups are rare.** They surface only at genuine forks (per §3.9). If you're firing options for aesthetic preference, pick and narrate instead.

### Component decision tree

```
Is the change already made and just needs confirmation?
  → Toast (§3.20.10). Choose kind by outcome:
      Success → default green
      Long-running → --info indigo
      Destructive → --warn amber + Undo action

Is the user picking a value?
  → Yes, single from a list  → Dropdown (§3.20.6)
  → Yes, day + time          → Schedule dropdown (§3.20.6)
  → Yes, but the KB conflicts with the pick → Option group (§3.9)

Is the user issuing a free-text instruction?
  → AI popover (§3.20.7). Never a modal.

Is the user answering "am I sure?"
  → Confirmation modal (§3.17). Symmetric buttons.

Is the user categorising a rejection?
  → Feedback modal (§3.18). Single field.
```

### `--camp-*` token semantics (when to use each)

Beyond the raw definitions in §2, here's the intended use for each core token in creation surfaces.

| Token | Intended use | Never use for |
|---|---|---|
| `--camp-primary` `#545BD1` | Primary buttons, active dropdown states, selected schedule cells, page-title breadcrumb-current | Toast colors, status pill fills, hover-only accents |
| `--camp-primary-tint` `#EEEFFA` | Active button background, indigo location chips | Anything Scout-informational (use `--ai-gradient` instead) |
| `--camp-primary-tint-cool` `#EEF2F6` | Audience chips, selected time-cell background | Buttons |
| `--camp-text-primary` `#263238` | Titles, values, hook text on post cards | Meta labels, hints |
| `--camp-text-secondary` `#4B5565` | Labels, breadcrumb, subtitle, page-header subtitle | Small placeholder text |
| `--camp-text-tertiary` `#697586` | Meta, dropdown hints, icon color at rest | Interactive text (must meet 4.5:1) |
| `--camp-text-quiet` `#4E4E5B` | Post body copy on `.cc-postcard`, comment body | Titles, buttons |
| `--camp-surface` `#FFFFFF` | Panel surface, dropdown surface, post card, toast | Canvas background |
| `--camp-surface-field` `#F8FAFC` | `.cfield` background, `.cc-ai-popover__desc-card` inner panel | Anything else — this is the "inset panel" tint |
| `--camp-surface-canvas` `#ECECEC` | Panel-behind canvas, gap between split panels | Card surfaces |
| `--camp-border-quiet` `#EEEEEE` | Panel divider hairlines | Interactive borders (use `--camp-border-input`) |
| `--camp-border-input` `#D0D5DD` | Inputs, dropdown pills | Divider hairlines |
| `--ai-gradient` linear 135° indigo→violet | Post AI badge, AI button (`.cc-post-btn--ai`), page-title mark on `.cc-ai-popover` | Anything not Scout-authored |

**The rule**: if two tokens could plausibly fit a use-case, pick the one whose *description* names that use-case. If none fit, add a new `--camp-*` token to the source stylesheet first, then reference it. Never inline a raw hex in a component.

---

## 3.20 · Do / Don't reference (chat-first creation)

Consolidating every rule from this section into one glance. Longer form and reasoning live in each subsection.

### Do
- Anchor floating dropdowns to their trigger button, not to the viewport center. Auto-flip above if there isn't room below.
- Toggle the anchor's `is-active` state while its dropdown is open. Close on click-outside, `Escape`, or a repeat-click on the anchor.
- Give post footer buttons a visible pill at rest. Icons are semantic, values are the label — no separate text label span.
- Use the AI popover shape (427px, header + desc card + tile row + input + primary CTA) for anything that's "Scout, do X with free text." One shape, many contexts.
- Toast every terminal user-visible change: post updated, image swapped, schedule changed, post approved, post deleted (with Undo).
- Fire toasts bottom-right, stacked, max 3 visible. Auto-dismiss at 4.2s.
- Use the AI gradient on exactly one signature element per post: the AI badge in the meta row.
- Cite the KB in the option primitive's `Why` line. `Matches your Q2 warm-portrait moodboard` beats `Matches your style`.
- Keep the mismatch treatment loud (banner + border + pulse). It is a signal, not a hint.
- Preserve the 8px gap between chat and canvas panels. Canvas gray must show through — that's what makes them read as disjoint.
- Contenteditable the page-header title. Pencil-icon affordance appears on hover of the title-row.
- Cross-fade the topbar/page-header title from placeholder → committed at Stage 3 start.

### Don't
- Use a modal for a decision that fits in a dropdown. Modals block the surface; dropdowns don't.
- Reach for the AI popover for image edits or schedule picks. The AI popover is text-only. Images and schedules have their own dropdowns.
- Nest one floating menu inside another. Close the parent first.
- Reuse `--camp-primary-tint` for anything Scout-informational. That's what the AI gradient is for.
- Show a text label next to a value in a dropdown button. The icon is the label.
- Toast an intermediate Scout narration ("Reading images…"). Narrations belong in chat.
- Toast without a title. A description-only toast reads as noise.
- Style destructive kebab rows in red *text* alone. Red text with a red icon and a warn-toast on execution — the full pattern.
- Add another Scout gradient element per post beyond the AI badge. The gradient is a spotlight; overusing dilutes.
- Duplicate the campaign title across the topbar and the page header. Page header owns it. Breadcrumb shows the truncated current-page name only.
- Use `#98A2B3` on body copy. It fails 4.5:1 on white. `--camp-text-tertiary` `#697586` is the floor for readable text.
- Introduce dashes or hyphens into any Scout string. Rewrite as full sentences.

---

## 4. Structural rules

- **Every panelized view lives inside `.campaigns-panel`.** The panel is the visual container that separates the surface from the app chrome. It wraps both Campaigns and Home content today; any new dashboard should reuse it (same class name — don't fork).
- **The ambient blob layer is app-level, not view-level.** `.campaigns-atmosphere` sits inside `.app` and is gated by `body.mode-campaigns` (the shared "panelized dashboard" mode). Do not duplicate the blob markup into each view — one instance covers all dashboards that share the language.
- **`body.mode-campaigns` is the shared-language switch.** Turn it on for any dashboard that should look like Campaigns (currently: Campaigns, Home). It flips the sidebar treatment, topbar chrome, and reveals the atmosphere. The name is historical — read it as "panelized dashboard mode."
- **Header CSS classes are shared, not module-prefixed.** Both Campaigns and Home use `.campaigns__header`, `.campaigns__heading`, `.campaigns__title`, `.campaigns__subtitle`, `.campaigns__actions`, `.acct-switch`, and `.btn-create`. When you add a new dashboard, reuse these — do not clone them with a home-* or scheduler-* prefix.
- **Icons must exist in the sprite before use.** `poc/index.html` has an inline `<symbol>` sprite. Add new symbols there; do not inline SVG in JS. Use `icon('i-name')` from `app.js` to reference them.
- **State lives in per-view state objects.** `campaignsState` for Campaigns; if Home develops interactive state, use `homeState`. Do not spread state across module-scope variables.

---

## 5. Do's and Don'ts (at a glance)

### Do
- Anchor everything against the 1440px design width; use the token table for gaps and sizes.
- Use the status-badge color families for approval states, and *only* for approval states.
- Keep the panel translucent. It's the module's signature — losing the transparency loses the identity.
- Preserve the divider between meta and footer inside cards, even for quiet cards.
- Keep the Create button primary, top-right, always visible.
- Match section spacing at 16px (header → tabs → grid).

### Don't
- Merge onboarding patterns (`.conf`, `.chip`, `.qreply`, Scout speech bubbles) into campaigns surfaces. Campaigns is silent.
- Add borders to cards. The 12px radius + hover shadow is the separation.
- Reuse the app's `--primary-soft` for status pills. The status families are explicit and independent.
- Introduce global topbar changes without scoping to `body.mode-campaigns`. Other views must remain untouched.
- Add features to the header row (search, filters, kebabs) — those belong in the strip below.
- Show hover-only information on cards. Everything the user needs to compare campaigns must be visible at rest.

---

## 6. Open questions

Things we haven't decided yet — noted here so they're not lost:

- **Detail view chrome.** Does the detail view keep the same panel wrapper, or move to a full-bleed inspector with a return breadcrumb?
- **Multi-select.** Can the user select multiple cards for bulk actions (change status, delete)? If so — checkbox affordance vs. click-to-select vs. shift-click? None chosen yet.
- **Empty state.** Zero campaigns in a filter currently shows a text-only "No campaigns in this view." That's a placeholder; the pattern deserves illustration + a nudge back to the Create action.
- **Sort.** Sort order today is data order. Do we need explicit sort controls (created / date range / status)? If so, where do they live — header-right? A sort chip near tabs?
- **Comments.** The "N Comment" affordance on cards implies a comments thread. Where does it live — a drawer, a detail-view panel, a modal? Undecided.
- **Analytics preview on cards.** Should cards eventually surface a mini metric (reach / engagement) inline, or does that stay in the detail view? Undecided.

Add answers here as they're made.

---

## 7. Changelog

Track substantive changes to this document (not typo fixes).

| Date | Change |
|---|---|
| 2026-07-01 | Initial version — dashboard list view tokens, components, and rules. |
| 2026-07-01 | Scope broadened to shared visual language: Home dashboard now adopts the same shell. Atmosphere moved from view-scoped to app-level; §4 rules updated; §3.6 (Home dashboard content) added. |
| 2026-07-03 | Campaign-detail component sheet added. New `--camp-*` module-token layer in §2; components §3.10–§3.18 (drawer, X-card, cpanel + cfield, analytics, postrow, dtp, ddmenu, cfm, fbmodal). Component styles extracted to [`designs/_campaigns-components.css`](../designs/_campaigns-components.css); visual sheet at [`designs/campaign-components.html`](../designs/campaign-components.html). |
| 2026-07-03 | §3.19 Read-only mode banner (`.robanner`) added. |
| 2026-07-03 | §3.20 Chat-first campaign creation flow (`.cc-*`) added. Documents the creation surface at [`designs/campaign-create.html`](../designs/campaign-create.html): page header (§3.20.1), split viewport (§3.20.2), shape summary (§3.20.3), post card with bottom action row (§3.20.4), image mismatch state (§3.20.5), inline functionality panel (§3.20.6), AI command panel (§3.20.7), status pill flow (§3.20.8), voice discipline (§3.20.9). |
| 2026-07-03 | §3.20 fourth round: inline functionality panel replaced with floating dropdown (§3.20.6 rewritten) and AI popover (§3.20.7 rewritten) modeled on Figma "Menu Item" and "Purchase Credit" specs. Toast component added at §3.20.10 with three variants (success, info, warn). |
| 2026-07-03 | §3.20 fifth round: **semantics + selection guide** appended. Icon semantics table, dropdown-button shape rules, container-selection tree (dropdown vs popover vs option group vs toast vs modal), `--camp-*` token-usage table with never-use-for column, and a consolidated Do / Don't reference for the whole chat-first creation section. |
| 2026-07-06 | **Shell tokens tightened.** Added `--camp-surface-panel` (translucent `rgba(255,255,255,0.4)`) and `--camp-surface-logo-tile` (`#000000` on `.acct-switch__x`). Refactored `.campaigns-panel`, `.campaigns__title`, `.campaigns__subtitle`, `.acct-switch`, `.btn-create`, `.camp-tab` / `.camp-tab--active` / `.camp-tab__badge`, `.camp-card` and its children, and all `.camp-status--*` variants in `poc/styles.css` to reference `--camp-*` tokens instead of raw hex. Values unchanged — pure detokenization pass so the Figma spec values live in exactly one place. |
| 2026-07-05 | **Reference-derived patterns** catalogued in a new sibling doc — [references-patterns.md](./references-patterns.md). Twelve patterns: post list rows (`.postdraft`, new spec), flat right drawer (`.side-panel` spec updated — no elevation, flush to viewport, `--indigo-500` sparkle on `--camp-primary-tint`), scheduled post preview modal, order summary + payment card, AI-suggested loading modal, settings sub-nav shell, form-first campaign create, compact campaign summary card (clarifications to §3.12), simple list dropdown (cross-link to §3.16), date-time picker (cross-link to §3.15), Scout avatar parity with onboarding, QDock docked question overlay. `.postdraft` (§1 of the new doc) replaces the previous elevated post-card style with hairline-separated rows. `.side-panel` flattened — no `box-shadow`, no border-radius, `border-left` only. `.chatmsg` restructured to onboarding parity (22px transparent-indigo avatar, plain-text body, only latest turn shows head). QDock (`.cc-qdock`) replaces inline `.cc-qreplies` / `.cc-chips` for questions. Chat + composer left-anchor when the drawer is open (chat "slides into" the header column). |
