# AskAI

This little BashBox lets you search with Perplexity AI from your Terminal, by launching the web version in your prefered browser.

Note: A BashBox is package like a Cargo Crate, but for Bash. It can be installed, updated or uninstalled from the command-line, and bring new functionalities or tools right into the terminal ...on Linux, MacOS or WSL2.

## Prerequisites

[Sh:erpa](https://sherpa-basecamp.netlify.app/) need to be installed, so you can install, build, etc. Upon install, the repo will be cloned, the executable built from the sources and be available to be invoked as `aai`.

Be sure you have bash, curl & gawk installed, then run:

```bash
curl -sSL https://raw.githubusercontent.com/SherpaBasecamp/sherpa/refs/heads/master/tools/install.sh | bash
```

Check [the documentation](https://sherpa-basecamp.netlify.app) website.

## Install AskAI

1. Run the Install command

```bash
sh install -n "AskAI" -u "https://github.com/AndiKod/AskAI-bashbox.git"
```

2. Set your prefered Browser

The default is _`firefox`_, the executable on the path in most Linux distros.

If from your terminal you can write firefox, chrome, whatever else as a command and it opends the browser, you can set it to that.

For Windows via WSL2, if you have something like Vivaldi installed in a custom location like Drive E, Programmes directory, the path could look similar to `/mnt/e/Programmes/Vivaldi/Application/vivaldi.exe`

```bash
# Some executable
aai setBrowser firefox

# Full path if WSL2
aai setBrowser /path/to/app.exe
```

3. Well, AskAI something

```bash
aai "Can you tell me more about ..."
```

This will open the configured Browser, populate the search term in Perlexity and run it. If the Window is already opened, or minimised, the search will normally open in a new tab.
