# Package Sets

A curated list of [PureScript Lua](https://github.com/Unisay/purescript-lua) packages for the `spago` package manager.

- [What is a package-set?](#what-is-a-package-set)
- [Add your package](#adding-your-package)
- [How do I use package-sets with `spago`?](#how-do-i-use-package-sets-with-spago)

## What is a package set?

A package set is a collection of packages in which there is only one version for each package, and the entire collection of packages compiles successfully together. A package set ensures you can always install a package from the set without introducing a conflict in your dependencies.

If you use a package manager based on package sets, that means that to install a package:

1. The package must be in the package set
2. The package's dependencies and transitive dependencies must also be in the package set

## Adding your package

This repository aims to be a good collection of packages you can depend on.

If you would like to add your new package to the package sets, please make a PR.

## How do I use `package-sets` with `spago`?

[`spago`][spago] is a package manager and build tool for PureScript which uses Dhall package sets. This makes them easy to extend and override.

With `spago` the package-set address is specified in the `upstream` variable of your local `packages.dhall`, which will usually import a remote `packages.dhall`, e.g. the one from this repo. You can change the package-set version you are using by running `spago upgrade-set`, or if you want to point to a particular version, `spago upgrade-set --tag <tag>`.

## How do I use `package-sets` with psc-package?

[`psc-package`][psc-package] is a package manager for PureScript that works essentially by running a bunch of git commands. It is not maintained by the PureScript core team and we recommend using Spago instead.

With `psc-package` the package-set address is set in the `source` field of a `psc-package.json` file, which should list the URL of a repository with a `packages.json` file in the root (such as this one). Your configuration should look something like this:

```json
{
  "name": "project-name",
  "set": "set-name",
  "source": "https://github.com/purescript/package-sets.git",
  "depends": ["aff", "console", "prelude"]
}
```

[spago]: https://github.com/purescript/spago
