# Daily Research Log

This repository keeps a small, transparent daily research and learning log.

It is maintained by GitHub Actions. The workflow checks in twice per day and appends at most one row to `activity/daily-log.csv` for the current date. The goal is to keep a lightweight continuity record for days when I am away from my computer and cannot make a normal project commit.

## How It Works

- GitHub Actions runs on a schedule.
- The script checks whether today's date already exists in `activity/daily-log.csv`.
- If today's row is missing, it appends one check-in row.
- The workflow commits the change to `main` using my GitHub noreply email.
- If the first scheduled run is delayed or missed, the second run acts as a backup.

## Schedule

The workflow runs in the `Asia/Shanghai` timezone:

- 09:17 every day
- 20:37 every day

The script is idempotent, so both runs cannot create duplicate rows for the same date.

## Transparency

This repository is an automated activity log. A daily row here means a continuity check-in was recorded; it does not imply that I made substantive code changes in another project on that date.

## Files

- `activity/daily-log.csv`: daily check-in records
- `scripts/update-daily-log.sh`: idempotent log updater
- `.github/workflows/daily-contribution.yml`: scheduled GitHub Actions workflow
- `tests/test-update-daily-log.sh`: local smoke test for the updater
