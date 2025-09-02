# Uzgorak

Personal Environment Bootstrap Tool

## Aim of the project

Describe, maintain and restore personal Linux environment.

## How to use

1. Clone the repo
2. Checkout one of the predefined branches depends on your needs. `Main` has no modules at all, you will start from scratch. `Base` can be used as reference with minimal modules for Ubuntu based distributive. `Examples` can show insights of modules composing.
3. Add new modules to directory `modules` (see [examples](https://github.com/Klojer/uzgorak/tree/example/modules))
4. Use commands from list bellow to manage modules state

## How to create new module

1. Create subdirectory in `modules` with name `{{incremented-number}}-{{name}}`
2. Create file Makefile (see Template of new module Makefile)
3. Optionally create `include.mk` to reuse functionality in other modules

### Template of new module Makefile

```makefile
include $(LIBS_PATH)/const.mk $(LIBS_PATH)/cache.mk

install:
  # commands to install module

remove:
  # commands to remove module
```

## Commands

### List all supported modules and their state

```sh
make list
```

### Install all modules

```sh
make install
```

### Test modules

```shell
make test
```

### Remove all modules

```sh
make remove
```

### Per module commands

Install:

```shell
make module/install/XXX-your-module
```

Remove:

```shell
make module/remove/XXX-your-module
```
