# Git workflow

Git Flow. Never commit directly to `main` or `develop`; every change goes through a PR.

| Branch | From | Merges into | Purpose |
| --- | --- | --- | --- |
| `main` | — | — | Released code only. Every release is a tag on `main`. |
| `develop` | `main` | — | Integration branch for ongoing work. |
| `feature/*`, `fix/*`, `chore/*`, `docs/*`, `refactor/*` | `develop` | `develop` | One task per branch. Keep it short-lived. |
| `release/x.y.z` | `develop` | `main`, then `develop` | Release stabilization: bug fixes, version bump, changelog. No new features. |
| `hotfix/x.y.z` | `main` | `main`, then `develop` (or the open `release/*` branch, if one exists) | Urgent fix for a released version. |

- Merge strategy:
  - Task branches into `develop`: squash merge.
  - `release/*` and `hotfix/*` into `main`: merge commit only, never squash or rebase. Squashing breaks the shared history of `main` and `develop`.
  - Back-merges into `develop`: merge commit.
- After every merge into `main`, back-merge into `develop` so release and hotfix fixes are not lost.
- Versions follow SemVer. Tags are annotated, with a `v` prefix, created on `main` after the merge: `git tag -a v1.2.0 -m "v1.2.0"`. Pre-releases look like `v1.2.0-beta.1`.
- Commit messages and squash-merge PR titles follow Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`). The type matches the branch prefix (`feature/*` → `feat:`).
- Delete branches after they are merged.
