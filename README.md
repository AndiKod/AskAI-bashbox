# AskAI

This little BashBox lets you search with Perplexity AI from your Terminal, by launching the web version in your prefered browser.

Note: A BashBox is package like a Cargo Crate, but for Bash. It can be installed, updated or uninstalled from the command-line, and bring new functionalities or tools right into the terminal ...on Linux, MacOS or WSL2.

## Prerequisites

[Sh:erpa](https://sherpa-basecamp.netlify.app/ need to be installed, in the same way you need Cargo to install & use crates.

Be sure you have bash, curl & gawk installed, then run:

```bash
curl -sSL https://raw.githubusercontent.com/SherpaBasecamp/sherpa/refs/heads/master/tools/install.sh | bash
```

Check [the QuickInstall](https://sherpa-basecamp.netlify.app/install/install/)) page in the documantation.

## Install AskAI

1. Run the Install command

```bash
sh install -n "AskAI" -u "https://github.com/AndiKod/AskAI-bashbox.git"
```

The repo will be cloned, the executable built from the src/ files and be available to be invoked as `aai`.


2. Set your prefered Browser

Basic usage:

```bash
aai setBrowser <binary or fullPath>
```

This will update the value of the `browser` field in `data/conf.yaml`.


3. Well, ...AskAI something

```bash
aai "Can you tell me more about ..."
```

This will open the configured Browser, populate the search term in Perlexity and run it. If the Window is already opened, or minimised, the search will normally open in a new tab.


## Browser options

There are several ways to open a url from the terminal, so pick the one works best for you or globally the prefered one as long as it works.

### Direct invocation

Try typing something like `firefox https://example.com`. If it opens, then you can set `firefox` as the value of `browser` field.

### Full Path to the .exe

On WSL Windows, as your drive E is identified as `/mnt/e`, you can point directly to the .exe with `/mnt/e/.../vivaldi.exe` and use that with `aai setBrowser /mnt/.../vivaldi.exe`.

Give a try to what you have installed, test it in a terminal window with some ranom url to see what works. Can be `/mnt/c/.../brave.exe https://some.com` or whatever else can handle urls.

_Note: Worked with Vivaldi from a Linux Mint WSL_

### Default browser

On many systems, including Linux from WSL2, you can try those generic tools and see what works following the pattern `xdg-open https://example.com`:

- xdg-open
- gio-open
- gnome-open
- kde-open
- ptyhon -m webbrowser
- ptyhon3 -m webbrowser
- sensible-browser
- x-www-browser

_Note: xdg-open worked on a Linux Mint22 desktop and a Chromebook_

Sometimes you might need to add `export BROWSER='/path/to/browser.exe'` in _~/.bashrc_ then source it.
