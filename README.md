# Banquish Homebrew tap

[Banquish](https://banquish.space/) is a browser where an agent answers with the live web. It runs on Macs with Apple silicon and macOS 13 (Ventura) or later.

```sh
brew install --cask banquish-app/tap/banquish
```

Banquish updates itself, so `brew upgrade` leaves it alone unless you pass `--greedy`.

`brew uninstall --zap banquish` also removes your Workspaces and profile (`~/Library/Application Support/Banquish`) and the agent shims in `~/.banquish`. An older Swift build of Banquish keeps its data in that same folder, so this removes it too.

Each Banquish release updates `Casks/banquish.rb` here.
