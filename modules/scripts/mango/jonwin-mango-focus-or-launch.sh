#!/usr/bin/env bash

usage() {
    cat <<EOF
Usage: $0 <app-id> <launch-command> [tag] [title-pattern]

Focus an existing window matching the app ID and optional title pattern.
If no matching window exists, launch the application.

Arguments:
  app-id             Application ID to match.
  launch-command     Command to run if no matching window exists.
  tag                Optional tag to launch the window on.
  title-pattern      Optional title filter.

Title patterns:
  pattern            Include windows whose title matches the pattern.
  !pattern           Exclude windows whose title matches the pattern.
  foo,bar            Include windows matching foo or bar.
  !foo,!bar          Exclude windows matching foo or bar.
  foo,!bar           Include foo, but exclude bar.

Examples:
  $0 zen-beta zen-beta 6 '!YouTube Music,!Netflix'
  $0 zen-beta 'zen-beta --new-window https://music.youtube.com/' 7 'YouTube Music'
  $0 zen-beta zen-beta 6 'Netflix,!YouTube Music'
EOF
}

case "$1" in
    -h|--help)
        usage
        exit 0
    ;;
esac


if [ "$#" -lt 2 ] || [ "$#" -gt 4 ]; then
    echo "Error: invalid number of arguments." >&2
    echo >&2
    usage >&2
    exit 1
fi

appid="$1"
command="$2"
tag="${3:-}"
pattern="${4:-}"

client="$(
    mmsg get all-clients |
    jq -r \
        --arg appid "$appid" \
        --arg pattern "$pattern" '
        .clients[]
        | select(.appid == $appid)
        | . as $client
        | ($pattern | split(",") | map(select(startswith("!") | not))) as $includes
        | ($pattern | split(",") | map(select(startswith("!")) | .[1:])) as $excludes
        | select(
            (
                ($includes | length) == 0
                or any($includes[]; . as $p | $client.title | test($p))
            )
            and
            all($excludes[]; . as $p | ($client.title | test($p) | not))
        )
        | .id
    ' |
    head -n1
)"

if [ -n "$client" ]; then
    mmsg dispatch focusid client,"$client"
elif [ -n "$tag" ]; then
    mmsg dispatch spawn_on_empty,"$command","$tag"
else
    mmsg dispatch spawn,"$command"
fi
