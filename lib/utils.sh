#!/usr/bin/env sh

MINIT_PLATFORM="$(uname -sr)"
case "$MINIT_PLATFORM" in
    Linux*)
        MINIT_HOMEBREW_DIR="/home/linuxbrew/.linuxbrew"
        ;;
    Darwin*)
        MINIT_HOMEBREW_DIR="/opt/homebrew"
        ;;
    *)
        echo "Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac
MINIT_UV="$MINIT_HOMEBREW_DIR/bin/uv"

print_info() {
    printf '\e[34m%s\e[0m\n' "$1"
}

print_ok() {
    printf '\e[32m%s\e[0m\n' "$1"
}

print_warn() {
    printf '\e[33m%s\e[0m\n' "$1"
}

print_error() {
    printf '\e[31m%s\e[0m\n' "$1"
}

git_diff_since() {
    git_dir="$1"
    from="$2"
    path_to_check="$3"

    # If no commit is provided, compare against the empty tree
    # See: https://stackoverflow.com/a/9766506
    if [ -z "$from" ]; then
        from="$(git mktree < /dev/null)"
    fi

    ! git --git-dir "$git_dir" diff --exit-code --quiet "$from" HEAD -- "$path_to_check"
}
