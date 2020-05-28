export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


# Cmd tools
alias vb="vim ~/.bashrc && source ~/.bashrc" # Edit .bashrc in vim, and immediately load changes
alias vg="vim ~/.git_completion.bash && source ~/.bashrc"
alias a="alias"
alias c="clear"
alias h="history"
alias hg="history | grep"
alias ls="ls -F --color --show-control-chars"
alias ll="ls -la"
alias less="less -r"
alias svim="sudo vim"
alias diff="vim -d"
alias mkdir="mkdir -pv"
alias bashrc="source ~/.bashrc"
alias myip="curl http://ipecho.net/plain; echo"
alias path="echo -e ${PATH//:/\\n}"


# Quick nav
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias p="git checkout HEAD~1"
alias pp="git checkout HEAD~2"
alias ppp="git checkout HEAD~3"
alias pppp="git checkout HEAD~4"
alias n="git checkout HEAD@{1}"
alias nn="git checkout HEAD@{2}"
alias nnn="git checkout HEAD@{3}"
alias nnnn="git checkout HEAD@{4}"


# Git shorthand (q is for erroneous keys)
alias gs="git status"
alias gw="git show"
alias gb="git branch"
alias gbm="git branch -m"
alias gc="git commit"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gcam="git add --all && git commit -m"
alias gacm="git add --all && git commit -m"
alias ga="git add"
alias qga="git add"
alias gA="git add -A"
alias gd="git diff"
alias qgd="git diff"
alias gdd="git diff --staged"
alias qgdd="git diff --staged"
alias gob="git checkout -b"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gom="git checkout master"
alias gcom="git checkout master"
alias gomp="git checkout master && git pull"
alias goa="git checkout alpha"
alias gcoa="git checkout alpha"
alias goap="git checkout alpha && git pull"
alias gp="git push --follow-tags"
alias gpr="git pull --rebase"
alias gst="git stash"
alias gsa="git stash apply"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
# Rename current branch
alias grm="git branch -m"
alias gbm="git branch --merged"
alias gbn="git branch --no-merged"
alias gbu="git branch --no-merged"
alias grm="git rebase master"
alias gra="git rebase alpha"
# Git rename branch
alias grn="git branch -m"
# Git remove deleted files
#alias grm="git ls-files --deleted -z | xargs -0 git rm"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gm="git merge"
alias gk="gitk --all&"


gitlog () {
    git log -S $1 --source --all;
}

# Show unmerged and merged (deletable) branches
alias gbb="echo '   -----  Merged Branches  -----' && git branch --merged && echo '' && echo '   ----- Unmerged Branches -----' && git branch --no-merge"
alias gbtf="git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads | sed -e 's-refs/heads/--'"
alias gbt="git for-each-ref --sort='-committerdate' --format='%(refname)' refs/heads | sed -e 's-refs/heads/--'"


# List summary of last N commits
alias gln="git log -n"
alias gl="git log -n 5"
# List changed files of last N commits
alias gsno="git show --pretty='format:' --name-only"
alias gsn="git show --name-only -n 3"


# Rebase current branch on main branch, merge into main, and push to remote
gitpushgo () {
    rebaseBranch=$1;
    if [ $# -eq 0 ]; then
        rebaseBranch=$(git symbolic-ref --short HEAD);
    fi
    printf "\n    ----- Auto-Merging $rebaseBranch -----\n";
    printf "\n    ----- Stashing old commit -----\n";
    git stash;
    printf "\n    ----- Checkout Master -----\n";
    git checkout master &&
    printf "\n    ----- Rebase Master -----\n";
    git pull --rebase &&
    printf "\n    ----- Checkout $rebaseBranch -----\n";
    git checkout $rebaseBranch &&
    printf "\n    ----- Rebase $rebaseBranch from Master -----\n";
    git rebase master &&
    printf "\n    ----- Checkout Master -----\n";
    git checkout master &&
    printf "\n   ----- Push $rebaseBranch and Master -----\n";
    git merge $rebaseBranch && git push && git stash apply;
}

gdb () {
    deleteBranch=$1;
    if [ $# -eq 0 ]; then
        deleteBranch=$(git symbolic-ref --short HEAD);
    fi
    printf "\n   ----- Deleting Branch $deleteBranch -----\n";
    printf "\n   ----- Checkout Master Branch -----\n";
    git checkout master &&
    printf "\n" &&
    git branch -d $deleteBranch;
}

gittag () {
    #if [ $# -eq 1]; then
        revision=$1;
    #fi
    printf " ----- Committing with tag annotation v$revision -----\n";
    git commit -m "Bumping version to $revision" &&
    git tag -a v$revision -m "Release $revision";
}

# Git push current branch to remote
gpo () {
    git push origin -u $(git symbolic-ref --short HEAD);
}

# Git rebase interactive on N commits
gri () {
    #if [ $# -eq 1]: then
        numCommits=$1;
    #fi
    git rebase -i HEAD~$numCommits;
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
