# Emacs configuration

Straight.el is used for package management, with versions pinned in
(the lockfile). Commit the lockfile after intentionally upgrading
package.

## Installing the pre-commit hook

A git pre-commit hook rejects commits while the checked-out packages
don't match the lockfile.

```
ln -s ../../scripts/check-straight-lockfile .git/hooks/pre-commit
```

Commits will be rejected while any package repo's `HEAD` differs from
the lockfile. Run `M-x straight-freeze-versions`, stage the updated
`straight/versions/default.el`, and retry.
