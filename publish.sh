#!/bin/bash -e

# Clean previous build
rm -rf public

# Build the site with Hugo
hugo --minify
if [ $? -ne 0 ]; then echo "Could not generate the site"; exit 1; fi

# Add a version file to the deployment
echo "Deployed: $(date)
$(git log -1 --pretty=format:'%s (%ci)' --abbrev-commit)

https://github.com/naxoc/naxoc-hugo/commit/$(git rev-parse HEAD)" > public/VERSION.txt

# "nuez" is set up in .ssh/config
rsync -avz --delete public/ nuez:/var/www/naxoc.net/public
if [ $? -ne 0 ]; then echo "Could not publish the site"; exit 1; fi

echo "Site published successfully!"
