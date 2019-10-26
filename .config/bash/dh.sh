# Maintain a directory stack with a `cd -N` and `dh` command
#
# Inspired by similar Zsh functionality

declare -a dir_stack
dir_stack=()

function push_dir
{
    if [ -z "$1" ]; then
        return
    fi
    # in contrast to 4.2.46 (e.g. CentOS 7), bash 4.1.2 (e.g. CentOS 6)
    # doesn't understand negative indexing as in "${dir_stack[-1]}"
    local k="${#dir_stack[@]}"
    k=$((k-1))
    if [[ "$k" == -1 || "${dir_stack[k]}" != "$1" ]]; then
        dir_stack+=("$1")
        if [[ "$k" > 8 ]]; then
            dir_stack=("${dir_stack[@]:1}")
        fi
    fi
}
function dh
{
    local n
    n=-"${#dir_stack[@]}"
    local k
    k=$((n * -1 - 1))
    for ((i=-1; i>=n; --i)); do
        echo "$i: ${dir_stack[k]}"
        k=$((k-1))
    done
}
function cd
{
    if [[ $# == 1 && "$1" =~ ^-[1-9]$ ]]; then
        local k="${#dir_stack[@]}"
        local a=${1#-}
        k=$((k-a))
        builtin cd "${dir_stack[k]}"
    else
        builtin cd "$@"
    fi
    push_dir "$OLDPWD"
}

