if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set EDITOR "nvim"
set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_CTRL_T_OPTS "
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
set GIT_LFS_SKIP_SMUDGE 1
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_DISABLE_KEYBINDINGS 0
set fish_cursor_default block
set fish_autosuggestion_enabled 0
zoxide init fish | source
export LS_COLORS="$(vivid generate $HOME/.config/vivid/colorscheme-lsd.yaml)"
set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf
set TERM "xterm"


fish_vi_key_bindings
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_escape_delay_ms 100

bind -m default \x20eh 'nvim ~/dotfiles/.config/hypr/hyprland.conf'
bind -m default \x20ef 'nvim ~/dotfiles/.config/fish/config.fish'
bind -m default gp "cd ~/Desktop/project/pratice &> /dev/null"
bind -m default gw "cd ~/Desktop/project/working &> /dev/null"
bind -m default \x20\x20 'cd ~ && fzf | xargs nvim {} && clear'
bind -m default \x20r 'source ~/.config/fish/config.fish'
bind -m default \x20gs 'cd ~/.dotfiles && git add --all && git commit -a -m \"$(random)\"'
bind -m default \x20gp 'cd ~/.dotfiles && git push'


### usefully function ###
function cd
    builtin cd $argv; and ls
end

function cdx
    builtin cd $argv
end



###### add to path #########
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

if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay 'paru --bottomup'
end

###### alias #########
alias ivm 'vim'
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ls 'eza --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias cargo 'cargo -q'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias ip 'ip -color'
alias upd 'sudo pacman -Syu --noconfirm'
alias wget 'wget -c '
alias vim "nvim"
alias cls 'clear'
alias cl 'clear'


# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'

# ## Starship prompt
# if status --is-interactive
#    source ("/usr/bin/starship" init fish --print-full-init | psub)
# end

#anoconda
set --export PATH $HOME/anaconda3/bin $PATH
if test -f /home/sanbid/anaconda3/bin/conda
else
    if test -f "/home/sanbid/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/sanbid/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/sanbid/anaconda3/bin" $PATH
    end
end

