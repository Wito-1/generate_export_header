# generate_export_header
Bazel Rule for Generating an export header file

This bazel rule tries to mimic the behavior of Cmake's [GenerateExportHeader][GenerateExportHeader]
functionality in bazel.

## Basic Usage:

Import the module
```
# MODULE.bazel

bazel_dep(name = "generate_export_header", version = "0.1.0")
```

Use the rule to generate a `<label>_export.h` file
```
# BUILD.bazel
load("@generate_export_header//:defs.bzl", "generate_export_header")
generate_export_header(
    name = "console_bridge",
)
```

This rule generates a `console_bridge_export.h` file with all the macros
defined for the library `CONSOLE_BRIDGE`.

There are some options to override the file name and/or the macro prefixes for
more fine grained control with `header` and `library` attributes respectively.
```
# BUILD.bazel
load("@generate_export_header//:defs.bzl", "generate_export_header")
generate_export_header(
    name = "console_bridge",
    library = "FOO",
    header = "foo_export.h",
)
```

[GenerateExportHeader]: https://cmake.org/cmake/help/latest/module/GenerateExportHeader.html
