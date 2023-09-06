# Thesis

## Build Instructions

```bash
sudo apt install texlive texlive-full
make
```

## Patch Instructions

Do not edit any files inside `"dependencies"` directly. Instead, all changes should be stored in `"dependencies.patch"`, which is applied during building. The following is how to update `"dependencies.patch"`.

```bash
make patch
# edit files in build/dependencies as desired
diff -Naur dependencies build/dependencies > dependencies.patch
```
