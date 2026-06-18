---
type: bookmark
para: resource
domain: ai-tools
title: "Claude Code History Viewer"
url: "https://github.com/jhlee0409/claude-code-history-viewer"
summary: "desktop app，統一瀏覽/分析 9 個 AI coding assistant 對話歷史，完全離線（Tauri、MIT、本機已裝 v1.13）"
status: active
created: 2026-06-17
updated: 2026-06-18
related:
  - "[[usage (menu bar 用量工具)]]"
  - "[[ccusage]]"
tags:
  - bookmark
  - found-by-claude
  - ai-tools
  - claude-code
  - conversation-history
  - tauri
---

# Claude Code History Viewer

- URL: https://github.com/jhlee0409/claude-code-history-viewer
- Saved date: 2026-06-17
- Topic: 跨 AI coding assistant 嘅對話歷史瀏覽 / 分析 desktop app
- Status: active（**已安裝喺本機** `/Applications/Claude Code History Viewer.app` v1.13.0，bundle `com.claude.history-viewer`）

## Why I saved this

我裝咗嚟睇返 Claude Code 對話歷史嘅 desktop viewer，記低官方 repo 方便更新／睇功能。

## Summary

- **係咩**：desktop app，統一介面瀏覽／分析 **9 個 AI coding assistant** 嘅對話歷史（Claude Code、Gemini CLI、Cline、Cursor 等）。
- **離線**：完全 local，無 cloud 依賴。
- **作者／License**：`jhlee0409` ・ MIT ・ 主語言 TypeScript（66.8%）・ Tauri（Rust + webview）。
- **Stars**：~1.6k（截至 2026-06-17）・**最新 release**：v1.13.0（2026-05-25）。

## Key Takeaways

- 功能：搜尋對話、token 統計、analytics dashboard 分析 workflow、跨工具 settings 管理。
- 多 provider 支援 + real-time file monitoring、ANSI 色彩渲染。
- 可及性：keyboard navigation、screen reader 支援。
- 形態：desktop（macOS / Windows / Linux）＋ headless server mode（遠端）。

## My Notes

（待補）

## Related
- [[usage (menu bar 用量工具)]]
- [[ccusage]]
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-18），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://github.com/jhlee0409/claude-code-history-viewer　・　抽取 defuddle 2026-06-18 HKT，已剝 badge/圖片雜訊。

## Claude Code History Viewer

**The unified history viewer for AI coding assistants.**

Browse, search, and analyze conversations from **Claude Code**, **Gemini CLI**, **Antigravity**, **Codex CLI**, **Cline**, **Cursor**, **Aider**, **OpenCode**, **ForgeCode**, and **CodeBuddy Code** — as a desktop app or headless server. 100% offline.

