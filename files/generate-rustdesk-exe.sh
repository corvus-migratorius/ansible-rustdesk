#!/bin/bash
# shellcheck disable=SC2155
set -eu -o pipefail

readonly RUSTDESK_SERVER_IP="$(curl -s ifconfig.me)"
readonly RUSTDESK_SERVER_KEY="$(cat /opt/rustdesk-server/lib/id_ed25519.pub)"

cp /opt/rustdesk-server/lib/rustdesk-client.exe \
   /opt/rustdesk-server/lib/rustdesk-host="$RUSTDESK_SERVER_IP",key="$RUSTDESK_SERVER_KEY".exe
