#!/usr/bin/env bash
# Stop hook: 若 vault 有未 commit 的變更，提醒使用者存一版（不會自動 commit）。
cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0
changes="$(git status --porcelain 2>/dev/null)"
[ -z "$changes" ] && exit 0
n="$(printf '%s\n' "$changes" | grep -c .)"
printf '{"systemMessage": "📝 有 %s 個未 commit 的變更 — 要存一版嗎？跟我說「commit」即可。"}\n' "$n"
