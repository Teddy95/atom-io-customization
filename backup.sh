#!/bin/sh

# Display welcome message and info
echo "\nWelcome to automatic Atom.io backup script by Andre Sieverding\n"
echo "Backing up packages and configurations into repository..."

# Get absolute directory path of current file
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Change into ~/.atom directory
cd ${HOME}/.atom

# Update package-list
echo "Updating package-list...\n"
apm list --installed --bare > package-list.txt

# Copy all configurations into current directory
echo "Copying files...\n"

# Only if it is a .cson, .coffee, .txt, .json or .less file or a linter configuration & gitignore file
for file in $(find ./ -maxdepth 1 -name '*.cson' -or -name '*.coffee' -or -name '*.txt' -or -name '*.json' -or -name '*.less' -or -name '.htmlhintrc' -or -name '.jshintrc' -or -name '.sass-lint.yml' -or -name '.gitignore')
do
	relFile=$(echo $file | cut -c 4-)
	echo "Copying: ${HOME}/.atom/${relFile} -> ${dir}/atom/${relFile}"
	cp $relFile ${dir}/atom/${relFile}
done

# Done! :)
echo "\nDone ✅\n"
