# Contributing to depsls

Thank you for your interest in contributing to [depsls](https://github.com/pixel365/depsls)! Please follow these guidelines to ensure your contributions are helpful and easy to integrate.

## General Guidelines

- Install the Rust toolchain (stable version recommended) via [rustup](https://rustup.rs).
- Ensure the following components and tools are installed for testing and verification:
  - `rustfmt` (code formatting)
  - `clippy` (linting)
  - `cargo-deny` (dependency advisories, licenses, and sources; configured in `deny.toml` and run with `make deny`)
- Read the [README.md](README.md) and documentation before starting.
- Ensure your code follows Rust's official style guide using the provided automation.
- Keep the code readable, idiomatically Rust, and add comments where necessary.
- Open an issue before making significant changes.

## How to Contribute

1. **Fork the repository** and create a new branch:
   ```sh
   git checkout -b feature/my-feature
   ```
2. **Develop your changes**, ensuring tests and documentation are updated.
3. **Run checks** before committing to ensure everything formats, lints, and passes tests:
   ```sh
   make all
   ```
   _Note: You can run specific checks using `make fmt`, `make clippy`, or `make test`, and `make help` lists every available target._
4. **Commit your changes** with a meaningful message:
   ```sh
   git commit -m "feat: add new functionality"
   ```
5. **Push your changes** to your fork and create a Pull Request (PR).

## Pull Request Requirements

- PRs should be small and focused on a single task.
- Provide a description of changes and link to the relevant issue (if applicable).
- PRs must pass all automated checks (CI/CD) before merging.
- Ensure your code is covered by tests where necessary (unit, integration, or doc-tests).

## Releasing

Releases are cut by pushing a tag, and the pipeline refuses to publish if the
repository is not ready for it. Prepare the release commit first:

1. Move the entries from `## [Unreleased]` in [CHANGELOG.md](CHANGELOG.md) into a
   new `## [X.Y.Z] - YYYY-MM-DD` section, leave a fresh empty `## [Unreleased]`
   above it, and update the link references at the bottom of the file.
2. Set the same `X.Y.Z` as `version` in `Cargo.toml` and refresh `Cargo.lock`.
3. Commit both files, then tag the commit as `vX.Y.Z` and push the tag.

The release workflow fails before building anything if the tag does not match the
crate version, or if `CHANGELOG.md` has no section for it. That section becomes
the body of the published GitHub release, so the changelog and the release notes
cannot drift apart.

## Working with Issues

- Before opening a new issue, check if it already exists.
- Provide a clear problem description with examples if possible.
- For bugs, include your Rust version (`rustc --version`), Cargo version, system details, reproduction steps, and expected behavior.

Thank you for contributing to [depsls](https://github.com/pixel365/depsls)! 🚀
