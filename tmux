unbind C-b
set -g prefix C-s
bind-key -r C-s send-prefix

bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l""')"

# show session name, window & pane number, date and time on right side of status bar
set -g status-right-length 60
set -g status-right "#[fg=blue]#S #I:#P #[fg=yellow]:: %d %b %Y #[fg=green]:: %l:%M %p :: #(date -u | awk '{print $4}')::"

set-option -g default-terminal "screen-256color"
#set-option -g status-keys "emacs"

#set -g status-bg '#666666'
#set -g status-fg '#aaaaaa'

#set-option -g status-left-length 50
#set-option -g status-right " #(date '+%a, %b %d - %I:%M') "

bind-key - split-window -v -c '#{pane_current_path}'
bind-key \ split-window -h -c '#{pane_current_path}'

# Fine adjustment ( 1 or 2 cursor cells per bump )
bind -n S-Left resize-pane -L 2
bind -n S-Right resize-pane -R 2
bind -n S-Down resize-pane -D 1
bind -n S-Up resize-pane -U 1

# Coarse adjustment (5 or 10 cursor cells per bump)
bind -n C-Left resize-pane -L 10
bind -n C-Right resize-pane -R 10
bind -n C-Down resize-pane -D 5
bind -n C-Up resize-pane -U 5

bind c new-window -c '#{pane_current_path}'

# mouse - not working at the moment
# setw -g mode-mouse on
# set -g mouse-resize-pane on
# set -g mouse-select-pane on
# set -g mouse-select-window on
set -g mouse-utf8 on
set -g mouse on
bind -n WheelUpPane   select-pane -t= \; copy-mode -e \; send-keys -M
bind -n WheelDownPane select-pane -t= \;                 send-keys -M

# Start window index at 1-
set-option -g base-index 1

# Re-number windows when one is closed
set-option -g renumber-windows on

# Start pane index at 1
setw -g pane-base-index 1

# highlight window when it has new activity
setw -g monitor-activity on
set -g visual-activity on

bind-key b break-pane -d

bind-key C-j choose-tree

# Use vim keybindings in copy mode
setw -g mode-keys vi

# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
bind-key h split-window -h "htop"
bind-key t split-window -h -c ~/ "vim todo.md"
bind-key w split-window -h -c ~/my-wiki "vim +CtrlP"

bind C-w split-window -v "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t"

# Prompted join-pane
bind-key j command-prompt -p "join pane from: "  "join-pane -h -s '%%'"

# Easily swap a pane (targeted by pane number) with the current pane
bind-key s display-panes\; command-prompt -p "pane #: "  "swap-pane -t '%%'"

bind-key C-b send-keys 'tat && exit' 'C-m'
bind-key K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

bind-key w split-window -h -c ~/which/reviews-and-advice "vim +CtrlP"

