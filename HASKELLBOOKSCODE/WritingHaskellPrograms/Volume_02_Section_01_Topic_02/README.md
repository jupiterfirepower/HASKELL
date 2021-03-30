# Writing Haskell Programs

## 2.1.2 "Cabal files"

### Project: `minimal`

Simple executable project demonstrating bare essentials of a `.cabal` file

```
cd minimal
stack build
stack exec example
```

### Project: `github`

Simple executable project with GitHub-related artifacts

```
cd github
stack build
stack exec example
```

### Project: `libwithexe`

Project containing library and executable

```
cd libwithexe
stack build
stack exec example
```

### Project: `libwithtest`

Project containing library, executable and a test suite

```
cd libwithtest
stack build
stack test
stack exec example
```
