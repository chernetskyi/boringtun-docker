#!/bin/sh
set -e

echo "Running wg-quick up:"
wg-quick up "${INTERFACE}"
echo "wg-quick has successfully finished\n"

eval "$@"

echo "\nReading boringtun logs:"
tail -f "${WG_LOG_FILE}"
