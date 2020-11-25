abbr -a g git
abbr -a gs "git status"
abbr -a gf "git diff"

set -U fish_user_paths /home/f0rget/go/bin $fish_user_paths

set -U fish_greeting ""

setenv CARGO_TARGET_DIR ~/.cargo-target

function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end
