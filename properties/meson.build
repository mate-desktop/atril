glib_dep = dependency('glib-2.0')
properties_inc = include_directories('.', '..')

libevproperties_sources = [
    'ev-properties-view.c',
    'ev-properties-view.h',
]

libevproperties = static_library(
    'evproperties',
    libevproperties_sources,
    include_directories: properties_inc,
    dependencies: [glib_dep, gtk]
)

libevproperties_dep = declare_dependency(
    link_with: libevproperties,
    include_directories: properties_inc,
    dependencies: [glib_dep, gtk]
)
