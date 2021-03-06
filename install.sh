#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io installer with packages by Andre Sieverding\n"

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd ${HOME}/.atom

# Install apm packages
echo "Installing Atom.io packages...\n"
apm install --packages-file "${dir}/atom/package-list.txt"
echo "\n"

# Change into atom-io-customization/atom directory
cd ${dir}/atom

# Copy all configurations into current directory
echo "Copying files...\n"

# Only if it is a .cson, .coffee, .txt, .json or .less file or a linter configuration & gitignore file
for file in $(find ./ -maxdepth 1 -name '*.cson' -or -name '*.coffee' -or -name '*.txt' -or -name '*.json' -or -name '*.less' -or -name '.htmlhintrc' -or -name '.jshintrc' -or -name '.sass-lint.yml' -or -name '.gitignore')
do
	relFile=$(echo $file | cut -c 4-)
	echo "Copying: ${relFile} -> ${HOME}/.atom/${relFile}"
	cp $relFile ${HOME}/.atom/${relFile}
done

# Done! :)
echo "\nDone ✅\nEnjoy your customized Atom.io Code-Editor!\n"
