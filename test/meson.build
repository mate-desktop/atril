test_cases = [
    'testFileMenu.py',
    'testEditMenu.py',
    'testHelpMenu.py',
    'testZoom.py',
    'testGoMenu.py',
    'testBookmarksMenu.py',
    'testEncryptedFile.py',
    'testFileReloading.py',
    'testWrongFileExtension.py'
]

foreach case : test_cases
    test_script = find_program(case)

    test(
        case,
        test_script,
        args: [atril.full_path()],
        is_parallel: false,
        depends: atril,
        workdir: join_paths(prefix, bindir),
        timeout: 120,
    )
endforeach
