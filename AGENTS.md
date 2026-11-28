## Simple Operations

Follow [Infrastructure Simple Operations v1.1](https://github.com/harvj/infrastructure/blob/main/docs/standards/simple-operations-v1.md). Use one dedicated non-root Unix account per application for deploy and runtime, with independent files, processes, writable directories, and PostgreSQL databases and roles. Restrict SSH and administrative access. Use one established deployment path (Capistrano for existing Rails apps) and one exact-release approval. Keep trusted CI, exact-artifact verification, reviewed migrations, verified backups and restore, health checks, and compatible application-only rollback. Prefer removing or consolidating controls. Explain the concrete need, existing alternatives, replacement, and upkeep before adding complexity. Obtain explicit operator approval for exceptions and new privileged machinery, required gates, persistent services, or authorization systems. Existing approved paths remain usable until individually migrated.

## Design review screenshots

For visual UI changes, retain a concise, representative set of actual browser screenshots under `docs/design/` in the application repository, with a short README and relative image links for GitHub review. Include relevant desktop/mobile and light/dark states; use before/after captures when useful. Temporary `/tmp` screenshots are development artifacts, not final review evidence. Do not add a new CI gate or enforcement mechanism for this convention.

## REL-01 release integrity

Qualify the exact source SHA and canonical Git archive digest against protected
GitHub main before changing the serving checkout. Keep the existing protected
checkout deployment and verify the running revision. Follow
[Infrastructure REL-01](https://github.com/harvj/infrastructure/blob/main/docs/standards/main-branch-release-integrity.md).
