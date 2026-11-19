# Homebrew tap for Ale-Newport

```bash
brew install --cask ale-newport/tap/toolbox
```

| Cask | App |
| --- | --- |
| `toolbox` | [Toolbox](https://github.com/Ale-Newport/swapIT) — 169 local file tools for macOS with a radial menu for Finder. Universal (Apple Silicon + Intel), macOS 11+. |

Update with `brew upgrade --cask toolbox`; remove with `brew uninstall --cask toolbox`
(add `--zap` to also delete its settings and caches).

Toolbox is ad-hoc signed rather than notarised, so the cask removes the
quarantine flag after installing — the same thing the project's own installer
does. Read the cask before installing if you want to check: [`Casks/toolbox.rb`](Casks/toolbox.rb).

Issues with the app itself belong in [Ale-Newport/swapIT](https://github.com/Ale-Newport/swapIT/issues).
