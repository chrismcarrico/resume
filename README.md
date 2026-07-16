# resume

## Building locally

Requires the [texbuilder](https://github.com/chrismcarrico/texbuilder) Docker image (`texbuilder:0.1.0`).

```
make build   # compiles carrico_resume.tex -> carrico_resume.pdf
make clean   # removes build output
```

## Pre-push build check

A git hook verifies `carrico_resume.tex` still compiles before any push. It's
versioned in `.githooks/` rather than `.git/hooks/`, so it needs to be enabled
once per clone:

```
git config core.hooksPath .githooks
```

After that, `git push` will run `make build` first and abort the push if the
document fails to compile. Skip it for a single push with `git push --no-verify`.

## Published PDF

`carrico_resume.pdf` is not committed to `master`. On every push to `master`
that touches `carrico_resume.tex`, a GitHub Actions workflow
(`.github/workflows/publish-pdf.yml`) compiles the document and force-pushes
the result as the sole commit on the `pdf` branch. `index.html` points at
that branch's raw URL, so the hosted resume always reflects the latest build
without binary diffs living in `master`'s history.
