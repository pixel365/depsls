# Security Policy

## Supported Versions

We actively maintain and patch security issues for the latest release version of `depsdev`.

## Reporting a Vulnerability

If you discover a security vulnerability, please report it **privately**.

You can contact the maintainer directly via email:

📧 **pixel.365.24@gmail.com**

Please include:

- A clear description of the issue
- Steps to reproduce (if applicable)
- Any potential impact

Do **not** create public GitHub issues for security concerns.
We aim to respond to all reports within **72 hours** and will coordinate disclosure responsibly.

## Release Artifacts

Each release publishes, for every supported platform:

| Artifact | Description |
| --- | --- |
| `depsdev_<version>_<os>_<arch>.tar.gz` (`.zip` on Windows) | The release archive containing the binary |
| `<archive>.sig` | Detached GPG signature of that archive |
| `<archive>.sbom.json` | SPDX SBOM generated with [syft](https://github.com/anchore/syft) |
| `depsdev_<version>_checksums.txt` | SHA-256 checksums of every archive and SBOM in the release |
| `depsdev_<version>_checksums.txt.sig` | Detached GPG signature of the checksum file |

`<version>` is the release version without the leading `v` (for example `1.0.0`),
`<os>` is one of `linux`, `darwin`, `windows`, and `<arch>` is `amd64` or `arm64`.

All signatures, checksums, and SBOMs are produced by a single job after every
platform has been built, so the Windows archive is signed exactly like the others.

## Verifying a Release

Import the signing key:

```
Fingerprint: 59E2 D7E1 C4AE FA9F 891A  5845 C5EE 0737 09C7 B615
Key ID:      C5EE073709C7B615
Type:        ed25519, created 2025-01-16
```

```bash
gpg --keyserver keys.openpgp.org --recv-keys 59E2D7E1C4AEFA9F891A5845C5EE073709C7B615
```

Always compare the fingerprint reported by `gpg` against the one above rather
than trusting the key the keyserver happened to return.

Then verify the archive you downloaded:

```bash
gpg --verify depsdev_1.0.0_linux_amd64.tar.gz.sig depsdev_1.0.0_linux_amd64.tar.gz
```

Checksums can be checked on their own. Verify the signature of the checksum file
first, otherwise the checksums themselves are untrusted:

```bash
gpg --verify depsdev_1.0.0_checksums.txt.sig depsdev_1.0.0_checksums.txt
sha256sum --ignore-missing -c depsdev_1.0.0_checksums.txt
```
