glib_genmarshal = find_program('glib-genmarshal')
glib_mkenums = find_program('glib-mkenums')

eggsources = [
  'egg-editable-toolbar.c',
  'egg-toolbars-model.c',
  'egg-toolbar-editor.c'
]

eggheaders = [
  'egg-editable-toolbar.h',
  'egg-toolbars-model.h',
  'egg-toolbar-editor.h'
]

noinst_headers = [
  'eggmarshalers.h'
]

eggmarshalers_h = custom_target('eggmarshalers.h',
  output: 'eggmarshalers.h',
  input: 'eggmarshalers.list',
  command: [
    glib_genmarshal,
    '--prefix=_egg_marshal',
    '@INPUT@',
    '--header'
  ],
  capture: true
)

eggmarshalers_c = custom_target('eggmarshalers.c',
  output: 'eggmarshalers.c',
  input: 'eggmarshalers.list',
  command: [
    glib_genmarshal,
    '--prefix=_egg_marshal',
    '@INPUT@',
    '--body',
    '--prototypes'
  ],
  capture: true
)

eggtypebuiltins_h = custom_target('eggtypebuiltins.h',
  output: 'eggtypebuiltins.h',
  input: eggheaders,
  command: [
    glib_mkenums,
    '--fhead', '#ifndef __EGGTYPEBUILTINS_H__\n#define __EGGTYPEBUILTINS_H__ 1\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n\n',
    '--ftail', 'G_END_DECLS\n\n#endif /* __EGGTYPEBUILTINS_H__ */\n',
    '--fprod', '\n/* --- @filename@ --- */',
    '--eprod', '#define EGG_TYPE_@ENUMSHORT@ @enum_name@_get_type()\nGType @enum_name@_get_type (void);\n',
    '@INPUT@'
  ],
  capture: true
)

eggtypebuiltins_c = custom_target('eggtypebuiltins.c',
  output: 'eggtypebuiltins.c',
  input: eggheaders,
  command: [
    glib_mkenums,
    '--fhead', '#include <config.h>\n\n#include "eggtypebuiltins.h"\n\n',
    '--fprod', '\n/* enumerations from "@filename@" */\n#include "@filename@"',
    '--vhead', 'static const G@Type@Value _@enum_name@_values[] = {',
    '--vprod', '  { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
    '--vtail', '  { 0, NULL, NULL }\n};\n\nGType\n@enum_name@_get_type (void)\n{\n  static GType type = 0;\n\n  if (G_UNLIKELY (type == 0))\n    type = g_@type@_register_static ("@EnumName@", _@enum_name@_values);\n\n  return type;\n}\n\n',
    '@INPUT@'
  ],
  capture: true
)

built_sources = [
  eggmarshalers_c,
  eggmarshalers_h,
  eggtypebuiltins_c,
  eggtypebuiltins_h
]

# Define the library
libtoolbareditor = static_library('toolbareditor',
  sources: [
    eggsources,
    eggheaders,
    built_sources
  ],
  c_args: [
    '-DCURSOR_DIR="' + join_paths(get_option('prefix'), get_option('datadir'), meson.project_name()) + '"',
  ],
  include_directories: include_dirs,
  dependencies: [shell_core_deps, xml]
)

libtoolbareditor_dep = declare_dependency(
  link_with: libtoolbareditor,
  include_directories: include_dirs
)
