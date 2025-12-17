
#!/bin/sh

# 3-1: read a name from stdin or first arg; exit non-zero if empty

# Accept an optional positional argument; if not provided, read from stdin
if [ $# -ge 1 ]; then
    name=$1
else
    printf 'Enter your name: ' >&2
    if ! IFS= read -r name; then
        # 现在 $name 包含刚读到的一行（不含换行符），并且保留了前后空格
        printf '%s\n' "No name entered" >&2
        exit 1
    fi
fi

# Trim leading/trailing whitespace (POSIX-safe)
name=$(printf '%s' "$name" | awk '{ sub(/^[ \t\n\r]+/, ""); sub(/[ \t\n\r]+$/, ""); print }')

if [ -z "$name" ]; then
    printf '%s\n' "No name entered" >&2
    exit 1
fi

printf 'Hello, %s\n' "$name"
