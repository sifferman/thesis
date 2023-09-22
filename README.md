
# Advancing Synthesizable Verilog/SystemVerilog Education with Open-Source Tools and Autograders

## About

A thesis submitted in partial satisfaction of the requirements for the degree Master of Computer Engineering

* Ethan Sifferman
* September 2023
* University of California, Santa Barbara
* Department of Electrical and Computer Engineering

### Cite

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

### Committee

* UCSB Assistant Professor Jonathan Balkind, *chair*
* UCSB Professor Dmitri Strukov
* UCSB Professor Yogananda Isukapalli

## Development

### Build Instructions

```bash
sudo apt install texlive texlive-full
make
```

### Patch Instructions

Do not edit any files inside `"dependencies"` directly. Instead, all changes should be stored in `"dependencies.patch"`, which is applied during building. The following is how to update `"dependencies.patch"`.

```bash
make patch
# edit files in build/dependencies as desired
diff -Naur dependencies build/dependencies > dependencies.patch
```
