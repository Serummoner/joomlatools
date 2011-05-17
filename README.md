# Abstract
The Joomla Development Tool is a command line tool to easen the development of extensions for Joomla. 

# Features
- clean (delete the .jdt directory)
- status (shows the current extension type, name, version, author, etc.)
- generate extension stubs
- package extension (create installable zip file)
- deploy extension (install extension on running joomla system)
- sync extension files (synchronize files of directory into joomla installation locally)
- version (version of the JDT)
- release (increment version number, ask for changes for the changelog)

# Are additional files being created within my extension?
No, only a .jdt directory is created at the root of the extension in which configuration files, cached data, etc. is stored. This, however, can be removed using the jdt clean command.

# Can I use it for Joomla 1.5 development?
No, only Joomla 1.6 development is supported. This is due to the change of the manifest structure.   

# Installation Instructions

1. clone the repository
2. gem build jdt.gemspec
3. gem install jdt.gem

The tool is then useable in the command line using $> jdt

# Joomla Versions
This tool supports solely Joomla 1.6.

# Future work
- validate (validate structure using predefined set of rules: manifest.xml against DTD/XSD schema, naming conventions required by joomla, etc.)
- undeploy extension
- scaffold name (create controller, model, models, view, views for a specific name)
- test (run unit tests)
- install JDump / uninstall JDump