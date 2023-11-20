if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export DEVNODE="/dev/input/by-id/usb-SONiX_USB_DEVICE-event-kbd"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

alias ls='exa --icons --group-directories-first'
alias fzf="fzf --reverse -i"
alias cat='bat'

bindkey '^k' autosuggest-accept

p() {
  cd ~/Documentos/Projects/"$(/usr/bin/ls -d ~/Documentos/Projects/*/ | 
    sed -e "s/\/home\/ndavidmb\/Documents\/Projects\///g" | fzf)" &&
      $1 .
}

active-gcloud() {
  gcloud compute instances list --format="flattened(name)" | grep "name" | sed -e "s/name\:\ //g" | fzf | xargs -I_ gcloud compute start-iap-tunnel _ 3389 --local-host-port=localhost:$1 --zone=us-central1-a --project=sgc-siig-prd
}

postgres_backup() {
  /usr/bin/pg_restore --verbose --host=localhost --port=5432 --username=$3 --clean --no-owner --create --dbname=$2 $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ $(ps --no-header -p $PPID -o comm) =~ tilix ]]; then
    for wid in $(xdotool search --pid $PPID); do
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

source <(ng completion script)

