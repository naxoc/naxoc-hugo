# Blog built with Hugo

This is my blog. The built output can be seen on [naxoc.net](https://naxoc.net).

This site was migrated from Sculpin to Hugo. The [old Sculpin repo can be found here](https://github.com/naxoc/sculpin-blog). Before Sculpin it was Drupal and maybe other things? Don't remember anymore :-D

## Requirements

- [Hugo](https://gohugo.io/) (extended version recommended)
- [just](https://github.com/casey/just) (optional but recommended - a handy task runner)

## To install

```bash
# Install Hugo (macOS with Homebrew)
brew install hugo

# Install just (optional but recommended)
brew install just

# Clone the repository
git clone https://github.com/naxoc/naxoc-hugo.git
cd naxoc-hugo
```

## To work on the blog

Start the Hugo development server with live reload:

```bash
just serve
# or if you don't have just installed:
hugo server
```

The blog will be available locally at [http://localhost:1313](http://localhost:1313)

## Available commands

If you have `just` installed, you can run:

```bash
just                    # List all available commands
just serve              # Start development server
just build              # Build the site
just publish            # Build and deploy to production
just new-post "title"   # Create a new blog post
```

See the `justfile` for all available commands.

## To deploy

Build and deploy the site via rsync:

```bash
just publish
# or if you don't have just installed:
./publish.sh
```

Make sure you have SSH access configured for the target server.

## Theme

The theme is custom-built and lives directly in the `layouts/` directory. CSS is in `static/css/style.css`. No external theme dependencies! No building with npm because ain't nobody got time for that.

## License

Dual licensed:
- **Code** (templates, CSS, config): MIT License - use it however you want!
- **Content** (blog posts): CC BY 4.0 - share with attribution

See [LICENSE](LICENSE) for details.
