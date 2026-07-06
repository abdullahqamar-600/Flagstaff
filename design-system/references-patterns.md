# Reference-derived UI patterns

A catalogue of the UI patterns pulled from `References/` (Figma exports) and shipped across the app. Each entry names the **purpose**, tells you **when** and **where** to use it, sketches the **anatomy**, and lists **do / don't** rules that survived translation from mock to code.

> **When to consult this doc.** You are designing or building a surface that isn't already a first-class §3.x component in [campaigns.md](./campaigns.md), and you want to know if a reference already covered it. If a pattern below fits, use it — do not fork a new class.
>
> **When to update this doc.** You added a new reference-derived pattern to the codebase, or a shipped pattern's spec drifted from an existing entry. Bump the changelog at the bottom.
>
> **Where the patterns live in code.** Styles: [`designs/_campaigns-components.css`](../designs/_campaigns-components.css). Sample HTML: [`designs/campaign-components.html`](../designs/campaign-components.html) (for existing pieces) or the surface that first shipped it. Tokens come from [`design-system/tokens.css`](./tokens.css) and the module layer at the top of `_campaigns-components.css`.

---

## Contents

1. [Post list rows (`.postdraft`)](#1-post-list-rows) — Frame 1410089028 (Generated Post Content)
2. [Flat right drawer (`.side-panel`)](#2-flat-right-drawer) — Side Drawer · Post Analytics
3. [Scheduled post preview modal](#3-scheduled-post-preview-modal) — Frame 1410089760
4. [Order summary + payment card](#4-order-summary--payment-card) — Buy Credits now
5. [AI-suggested loading modal](#5-ai-suggested-loading-modal) — Frame 649
6. [Settings sub-nav shell](#6-settings-sub-nav-shell) — Frame 1410089510, Settings · Subscription
7. [Form-first campaign create](#7-form-first-campaign-create) — Post Playground / Create Campaign
8. [Compact campaign summary card (`.cpanel`)](#8-compact-campaign-summary-card) — X Post Null State
9. [Simple list dropdown](#9-simple-list-dropdown) — Companies (cross-link to §3.16)
10. [Date-time picker](#10-date-time-picker) — Frame 1410089255 (cross-link to §3.15)

Two shipped-in-code patterns from this session that also belong here:

11. [Scout avatar parity with onboarding (`.chatmsg__avatar`)](#11-scout-avatar-parity)
12. [QDock — docked question overlay (`.cc-qdock`)](#12-qdock)

---

## 1. Post list rows

**Reference.** `Frame 1410089028.png` — Generated Post Content list.

**Purpose.** Vertical list of Scout-drafted posts inside a campaign side-panel or full-page canvas. Each row is one post; the list scrolls independently.

**When to use.**
- Inside `.side-panel` after Scout finishes drafting a campaign (the create-campaign flow).
- Inside a `Generated Post Content` full-page view when the user opens a campaign's drafts.
- Anywhere Scout produced a sequence of posts that the user reviews in order.

**When NOT to use.**
- The **campaigns dashboard** — that's `.camp-card` (§3.1 in campaigns.md). Cards are grid tiles; postdrafts are stacked rows.
- A **single hero preview** — use `.xpost` (§3.11) for the flagship preview.
- A **tightly compacted scheduled post row** with drag/reorder — that's `.postrow` (§3.14).

**Class.** `.postdraft` — the shared row style, defined in [`_campaigns-components.css`](../designs/_campaigns-components.css) around the "Post row" block.

**Anatomy (top to bottom).**
1. `.postdraft__head` — meta row: `.postdraft__num` (`Post 01 of 12`) + flat `.postdraft__ai` sparkle badge (indigo mark on `--camp-primary-tint`, no gradient / no glow).
2. `.postdraft__image` — 16:10 slot, `--camp-surface-field` background, `12px` radius. Even for text-only posts, keep the slot as a "pending image" placeholder.
3. `.postdraft__hook` — 15/22/600 primary color; the sentence Scout leads with.
4. `.postdraft__body` — 14/22/400 `--camp-text-quiet`; the rest of the copy.
5. `.postdraft__chips` — bottom-row meta pills (`.postdraft__chip--tone`, `.postdraft__chip` for time). 26px height, `--camp-primary-tint-cool` background.

**Separation.** No per-card border, no shadow. Rows separate via a single `border-bottom: 1px solid var(--camp-border-hairline)` — the last row drops the border, the first row drops its top padding.

**Do**
- Keep rows spacious (`padding: 22px 0`). Hairlines only work if there's air on both sides.
- Show `Post XX of YY` on every row — position is part of the meaning.
- Reserve the sparkle badge for Scout-authored posts (same rule as the Home dashboard's gradient).

**Don't**
- Add a border or shadow to individual rows. The dividers do the separation.
- Use `.postdraft` for anything that isn't a Scout-drafted post in a campaign context. If it's a scheduled post being reordered, that's `.postrow` (§3.14).
- Fill the sparkle badge with `--ai-gradient`. Reference direction is *flat*: tint background, indigo mark.

---

## 2. Flat right drawer

**Reference.** `Side Drawer__Post Analytics.png`.

**Purpose.** Right-side canvas region for reviewing or acting on a single item — a Scout-generated post, an approval, an analytics readout. The drawer is *content*, not a floating overlay.

**When to use.**
- Any right-side content that the user tabs into during a flow: post drafts (create-campaign), analytics (post detail), approval + comments (§3.10 v1/v2 shell).
- Whenever the surface is meant to feel like a *bordered region beside the chat* rather than a raised drawer above it.

**When NOT to use.**
- Confirmation dialogs, feedback modals, or anything blocking the parent surface. Use `.cfm` (§3.17) or `.fbmodal` (§3.18).
- A quick pick from a list. Use `.cc-dropdown` (§3.20.6).

**Class.** `.side-panel` — updated spec below supersedes the older elevated-drawer treatment.

**Anatomy.**
- Container: fixed to viewport (`top: 0; right: 0; bottom: 0; width: 520px`). `border-left: 1px solid var(--camp-border-hairline)`. **No border-radius, no box-shadow.**
- `.side-panel__header` — 28/20 padding. Flat 32px sparkle badge (`10px` radius, `--camp-primary-tint` background, indigo mark). Title 20/26/600 (`-0.1px` tracking). Subtitle 14/21/400 `--camp-text-secondary`. Close `×` top-right, ghost hover only.
- `.side-panel__body` — 24/28 padding, scrolls independently, holds the content (usually a `.postdraft` list, an analytics grid, or a comment thread).
- `.side-panel__foot` — 16/28 padding, hairline top border. Sticks to the panel bottom for terminal CTAs.

**Layout coupling.** The chat/composer beside the drawer **left-anchors** when the drawer opens — see `body.has-side-panel .cc-main` in [create-campaign.html](../designs/create-campaign.html). The conversation slides into the header's column; the drawer takes the right half.

**Do**
- Keep the panel flush to the viewport edges. Corners flat, no elevation.
- Give the panel body its own scroll — chat and canvas should never scroll together.
- Use `--camp-primary-tint` (not `--ai-gradient`) for the sparkle badge. Reference direction is flat.

**Don't**
- Add `box-shadow: var(--camp-shadow-drawer)`. That was the old elevated spec — the reference is a bordered region, not a floating drawer.
- Nest a modal inside. If a deep action needs a modal, close the drawer first or overlay the modal above both.
- Squeeze the width below 480px. Chips + a 16:10 image slot need room to breathe.

---

## 3. Scheduled post preview modal

**Reference.** `Frame 1410089760__Post.png`.

**Purpose.** A small centered modal that previews a **single scheduled post** — used when the user clicks a specific post from a schedule/calendar view and wants a fast look before diving into edit/approve.

**When to use.**
- Clicking a specific scheduled post from the scheduler calendar.
- Hovering-then-clicking a post cell from an analytics list.
- A "peek before you commit to a drawer" gesture.

**When NOT to use.**
- Editing or approving. That's `.drawer` (§3.10). This modal is *view-only*.
- Multi-post preview. Use `.postdraft` list rows (§1) in a drawer.

**Suggested class.** `.postpreview-modal` (new).

**Anatomy.**
- Modal shell — 320px wide (max), white surface, `12px` radius, `--camp-shadow-modal`, `16/16` padding.
- Header row — title `Scheduled post` (14/500 `--camp-text-secondary`) + close × on the right.
- Body — mirrors `.xpost` (§3.11) but scaled down: 32px avatar + name/verified/handle/date + kebab (static), then post copy, then a single image with 12px radius.
- No footer. This is view-only; actions live in the drawer that opens on click-into.

**Do**
- Use the modal's shell shadow, not a nested card shadow inside. One elevation per surface.
- Match the `.xpost` typography (`--font-x-preview`) so the preview mirrors the eventual publish.

**Don't**
- Add action buttons. Any action opens the drawer/edit surface — the modal is a look, not a lever.
- Show a chip cluster or metadata block below the image. This is a preview, not a detail card.

---

## 4. Order summary + payment card

**Reference.** `Buy Credtis now.png`.

**Purpose.** A right-aligned totals card with a selectable payment method and a single primary CTA. Used at any purchase moment: credit top-up, plan upgrade, one-off charge.

**When to use.**
- Buy credits flow (Settings > Credit usage > Buy).
- Plan upgrade or downgrade confirmation.
- Any "confirm and charge" moment where the user is about to spend money.

**When NOT to use.**
- Pre-charge information (feature comparison, pricing tiers). That's a plans/pricing page, not this card.
- Free actions confirming a change. Use a toast (§3.20.10).

**Suggested class.** `.paycard`.

**Anatomy.**
- Header — `Order Summary` (16/500 `--camp-text-primary`) + close × top-right.
- Rows — label (14/400 `--camp-text-secondary`) + value (14/500 right-aligned `--camp-text-primary`). Right-aligned prices are the pattern.
- **Total row** — bold label + prominent value (18/600). Hairline top border to separate from line items.
- Payment method section — heading `Payment Method` (14/500) then a `.paycard__method` row = card icon + `Mastercard ending at 5232` + `Expiry 02/26` (13/400 muted) + radio (`--camp-primary` when selected).
- Full-width `.paycard__submit` — primary indigo, 44 height, radius 10, `Pay Now`.

**Do**
- Right-align every monetary value. Left-align labels. Rows read like a receipt.
- Show the payment method as a single row with a radio, even if there's only one method — the radio primes the user for the multi-card case.
- Use `--camp-primary` (indigo) for the primary CTA. Not the darker `--primary` — this is a Campaigns-mode surface.

**Don't**
- Add a "Cancel" secondary button next to Pay Now. The close × does that job — a symmetric footer implies equal weight, which purchase moments shouldn't.
- Style the total row with a colored background. The `--camp-primary-tint` reads like a status; the total is a fact.
- Wrap the "Tax %" label in the number. Keep label and value in separate columns.

---

## 5. AI-suggested loading modal

**Reference.** `Frame 649.png` — "Ai Suggested Campaign".

**Purpose.** A modal-scale skeleton state shown while Scout is generating something the user just requested — typically a *whole* campaign structure. Ends with an explicit **Cancel / Create** commit gate (unlike the toast + drawer path, which is fire-and-forget).

**When to use.**
- User clicked "Generate campaign" from a template picker and Scout is composing.
- Cross-post reformatting where Scout needs a beat before showing the result.
- Any generative moment where the user explicitly opted in and expects a *review before commit*.

**When NOT to use.**
- Every generative moment. Most should stream inline (see the narrated proc-line in create-campaign). This modal is for a *commit gate*, not routine drafting.
- Non-Scout loading. Use skeleton bars in place, not a modal.

**Suggested class.** `.gensuggest`.

**Anatomy.**
- Modal shell — 720px max, white, 24px radius, `--camp-shadow-modal-lg`.
- Header — title (28/500 `--camp-text-primary`, "Ai Suggested Campaign") + subtitle (14/400 `--camp-text-secondary`, one sentence).
- Body — a single rounded skeleton card (12px radius, subtle shadow) with 4 pulsing bars at 60% / 100% / 90% / 55% widths, plus a right-corner `.i-kebab` placeholder. Pulse timing per §3.11a.
- Foot — right-aligned: text-button `Cancel` (ghost) + primary `Create` (indigo, disabled until Scout finishes generating).

**Do**
- Keep the skeleton bars proportioned to *suggest text* — varied widths read as prose, uniform widths read as a broken layout.
- Disable `Create` until Scout has produced content behind the skeleton. Enabling it early lets the user commit an empty campaign.
- Fire this modal from an explicit user click. Never auto-open.

**Don't**
- Animate with a moving gradient wipe. Motion language is calm (§3.11a).
- Show a progress percentage. Scout narrates *what* it's doing, not *how much of it* is done.
- Layer this on top of another modal. If a decision needs to happen mid-generation, cancel this one, resolve the decision, re-fire.

---

## 6. Settings sub-nav shell

**Reference.** `Frame 1410089510.png` (Notifications & Alerts), `Settings__Subscription and payment.png`.

**Purpose.** The shell layout for any multi-section settings surface: **inner left rail** with section links (Profile / Account / Notifications / Subscription / Credit Usage / Activity Log) + **main content pane** on the right.

**When to use.**
- Anytime a user is configuring their workspace, account, notifications, billing, or reviewing activity.
- Any "flat catalog of related settings" pattern where each section has its own screen but they share navigation.

**When NOT to use.**
- Single-screen configuration (one form, one save button). Skip the shell — use the page's own layout.
- Wizardy multi-step flows (Create Campaign). That's the campaign-create surface (§3.20).

**Suggested classes.** `.settings-shell`, `.settings-shell__rail`, `.settings-shell__content`.

**Anatomy.**
- **Outer chrome** — same shell as Campaigns: app sidebar, topbar, atmosphere. `body.mode-settings` sits alongside `.mode-campaigns` as a sibling mode.
- **Inner rail (`.settings-shell__rail`)** — 240px column, `--camp-surface` background, 24px top padding. Each row: 16/400 `--camp-text-secondary`, 12/12 padding, `--camp-primary-tint` background + `--camp-primary` text on the active row. Rounded 10px radius on rows.
- **Content pane (`.settings-shell__content`)** — the rest of the panel. Page title (24/500) at top-left. Optional primary CTA (`Save Changes`) top-right.
- **Section rows inside content** — `label + description + control` triples in three columns:
  - Left (~30%): section heading (16/500 primary) + one-line description (13/400 tertiary).
  - Middle: sub-items (`New & Updates`, `Comments`, etc.) stacked with 16px gap.
  - Right: control (toggle switch, radio, dropdown).
- **Divider** — 1px hairline between sections, spanning the middle+right columns only (the label column has more air).

**Do**
- Use the campaigns-mode chrome. Settings is a management surface — it inherits the panel, sidebar, and topbar rules.
- Keep the rail scroll-free. If sections exceed the viewport, the *content* scrolls, not the rail.
- Show the active-row treatment on the rail whenever a section is open. Never leave it unlit.

**Don't**
- Nest a third-level nav. If a section needs sub-navigation, either promote its sub-items to top-level or use in-page tabs (`.p2-tab`, §3.8-adjacent).
- Add a search input inside the rail. If the rail grows past ~8 items, it's the wrong pattern — that's a data table.
- Use a colored background on section rows. The `--camp-primary-tint` is reserved for the *active* rail row.

---

## 7. Form-first campaign create

**Reference.** `Post Playground.png` — "Create Campaign".

**Purpose.** A structured **fallback form** for users who want to fill in a campaign the old way — labeled fields, suggestions, no conversation. This is the escape hatch from the chat-first flow (§3.20), not the primary entry.

**When to use.**
- User explicitly opts out of Scout ("Fill in manually").
- Enterprise workflows where a campaign must be templated before Scout runs.
- Rehydrating a saved draft that was captured as form values (bulk import).

**When NOT to use.**
- The default create flow. Scout leads (§3.20). This form is a compatibility surface.

**Suggested class.** `.ccform` (`cc` prefix aligns with the create-campaign namespace).

**Anatomy.**
- Header — title `Create Campaign` (28/500) + subtitle (14/400).
- **Field row** = `.ccform__field`:
  - Label (14/500 `--camp-text-primary`).
  - Input (`.ccform__input`, 44px height, 12px radius, 1px `--camp-border-input`, `--camp-surface-field` background). No inner shadow.
  - **Optional suggestion block** — for open-ended fields (Campaign Goal, Summary), show `.ccform__suggestions`: a `Suggested Result` label (14/500) + three tap-to-fill rows (14/400 `--camp-text-secondary`), indented 8px.
- **Split rows** — `Starting Date` and `Ending Date` share one row via a 2-col grid.
- **Platform field** — behaves like a select but renders the platform's monochrome mark (`X`, `LinkedIn`) inside the input.
- Location — chip cluster (`.cfield__loc`, §3.12 flavor).
- Foot — right-aligned `Save as Draft` (ghost) + `Run Campaign` (primary).

**Do**
- Use `--camp-surface-field` for input backgrounds. It's the app's "quiet inset" tint and matches the reference exactly.
- Show suggestions **below** the input, not as placeholder text. Suggestions are a KB-driven affordance; placeholder text is a hint.
- Reuse `.cfield__loc` for location chips. One location primitive across the module.

**Don't**
- Introduce a full-page validation summary at the top. Validation happens per-field, inline, at commit.
- Style the primary CTA differently from the standard `.sbtn--primary`. Campaign-run is the *same* button as everywhere else.
- Turn `Suggested Result` into a Scout-authored sparkle chip. The form is the *silent* create path — no Scout branding.

---

## 8. Compact campaign summary card

**Reference.** `X Post Null State.png`, `X Post Null State-1.png`.

**Purpose.** A read-only summary of a campaign's plan — objective, audience, platform, duration, post count, locations. Sits at the top of a campaign detail view, or as a stand-alone card in a review flow.

**When to use.**
- Head of any campaign detail view (running, upcoming, in-draft).
- Approval flow — reviewer wants to see the full plan before scanning the posts.
- Confirmation step in create-campaign after Scout locks in the plan (renders behind the `.cfm` confirmation modal).

**When NOT to use.**
- A card in the campaigns dashboard list — that's `.camp-card` (§3.1). This card is *inside* the surface, not a tile.

**Class.** `.cpanel` + `.cfield` — already documented at §3.12. This entry captures the reference-specific rules the current spec was missing.

**Reference-derived clarifications (append these to §3.12 mental model).**

- **Field icon color.** `--camp-text-secondary` at rest. Never colored (green/red/etc.) — icons are anatomy, not status.
- **Row order.** `Campaign goals → Targeted Audience → Platform → Duration → Post Count → Locations`. This is the mental model in the reference; do not reorder alphabetically.
- **Audience chips.** Neutral (`--camp-primary-tint-cool` bg, `--camp-text-secondary` text). Facts, not choices.
- **Location chips.** Indigo (`--camp-primary-tint` bg, `--camp-primary` text). Choices, not facts. This is the *only* place indigo pills appear in the summary.
- **Post Count.** Show as a bare number ("12"), not an icon-plus-word ("📄 12 posts"). The `--camp-post-count` label carries the noun.
- **Footer.** Right-aligned: `Save as Draft` (ghost) + `Run Campaign` (primary indigo). Never left-aligned; never full-width buttons.

**Do**
- Keep the whole card `--camp-surface-field` background inside a `--camp-surface` outer panel. The nested tint reads as a "quiet inset."
- Use the icon-then-label pattern for each row. Icon is 18px `--camp-text-secondary`, sits to the left of the label.

**Don't**
- Add hover states to rows. This is read-only content, not a menu.
- Mix chip colors within a row. Audience is neutral end-to-end; locations are indigo end-to-end.

---

## 9. Simple list dropdown

**Reference.** `Companies.png` (Daily / Weekly / Monthly).

**Purpose.** A single-column list dropdown with a checkmark on the active row.

**Cross-link.** This is already `.ddmenu` (§3.16 in campaigns.md). Nothing new — the reference confirms the shape.

**When to use.** Any short list where the user picks one value: cadence, timezone, platform, sort order.

**Reference-only clarification.**
- The **checkmark** on the active row is `--camp-primary` (indigo), 16×16, right-aligned. Never a filled radio circle.
- Rows read `14/400 --camp-text-primary`. The active row does *not* bold; the checkmark carries the state.

---

## 10. Date-time picker

**Reference.** `Frame 1410089255.png`.

**Purpose.** Modal for picking a date + time for scheduling a post.

**Cross-link.** This is already `.dtp` (§3.15 in campaigns.md). Nothing new — the reference confirms.

**Reference-only clarification.**
- Modal width is 516px per the reference — do not compress below 460px or the calendar and time columns overlap.
- Time columns are `Hours / Minutes / AM–PM`. Selected cells use `--camp-primary-tint-cool` with `--font-x-preview` numerals.
- Footer: ghost `Cancel` on the left, primary `Schedule Post` on the right. Never a single "Save" button — this modal always affirms the specific action.

---

## 11. Scout avatar parity

**Purpose.** Every place Scout speaks in the campaigns module renders with the *same* avatar treatment as the onboarding conversation — no gradient pill, no glow.

**When to use.**
- Any chat log inside a campaigns surface (create-campaign, campaign detail chat, drawer conversation threads).
- Any Scout-signed row where the avatar sits inline with the "Scout" name.

**When NOT to use.**
- Toolbar or badge treatments where Scout signs a *piece of content* (e.g. the AI badge on a post card, `.postrow__ai-badge`). Those keep the gradient — a badge is a stamp, not a speaker.

**Class.** `.chatmsg__avatar` (Scout variant lives inside `.chatmsg--scout`).

**Spec.**
- 22×22, `border-radius: 50%`, transparent background.
- Colour: `var(--indigo-500, #3C4194)` — the exact onboarding indigo, not the lighter `--camp-primary` (`_shared.css` remaps `--primary` to `--camp-primary` in this context, so we resolve `--indigo-500` directly).
- SVG fills the whole 22×22 avatar. Four `<circle>` marks at `(8,8) (24,8) (8,24) (24,24)` with `r=6` in a `0 0 32 32` viewBox — this IS the logo at rest.
- Loading state (`.chatmsg__avatar--loading`) reuses the same four circles with `ccScoutLoaderPulse` — 1.4s cycle, 350ms phase offsets, dip to `scale(0.25) opacity 0.4` at 25% of each circle's cycle. The animation is *the avatar*.

**Head row.** Avatar sits inline with a 14/600 indigo "Scout" name (`.chatmsg__author`) via `.chatmsg__head`. Only the **most recent** Scout turn shows the head — previous turns get `.chatmsg--past` to hide it. This matches the onboarding "one live speaker" rule.

**Body.** Plain text (`.chatmsg__text`, 16/1.6 `--camp-text-secondary`). No bubble, no border, no background — the message *is* the text.

**Do**
- Retire previous Scout turns with `.chatmsg--past` before appending a new one. The stream should never wall up avatars.
- Swap the loading SVG for `<use href="#i-logo"/>` once the typewriter starts.

**Don't**
- Wrap the avatar in a filled pill. That was the old campaigns-mode treatment; the new direction is flat parity.
- Rebrand "Scout" with `--text-scout` in this file (remapped to lighter `--camp-primary`). Use `--indigo-500` directly.

---

## 12. QDock

**Purpose.** When Scout asks a question, the composer transforms into a **docked overlay** at the bottom of the surface that combines numbered options with the free-text input. The user can *either* click an option or type their own reply.

**Class.** `.cc-qdock`.

**When to use.**
- Scout is asking a question with a small, closed set of preferred answers (2–6 options), and a custom answer is still valid.
- Replaces the older inline pill/chip pattern (`.cc-qreplies`, `.cc-chips`) in any campaign-create or campaign-refine flow.

**When NOT to use.**
- Aesthetic preference picks. Scout picks and narrates (per §3.9 firing rule).
- Multi-select. If the user needs to pick many things, use `.opt-group` (§3.9) or a schedule dropdown (§3.20.6) instead.
- Free-text-only prompts. Just leave the composer active — no dock needed.

**Anatomy.**
- Positioned fixed at bottom, tracks the same geometry as `.cc-composer-dock` (left: `--cc-gutter-left`, right: `--cc-gutter-right`, bottom: 28px). When `body.has-side-panel`, right shifts to `--cc-panel-w` (flush against the drawer).
- Card: white, `1px --camp-border-hairline` border, `16px` radius, single soft shadow (`0 6px 20px rgba(15,23,42,0.08)`). Slides in with `ccQDockIn` (14px translate + fade, 420ms emphasized).
- **Header** — small step chip (`10/700` `--indigo-500` on `--camp-primary-tint`, optional), question title (15/600 `--camp-text-primary`), skip `×` (28px, ghost hover).
- **Option rows** — `1fr auto auto` grid: label + optional sub + optional `Recommended` chip + right-side numbered badge (24×24, 6px radius, `--camp-surface-hover` tint by default, `--indigo-500` fill for the primary).
- **Composer input** — sits at the foot of the card, separated by a hairline top border. Same input pill treatment as `.chat-composer` but embedded (no outer border). Placeholder: `Type your own answer here`. Send button gates on non-empty input.

**Behavior.**
- Opening the QDock adds `body.has-qdock` — the normal composer-dock hides.
- Click an option → user message echoes in chat, dock closes, resolves with option's `value`.
- Type + Enter → user message echoes in chat, dock closes, resolves with the raw text (caller distinguishes custom text from known option values).
- `×` or Escape → dock closes, resolves with `skip`.
- Focus the input on open — keyboard-first users can start typing without clicking.

**Do**
- Keep options between 2 and 6. Beyond 6, use a dropdown or a fresh scoped-regen dialog.
- Mark exactly one option `primary: true` if there's a Scout recommendation. It gets a `Recommended` chip and a filled indigo number badge.
- Left-anchor the card when `body.has-side-panel` — flush to the chat column, no auto-centering.

**Don't**
- Nest an option-group inside the QDock. Option groups have their own primitives (§3.9).
- Style the QDock like a modal. It's a dock — no backdrop, no focus trap, no blocking.
- Reuse the QDock for confirmation ("Are you sure?"). That's a `.cfm` modal (§3.17).

---

## Changelog

| Date | Change |
|---|---|
| 2026-07-05 | Initial version. Twelve reference-derived patterns catalogued: post list rows, flat drawer, scheduled preview, payment card, AI-suggested loading, settings shell, form-first create, compact summary, list dropdown, DTP, Scout avatar parity, QDock. |
