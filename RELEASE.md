# GF Core releases

**Note:**
The RGL is now released completely separately from GF Core.
See the [RGL's RELEASE.md](https://github.com/GrammaticalFramework/gf-rgl/blob/master/RELEASE.md).

## Creating a new release

### 1. Prepare the repository

**Web pages**

1. Create `download/index-X.Y.md` with installation instructions.
2. Create `download/release-X.Y.md` with changelog information.
3. Update `download/index.html` to redirect to the new version.
4. Add announcement in news section in `index.html`.

**Version numbers**

1. Update version number in `gf.cabal` (ommitting `-git` suffix).
2. Add a new line in `debian/changelog`.

### 2. Create GitHub release

1. When the above changes are committed to the `master` branch in the repository
  and pushed, check that all CI workflows are successful (fixing as necessary):
  - <https://github.com/GrammaticalFramework/gf-core/actions>
  - <https://travis-ci.org/github/GrammaticalFramework/gf-core>
2. Create a GitHub release [here](https://github.com/GrammaticalFramework/gf-core/releases/new):
  - Tag version format `RELEASE-X.Y`
  - Title: "GF X.Y"
  - Description: mention major changes since last release
3. Publish the release to trigger the building of the binary packages (below).

### 3. Binary packages

The binaries will be built automatically by GitHub Actions when the release is created,
but the generated _artifacts_ must be manually attached to the release as _assets_.

1. Go to the [actions page](https://github.com/GrammaticalFramework/gf-core/actions) and click "Build Binary Packages" under _Workflows_.
2. Choose the workflow run corresponding to the newly created release.
3. Download the artifacts locally. Extract the Ubuntu and macOS ones to get the `.deb` and `.pkg` files.
4. Go back to the [releases page](https://github.com/GrammaticalFramework/gf-core/releases) and click to edit the release information.
5. Add the downloaded artifacts as release assets, giving them names with format `gf-X.Y-PLATFORM.EXT` (e.g. `gf-3.11-macos.pkg`).

### 4. Upload to Hackage

1. Run `make sdist`
2. Upload the package, either:
    1. **Manually**: visit <https://hackage.haskell.org/upload> and upload the file `dist/gf-X.Y.tar.gz`
    2. **via Cabal (≥2.4)**: `cabal upload dist/gf-X.Y.tar.gz`
3. If the documentation-building fails on the Hackage server, do:
```
cabal v2-haddock --builddir=dist/docs --haddock-for-hackage --enable-doc
cabal upload --documentation dist/docs/*-docs.tar.gz
```

## Miscellaneous

### What is the tag `GF-3.10`?

For GF 3.10, the Core and RGL repositories had already been separated, however
the binary packages still included the RGL. `GF-3.10` is a tag that was created
in both repositories ([gf-core](https://github.com/GrammaticalFramework/gf-core/releases/tag/GF-3.10) and [gf-rgl](https://github.com/GrammaticalFramework/gf-rgl/releases/tag/GF-3.10)) to indicate which versions of each went into the binaries.