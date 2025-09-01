# Uzgorak

Personal Environment Bootstrap Tool

## Aim of the project

Describe, maintain and restore personal Linux environment.

## How to use

1. Make for of the repo
2. Checkout one of the predefined branches (depends on your needs)
3. Add new modules to directory `modules` using examples (see [examples](https://github.com/Klojer/uzgorak/tree/example/modules))

## How to create new module

1. Create subdirectory in `modules` with name `{{incremented-number}}-{{name}}`
2. Create file Makefile (see Template of new module Makefile)
3. Optionally create `include.mk` to reuse functionality in other modules

### Template of new module Makefile

```makefile
include $(LIBS_PATH)/const.mk $(LIBS_PATH)/state.mk

install:
  # commands to install module

remove:
  # commands to remove module
```

## Commands

### List all supported modules

```sh
make list
```

### Install all modules

```sh
make all
```

### Remove all modules

```sh
make remove
```
