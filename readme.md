# Switch dependency version for lix client

[lix](https://github.com/lix-pm/lix.client) is a package manager for Haxe projects.

This is a tool to easily switch a Haxe dependency version.

## Installation

Install with a custom name for convenience:

```
lix install gh:elsassph/lix-switch-version as switch
```

## Usage

If you have `dep-name` installed you can switch its version or branch/tag
without having to enter the full qualified installation URL:

```
lix switch <dep-name> <version>
```

This will effectively execute `lix install <lib-URL>#<version> as <dep-name>`,
based on the download URL present in `haxe_libraries/<lib-name>.hxml`.

## License

MIT license
