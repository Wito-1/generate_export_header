"""
Cue rules and macros that to be able to customize without changing all BUILD.bazel files
"""

def _generate_export_header_impl(ctx):
    if ctx.outputs.header:
       # use provided header name
       output = ctx.outputs.header
    else:
       # use <label name>_export.h
       output = ctx.actions.declare_file("{}_export.h".format(ctx.label.name))

    if ctx.attr.library:
       # use provided library name in exports definition
       library_name = ctx.attr.library
    else:
       # use uppercase of <label name>
       library_name = ctx.label.name.upper()

    ctx.actions.expand_template(
        template = ctx.file._header_export_template,
        output = output,
        substitutions = {
            "{{LIBRARY}}": library_name,
        },
    )
    return [DefaultInfo(files = depset([output]))]

generate_export_header = rule(
    implementation = _generate_export_header_impl,
    attrs = {
        "library": attr.string(
            doc = "Name of the library to use in export macro definition. Defaults to uppercase of the label name.",
        ),
        "header": attr.output(
            doc = "Name of the header file to output. Defaults to <label name>_export.h",
        ),
        "_header_export_template": attr.label(
            allow_single_file = True,
            doc = "Export Header Template to replace library names into",
            default = ":header_export.h.tpl",
        ),
    },
)
