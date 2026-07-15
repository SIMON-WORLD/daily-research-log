# Daily Research Log

[简体中文](./README.zh-CN.md)

A tiny GitHub Actions template for keeping a transparent daily research and learning check-in log.

It checks in twice per day and appends at most one row to `activity/daily-log.csv` for the current date. The goal is to keep a lightweight continuity record for days when you are away from your computer and cannot make a normal project commit.

This is not a fake-code generator. It creates a small, auditable log entry so the repository history clearly shows what happened.

## How It Works

- GitHub Actions runs on a schedule.
- The script checks whether today's date already exists in `activity/daily-log.csv`.
- If today's row is missing, it appends one check-in row.
- The workflow commits the change to `main` using your configured GitHub noreply email.
- If the first scheduled run is delayed or missed, the second run acts as a backup.

## Schedule

The workflow runs in the `Asia/Shanghai` timezone:

- 09:17 every day
- 20:37 every day

The script is idempotent, so both runs cannot create duplicate rows for the same date.

## Use This Template

1. Create a new repository from this template.
2. Open your repository settings.
3. Go to `Settings` -> `Secrets and variables` -> `Actions` -> `Variables`.
4. Add these repository variables:

| Name | Example |
| --- | --- |
| `GIT_AUTHOR_NAME` | `your-github-username` |
| `GIT_AUTHOR_EMAIL` | `12345678+your-github-username@users.noreply.github.com` |

You can find your GitHub noreply email at `GitHub` -> `Settings` -> `Emails`.

After setup, open the `Actions` tab and manually run `Daily Research Check-in` once to verify it works.

## Transparency

This repository is an automated activity log. A daily row here means a continuity check-in was recorded; it does not imply substantive code changes in another project on that date.

## Files

- `activity/daily-log.csv`: daily check-in records
- `scripts/update-daily-log.sh`: idempotent log updater
- `.github/workflows/daily-contribution.yml`: scheduled GitHub Actions workflow
- `tests/test-update-daily-log.sh`: local smoke test for the updater

## License

MIT
