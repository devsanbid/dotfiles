if status is-interactive
    # Commands to run in interactive sessions can go here
end

set TERM "xterm-kitty"
set fish_greeting
set EDITOR "nvim"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish
set -x LIBVIRT_DEFAULT_URL 'qemu:///system'
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
# set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf


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

# Syntax highlighting colors.
set -g fish_color_autosuggestion 626262
set -g fish_color_cancel 626262
set -g fish_color_command 7cb3ff
set -g fish_color_comment 949494 --italics
set -g fish_color_cwd 87d787
set -g fish_color_cwd_root ff5189
set -g fish_color_end 949494
set -g fish_color_error ff5454
set -g fish_color_escape 949494
set -g fish_color_history_current c6c6c6 --background=323437
set -g fish_color_host e4e4e4
set -g fish_color_host_remote e4e4e4
set -g fish_color_keyword cf87e8
set -g fish_color_match c6c6c6 --background=323437
set -g fish_color_normal bdbdbd
set -g fish_color_operator e65e72
set -g fish_color_option bdbdbd
set -g fish_color_param 61d5ae
set -g fish_color_quote c6c684
set -g fish_color_redirection 8cc85f
set -g fish_color_search_match --background=323437
set -g fish_color_selection --background=323437
set -g fish_color_status ff5454
set -g fish_color_user 36c692
set -g fish_color_valid_path

# Completion pager colors.
set -g fish_pager_color_completion c6c6c6
set -g fish_pager_color_description 949494
set -g fish_pager_color_prefix 74b2ff
set -g fish_pager_color_progress 949494
set -g fish_pager_color_selected_background --background=323437
set -g fish_pager_color_selected_completion e4e4e4
set -g fish_pager_color_selected_description e4e4e4


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
