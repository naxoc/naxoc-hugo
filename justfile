# Hugo blog tasks

# List available commands
default:
    @just --list

# Start development server
serve:
    hugo server

# Build the site
build:
    hugo

# Build with minification
build-prod:
    hugo --minify

# Clean build directory
clean:
    rm -rf public

# Publish to production server
publish: clean
    #!/usr/bin/env bash
    set -euo pipefail

    # Build the site with Hugo
    hugo --minify

    # Add version file to deployment
    echo "Deployed: $(date)
    $(git log -1 --pretty=format:'%s (%ci)' --abbrev-commit)

    https://github.com/naxoc/naxoc-hugo/commit/$(git rev-parse HEAD)" > public/VERSION.txt

    # Rsync to server (nuez is configured in .ssh/config)
    rsync -avz --delete public/ nuez:/var/www/naxoc.net/public

    echo "✨ Site published successfully!"

# Create a new blog post
new-post title:
    hugo new content/$(date +%Y-%m-%d)-{{title}}.md
