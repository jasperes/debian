[core]
    editor = nvim
    filemode = true

[init]
    defaultBranch = main

[includeIf "hasconfig:remote.*.url:git@github.com:*/**"]
    path = ~/.gitconfig.github.inc

[includeIf "hasconfig:remote.*.url:git@gitlab.com:*/**"]
    path = ~/.gitconfig.gitlab.inc
