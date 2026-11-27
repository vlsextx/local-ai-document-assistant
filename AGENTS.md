# AGENTS.md

## Feedback loop

- Project commands live in the `justfile` (`just --list`).
- After making changes, run `just check`. A task is not done until it passes.
- The stack is not chosen yet, so recipes are stubs. When adding tools (linter, tests, etc.), wire them into the matching recipe without renaming it.

## Language

- Everything in the repository is written in English: code identifiers, comments, docstrings, log messages, error messages, CLI/UI text, test names, docs, commit messages, and PR titles and descriptions.
- Exception: translation (locale) files, which contain the localized strings.
- User-facing text must not be hard-coded in another language. Once i18n is set up, load it from the translation files.

## Git workflow

- Never commit directly to `main` or `develop`; every change goes through a PR.
- Before creating a branch, commit, tag, merge or PR, read [docs/git-workflow.md](docs/git-workflow.md).

## Objections

- If you have a substantive objection to a requested change (it is incorrect, unsafe, risks data loss, conflicts with these rules, or a clearly better approach exists), state it and stop. Do not proceed until the user confirms.
- Minor remarks (style, naming, small alternatives) can be mentioned without stopping.
