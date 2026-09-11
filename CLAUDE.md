# CLAUDE.md — repo operating rules

Inherits ~/Rajiv/Developer/CLAUDE.md (workspace-level gates). This file only adds repo-specific detail.

## Model-tier routing for this repo
- architecture (ADRs, security review, cross-cutting design): claude-opus tier
- daily coding (default agent driver): claude-sonnet tier
- subagent (lint-fix loops, doc generation, repetitive refactors): claude-haiku tier or local Ollama

## Quality gates before opening a PR
1. `make check` passes locally (ruff, mypy, pytest, gitleaks).
2. Diff reviewed against `engineering:code-review` checklist (correctness, security, perf, missing tests).
3. No secret literals in the diff (gitleaks + manual scan of any new config/example files).
4. README/docs updated if behavior changed.
5. Commit messages are Conventional Commits; one logical change per commit.

## Skills
Repo-local skills live in `.claude/skills/<name>/SKILL.md`. Only add a skill here if it's reused
across 3+ tasks in this repo; otherwise keep instructions in this file.