[Website](https://jhlee0409.github.io/claude-code-history-viewer/) · [Download](https://github.com/jhlee0409/claude-code-history-viewer/releases) · [Report Bug](https://github.com/jhlee0409/claude-code-history-viewer/issues)

**Languages**: [English](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/README.md) | [한국어](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/README.ko.md) | [日本語](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/README.ja.md) | [中文 (简体)](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/README.zh-CN.md) | [中文 (繁體)](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/README.zh-TW.md)

---

## Quick Start

**Desktop app** — download and run:

| Platform | Download |
| --- | --- |
| macOS (Universal) | [`.dmg`](https://github.com/jhlee0409/claude-code-history-viewer/releases/latest) |
| Windows (x64) | [`.exe`](https://github.com/jhlee0409/claude-code-history-viewer/releases/latest) / [`.zip` (portable)](https://github.com/jhlee0409/claude-code-history-viewer/releases/latest) |
| Linux (x64) | [`.AppImage`](https://github.com/jhlee0409/claude-code-history-viewer/releases/latest) |

**Homebrew** (macOS):

```
brew install --cask jhlee0409/tap/claude-code-history-viewer
```

**Headless server** — access from any browser:

```
brew install jhlee0409/tap/cchv-server   # or: curl -fsSL https://...install-server.sh | sh
cchv-server --serve                       # → http://localhost:3727
```

See [Server Mode](#server-mode-webui) for Docker, VPS, and systemd setup.

---

## Why This Exists

AI coding assistants generate thousands of conversation messages, but none of them provide a way to look back at your history across tools. CCHV solves this.

**Ten assistants. One viewer.** Switch between Claude Code, Gemini CLI, Antigravity, Codex CLI, Cline, Cursor, Aider, OpenCode, ForgeCode, and CodeBuddy Code sessions seamlessly — compare token usage, search across providers, and analyze your workflow in a single interface.

| Provider | Data Location | What You Get |
| --- | --- | --- |
| **Claude Code** | `~/.claude/projects/` | Full conversation history, tool use, thinking, costs |
| **Gemini CLI** | `~/.gemini/history/` | Conversation history with tool calls |
| **Antigravity** | `~/.gemini/antigravity/` | Conversation state under `brain/` plus token monitor data under `.token-monitor/rpc-cache/v1/` |
| **Codex CLI** | `~/.codex/sessions/` | Session rollouts with agent responses |
| **Cline** | `~/.cline/tasks/` | Task-based conversation history |
| **Cursor** | `~/.cursor/` | Composer and chat conversations |
| **Aider** | Project directories | Chat history and edit logs |
| **OpenCode** | `~/.local/share/opencode/` | Conversation sessions and tool results |
| **ForgeCode** | `~/.forge/.forge.db` | Conversation history from SQLite database |
| **CodeBuddy Code** | `~/.codebuddy/projects/` | Conversation history with tool calls (Claude Code fork format) |

No vendor lock-in. No cloud dependency. Your local conversation files, beautifully rendered.

Antigravity note: the viewer resolves the Antigravity root as `~/.gemini/antigravity` and then reads session state from `brain/` plus usage/cache artifacts from `.token-monitor/rpc-cache/v1/`; this matches the current runtime layout and root resolver in `src-tauri/src/commands/antigravity.rs`.

## Table of Contents

## Features

### Core

| Feature | Description |
| --- | --- |
| **Multi-Provider Support** | Unified viewer for **Claude Code**, **Gemini CLI**, **Antigravity**, **Codex CLI**, **Cline**, **Cursor**, **Aider**, **OpenCode**, **ForgeCode**, and **CodeBuddy Code** — filter by provider, compare across tools |
| **Conversation Browser** | Navigate conversations by project/session with worktree grouping |
| **Global Search** | Search across all conversations from all providers instantly |
| **Analytics Dashboard** | Dual-mode token stats (billing vs conversation), cost breakdown, and provider distribution charts |
| **Session Board** | Multi-session visual analysis with pixel view, attribute brushing, and activity timeline |
| **Settings Manager** | Scope-aware Claude Code settings editor with MCP server management |
| **Message Navigator** | Right-side collapsible TOC for quick conversation navigation |
| **Real-time Monitoring** | Live session file watching for instant updates |

### Provider Notes

| Provider | Notes |
| --- | --- |
| **Antigravity** | Loaded through the standard provider pipeline. Sessions come from the token monitor cache and participate in project/session views, token stats, analytics, and global search without a separate UI mode. |

### New in v1.14.0

| Feature | Description |
| --- | --- |
| **CodeBuddy Code Provider** | Added CodeBuddy Code — browse its conversation history alongside your other AI coding assistants |
| **WebUI Account Login** | `--serve` mode gains optional account authentication (Argon2id + server-side sessions + CSRF), a read-only mode, and base-path support for reverse-proxy hosting |
| **Persistent Message Filters** | Role and content-type filters now persist across session switches and app restarts |
| **Subagent Session Stability** | Fixed multi-subagent click mapping and an occasional crash when opening large subagent sessions |
| **Linux IME Input** | Fixed ibus/fcitx input (Korean, Chinese, Japanese) in the search box on Linux |

### v1.13.0

| Feature | Description |
| --- | --- |
| **macOS Custom Title Bar** | Draggable overlay header replaces the legacy macOS title bar for consistent screen-space use; Linux/Windows unaffected |
| **Session Source Filter** | Filter sessions by where they were created — CLI, VS Code, or Desktop — using Claude Code's `entrypoint` field |
| **Codex Resume Support** | Right-click "Copy Resume Command" now works for Codex sessions and prefixes `cd '<cwd>' && ` so paste-and-run lands in the original directory |
| **Pricing Accuracy** | Fixed `claude-opus-4-7` 3× overcharge; added `gpt-5.4` / `gpt-5.5` pricing with Codex cached-token handling |
| **macOS Updater Reliability** | Native OS-level relaunch fallback for the Tauri v2 macOS relaunch bug — no more "please quit and reopen" |

### v1.12.0

| Feature | Description |
| --- | --- |
| **Two New Providers** | Added **Antigravity** and **ForgeCode** — now supports 9 AI coding assistants |
| **External Session Launch** | New `--session <uuid>` CLI flag with single-instance enforcement and macOS Apple Events for re-invocation |
| **Sub-agent Filter** | Toggle sub-agent messages on/off from the header dropdown |
| **Context Menu Polish** | Right-click menus rendered in portal for cursor-precise anchoring; clamp to panel bounds; close on scroll |
| **Custom Directory** | Custom Claude directory selection now applies instantly without restart |

> Older releases: see [CHANGELOG.md](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/CHANGELOG.md) for v1.11.0 and earlier.

### More

| Feature | Description |
| --- | --- |
| **Session Context Menu** | Copy session ID, resume command, file path; delete session, show JSONL file; native rename with search integration |
| **ANSI Color Rendering** | Terminal output displayed with original ANSI colors |
| **Multi-language** | English, Korean, Japanese, Chinese (Simplified & Traditional) |
| **Recent Edits** | View file modification history and restore |
| **Auto-update** | Built-in updater with skip/postpone options |

## Installation

### Homebrew (macOS)

```
brew tap jhlee0409/tap
brew install --cask claude-code-history-viewer
```

Or install directly with the full cask path:

```
brew install --cask jhlee0409/tap/claude-code-history-viewer
```

If you see `No Cask with this name exists`, run the full cask path command above.

To upgrade:

```
brew upgrade --cask claude-code-history-viewer
```

To uninstall:

```
brew uninstall --cask claude-code-history-viewer
```

> **Migrating from manual (.dmg) installation?** Remove the existing app before installing via Homebrew to avoid conflicts. Choose **one** installation method — do not mix manual and Homebrew installs.
>
> ```
> # Remove the manually installed app first
> rm -rf "/Applications/Claude Code History Viewer.app"
> # Then install via Homebrew
> brew tap jhlee0409/tap
> brew install --cask claude-code-history-viewer
> ```

## Build from Source

```
git clone https://github.com/jhlee0409/claude-code-history-viewer.git
cd claude-code-history-viewer

# Option 1: Using just (recommended)
brew install just    # or: cargo install just
just setup
just dev             # Development
just tauri-build     # Production build

# Option 2: Using pnpm directly
pnpm install
pnpm tauri:dev       # Development
pnpm tauri:build     # Production build
```

**Requirements**: Node.js 18+, pnpm, Rust toolchain

## Server Mode (WebUI)

Run the viewer as a headless HTTP server — no desktop environment required. Ideal for VPS, remote servers, or Docker. The server binary embeds the frontend — **a single file is all you need**.

> **New to server deployment?** See the full [Server Mode Guide](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/docs/server-guide.md) ([한국어](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/docs/server-guide.ko.md)) for step-by-step instructions covering local testing, VPS setup, Docker, and more.

### Quick Install

```
# Homebrew (macOS / Linux)
brew install jhlee0409/tap/cchv-server

# Or one-line script
curl -fsSL https://raw.githubusercontent.com/jhlee0409/claude-code-history-viewer/main/install-server.sh | sh
```

Both methods install `cchv-server` to your PATH.

### Start the Server

```
cchv-server --serve
```

Output:

```
🔑 Auth token: b77f41d4-ec24-4102-8f7a-8a942d6dd4a0
   Open in browser: http://192.168.1.10:3727?token=b77f41d4-ec24-4102-8f7a-8a942d6dd4a0
👁 File watcher active: /home/user/.claude/projects
🚀 WebUI server running at http://0.0.0.0:3727
```

Open the URL in your browser — the token is saved automatically.

### Pre-built Binaries

| Platform | Asset |
| --- | --- |
| Linux x64 | `cchv-server-linux-x64.tar.gz` |
| Linux ARM64 | `cchv-server-linux-arm64.tar.gz` |
| macOS ARM | `cchv-server-macos-arm64.tar.gz` |
| macOS x64 | `cchv-server-macos-x64.tar.gz` |

Download from [Releases](https://github.com/jhlee0409/claude-code-history-viewer/releases).

**CLI options:**

| Flag | Default | Description |
| --- | --- | --- |
| `--serve` | — | **Required.** Starts the HTTP server instead of the desktop app |
| `--port <number>` | `3727` | Server port |
| `--host <address>` | `0.0.0.0` | Bind address (`127.0.0.1` for local only) |
| `--token <value>` | auto (uuid v4) | Custom authentication token |
| `--no-auth` | — | Disable authentication (not recommended for public networks) |
| `--dist <path>` | embedded | Override built-in frontend with external `dist/` directory |

### Authentication

All `/api/*` endpoints are protected by Bearer token authentication. The token is auto-generated on each server start and printed to stderr.

- **Browser access**: Use the `?token=...` URL printed at startup. The token is saved to `localStorage` automatically.
- **API access**: Include `Authorization: Bearer <token>` header.
- **Custom token**: `--token my-secret-token` to set your own.
- **Environment variable**: `CCHV_TOKEN=your-token cchv-server --serve` (useful for systemd/Docker).
- **Disable**: `--no-auth` to skip authentication entirely (only use on trusted networks).

### Real-time Updates

The server watches `~/.claude/projects/` for file changes and pushes updates to the browser via Server-Sent Events (SSE). When you use Claude Code in another terminal, the viewer updates automatically — no manual refresh needed.

### Docker

```
docker compose up -d
```

Check the token after startup:

```
docker compose logs webui
# 🔑 Auth token: ... ← paste this URL in your browser
```

The `docker-compose.yml` mounts `~/.claude`, `~/.codex`, and `~/.local/share/opencode` as read-only volumes.

### systemd Service

For persistent server on Linux, use the provided systemd template:

```
sudo cp contrib/cchv.service /etc/systemd/system/
sudo systemctl edit --full cchv.service   # Set User= to your username
sudo systemctl enable --now cchv.service
```

### Build from Source (Server Only)

```
just serve-build           # Build frontend + embed into server binary
just serve-build-run       # Build and run (embedded assets)

# Or run in development (external dist/):
just serve-dev             # Build frontend + run server with --dist
```

### Health Check

```
GET /health
→ { "status": "ok" }
```

## Usage

1. Launch the app
2. It automatically scans for conversation data from all supported providers (Claude Code, Gemini CLI, Codex CLI, Cline, Cursor, Aider, OpenCode, ForgeCode, CodeBuddy Code)
3. Browse projects in the left sidebar — filter by provider using the tab bar
4. Click a session to view messages
5. Use tabs to switch between Messages, Analytics, Token Stats, Recent Edits, and Session Board

### Command-line flags

Launch the app pre-focused on a specific session by passing a `--session` flag:

```
# Full UUID
claude-code-history-viewer --session 1265cd74-caa9-472e-b343-c4f44b5cf12c

# UUID prefix (8+ hex-or-dash chars, up to 36) — first match wins
claude-code-history-viewer --session 1265cd74

# Equals form also works
claude-code-history-viewer --session=1265cd74
```

The viewer scans every known project, navigates to the matching session, and falls back to normal startup if no session matches. Values that are neither hex-or-dash of length 8..36 nor an absolute path are silently ignored.

## Accessibility

The app includes accessibility features for keyboard-only, low-vision, and screen-reader users.

- Keyboard-first navigation:
	- Skip links for Project Explorer, Main Content, Message Navigator, and Settings
		- Project tree navigation with `ArrowUp/ArrowDown/Home/End`, type-ahead search, and `*` to expand sibling groups
		- Message navigator navigation with `ArrowUp/ArrowDown/Home/End` and `Enter` to open the focused message
- Visual accessibility:
	- Persistent global font size scaling (`90%`, `100%`, `110%`, `120%`, `130%`)
		- High contrast mode toggle in settings
- Screen reader support:
	- Landmark and tree/list semantics (`navigation`, `tree`, `treeitem`, `group`, `listbox`, `option`)
		- Live announcements for status/loading and project tree navigation/selection changes
		- Inline keyboard-help descriptions via `aria-describedby`

## Tech Stack

| Layer | Technology |
| --- | --- |
| **Backend** |   |
| **Frontend** |    |
| **State** |  |
| **Build** |  |
| **i18n** |  5 languages |

## Data Privacy

**100% offline.** No conversation data is sent to any server. No analytics, no tracking, no telemetry.

Your data stays on your machine.

## Troubleshooting

| Problem | Solution |
| --- | --- |
| "No Claude data found" | Make sure `~/.claude` exists with conversation history |
| Performance issues | Large histories may be slow initially — the app uses virtual scrolling |
| Update problems | If auto-updater fails, download manually from [Releases](https://github.com/jhlee0409/claude-code-history-viewer/releases) |

## Contributing

Contributions are welcome! Here's how to get started:

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Run checks before committing:
	```
	pnpm tsc --build .        # TypeScript
	pnpm vitest run            # Tests
	pnpm lint                  # Lint
	```
4. Commit your changes (`git commit -m 'feat: add my feature'`)
5. Push to the branch (`git push origin feat/my-feature`)
6. Open a Pull Request

See [Development Commands](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/CLAUDE.md#development-commands) for the full list of available commands.

## License

[MIT](https://github.com/jhlee0409/claude-code-history-viewer/blob/main/LICENSE) — free for personal and commercial use.

---

If this project helps you, consider giving it a star!

## Key Comments

（非社交媒體，原頁無公開留言區 → 不適用。本類 reference source（repo / gist / 官方文件）link-rot 風險低。）
