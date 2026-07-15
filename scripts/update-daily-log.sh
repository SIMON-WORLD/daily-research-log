#!/usr/bin/env bash
set -euo pipefail

today="${CHECK_IN_DATE:-$(date +%F)}"
timestamp="${CHECK_IN_TIMESTAMP:-$(date '+%F %T %Z')}"
note="${CHECK_IN_NOTE:-automated daily research check-in}"
log_file="${CHECK_IN_LOG_FILE:-activity/daily-log.csv}"

mkdir -p "$(dirname "${log_file}")"

if [[ ! -f "${log_file}" ]]; then
  echo "date,timestamp,note" > "${log_file}"
fi

if grep -q "^${today}," "${log_file}"; then
  echo "Contribution already recorded for ${today}. Skipping."
  exit 0
fi

echo "${today},${timestamp},${note}" >> "${log_file}"
echo "Recorded daily check-in for ${today}."
