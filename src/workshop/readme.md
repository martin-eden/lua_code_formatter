[![DeepWiki][DeepWiki_Logo]][DeepWiki_Repo] -- ask AI about this repo (I do!)

## What

(2015 - ..)

Personal Lua modules.

Essential part is `base.lua` which provides `request()` -- `require()`
relative to module's directory. And `system/create_deploy_script.lua`
which creates shell script to copy modules with dependencies.

Other files are resource base for programs. Programs are bundled with
local copy of needed parts from this repository.

So no dead code in programs, alternative concept to versioning and I can
redesign code here to whatever I please.

This repository started in 2015 as "code heap". And it's still code heap
but for 2026 my vision is evolved.

[DeepWiki_Logo]: https://deepwiki.com/badge.svg
[DeepWiki_Repo]: https://deepwiki.com/martin-eden/workshop
