# git_prj
Contain some shell scripts

## List:
- [try-pull.sh](#try-pull)
- [try-push.sh](#try-push)
- [easy-log.sh](#easy-log)
- [all-push.sh](#all-push)
- [start.sh](#start)
- [finish.sh](#finish)

## Usage:
### <span id="try-pull">`./try-pull.sh [option]`</span>

*Attempt to pull all modifications online every 5 seconds until succeed*

> `./try-pull.sh`
>
> *Attempt to pull files from origin(github default)*
>
> `./try-pull.sh all`
>
> *Attempt to pull files from github and then gitee*
>
> `./try-pull.sh github`
>
> *Attempt to pull files from github only*
>
> `./try-pull.sh gitee`
>
> *Attempt to pull files from gitee only*

### <span id="try-push">`./try-push.sh [option]`</span>

*Attempt to push all modifications online every 5 seconds until succeed*

> `./try-push.sh`
>
> *Attempt to push files to origin(github default)*
>
> `./try-push.sh all`
>
> *Attempt to push files to github and then gitee*
>
> `./try-push.sh github`
>
> *Attempt to push files to github only*
>
> `./try-push.sh gitee`
>
> *Attempt to push files to gitee only*

### <span id="easy-log">`./easy-log.sh [option]`</span>

*To log commit history in a simple and pretty way*
      
> `./easy-log.sh`
>
> *--pretty=oneline --abbrev-commit --graph*
>
> `./easy-log.sh oneline`
>
> *--pretty=oneline --abbrev-commit --graph*
>
> `./easy-log.sh pretty`
>
> *--color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit*

### <span id="all-push">`./all-push.sh`</span>

*Attemp to push files to github and gitee as same as ./try-push.sh all*

### <span id="start">`./start.sh`</span>

*Pull new modification from github and gitee, and switch to branch 'dev' before working*

### <span id="finish">`./finish.sh`</span>

*Merge modifications to branch 'main', and then push them to github and gitee*

