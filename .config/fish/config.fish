## Set values
# Hide welcome message & ensure we are reporting fish as shell
set STORAGE_LOCATION $HOME/anythingllm
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish
set EDITOR "nvim"
set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_CTRL_T_OPTS "
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
set GOOGLEAPI "AIzaSyDnOgJjFJL2k-FUbQhkaGIyO-u743tizg4"
set -x LIBVIRT_DEFAULT_URL 'qemu:///system'
set GIT_LFS_SKIP_SMUDGE 1
set OPENAI_API_KEY ""
bind \cf "tmux-sessionizer"

fish_vi_key_bindings


set fish_cursor_default block
set fish_autosuggestion_enabled 0
zoxide init fish | source
export LS_COLORS="$(vivid generate $HOME/.config/vivid/colorscheme-lsd.yaml)"

set -g fish_key_bindings fish_vi_key_bindings

set -g fish_escape_delay_ms 100

# bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
# bind -M insert kj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
# bind -M insert KJ "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
# bind -M insert JK "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"


abbr -a bin bun create-next@latest
abbr -a bif bun add react-hook-form @hookform/resolvers
abbr -a bic bun add bcryptjs @types/bcryptjs
abbr -a biz bun add zod
abbr -a bas bunx --bun shadcn-ui@latest init
abbr -a bsa bunx --bun shadcn-ui@latest add 


bind -m default \x20eh 'nvim ~/dotfiles/.config/hypr/hyprland.conf'
bind -m default \x20ef 'nvim ~/dotfiles/.config/fish/config.fish'
bind -m default gp "cd ~/Desktop/project/pratice &> /dev/null"
bind -m default gw "cd ~/Desktop/project/working &> /dev/null"
bind -m default \x20\x20 'cd ~ && fzf | xargs nvim {} && clear'
bind -m default \x20r 'source ~/.config/fish/config.fish'
bind -m default \x20gs 'cd ~/.dotfiles && git add --all && git commit -a -m \"$(random)\"'
bind -m default \x20gp 'cd ~/.dotfiles && git push'

alias ivm 'vim'

function cd
    builtin cd $argv; and ls
end

function cdx
    builtin cd $argv
end

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# bun
if test -d ~/.bun/bin
    if not contains -- ~/.bun/bin $PATH
        set -p PATH ~/.bun/bin
    end
end

# bun
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end



# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


# ## Starship prompt
# if status --is-interactive
#    source ("/usr/bin/starship" init fish --print-full-init | psub)
# end

if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay 'paru --bottomup'
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | string trim --right --chars=/)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Cleanup local orphaned packages
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

## Useful aliases

# Replace ls with eza
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ls 'eza --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias cargo 'cargo -q'

# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'



# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias ip 'ip -color'
alias upd 'sudo pacman -Syu --noconfirm'
alias wget 'wget -c '
alias lvim 'NVIM_APPNAME=nvim_lazy nvim'
# alias vim 'NVIM_APPNAME=nv_kick nvim'
alias skf "sk --ansi -i -c 'fd --hidden "{}"'"
alias skw "sk --ansi -i -c 'rg --color=always --hidden --line-number "{}"'"
alias vim "nvim"
alias docker "podman"


# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrored 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help people new to Arch
alias tb 'nc termbin.com 9999'
alias helpme 'echo "To print basic information about a command use tldr <command>"'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'
alias as 'NVIM_APPNAME=astronvim nvim'
alias cls 'clear'
alias cl 'clear'
alias kill 'ps -ef | fzf --bind="ctrl-r:reload(ps -ef)" --header="press ctrl + r to reload" | awk "{print $2}" | xargs kill -9 && echo "Killed"'



# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set TERM "xterm-kitty"

#anoconda
set --export PATH $HOME/anaconda3/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/sanbid/anaconda3/bin/conda
else
    if test -f "/home/sanbid/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/sanbid/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/sanbid/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

