# Thesis

## Cite

If you use this thesis in your research, please include the following citation:

```bibtex
@mastersthesis{SiffermanMastersThesis,
  author = {Sifferman, Ethan},
  title = {{A}dvancing {S}ynthesizable {V}erilog/{S}ystem{V}erilog {E}ducation with {O}pen-{S}ource {T}ools and {A}utograders},
  school = {University of California, Santa Barbara},
  month = {September},
  year = {2023},
  note = {\url{https://thesis.sifferman.dev/}},
}
```

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
