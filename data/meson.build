subdir('icons')

data_dir = include_directories('.')

install_data(
    'atril.1',
    install_dir : join_paths(get_option('prefix'), get_option('mandir'), 'man1')
)

service_conf = configuration_data()
service_conf.set('libexecdir', join_paths(prefix, libexecdir))

configure_file(
    input: 'org.mate.atril.Daemon.service.in',
    output: 'org.mate.atril.Daemon.service',
    configuration: service_conf,
    install_dir: join_paths(datadir, 'dbus-1', 'services')
)

schema_file = install_data(
    'org.mate.Atril.gschema.xml',
    install_dir: join_paths(datadir, 'glib-2.0', 'schemas')
)

desktop_conf = configuration_data()
desktop_conf.set('ATRIL_MIME_TYPES', atril_mime_types)

desktop = configure_file(
    input: 'atril.desktop.in.in',
    output: 'atril.desktop.in',
    configuration: desktop_conf,
)

custom_target(
    'desktop',
    input: desktop,
    output: 'atril.desktop',
    command: [intltool_merge, '-d', '-u', po_dir, '@INPUT@', '@OUTPUT@'],
    install: true,
    install_dir: desktopdir,
)

appdata = custom_target(
    'appdata',
    input: 'atril.appdata.xml.in',
    output: 'atril.appdata.xml',
    command: [intltool_merge, '-x', '-u', po_dir, '@INPUT@', '@OUTPUT@'],
    install: true,
    install_dir: join_paths(datadir, 'metainfo'),
)

install_data(
    'hand-open.png',
    install_dir: join_paths(prefix, datadir, meson.project_name())
)
