# Daily Research Log

English | [简体中文](#简体中文)

## English

A tiny GitHub Actions template for keeping a transparent daily research and learning check-in log.

It checks in twice per day and appends at most one row to `activity/daily-log.csv` for the current date. The goal is to keep a lightweight continuity record for days when you are away from your computer and cannot make a normal project commit.

This is not a fake-code generator. It creates a small, auditable log entry so the repository history clearly shows what happened.

### How It Works

- GitHub Actions runs on a schedule.
- The script checks whether today's date already exists in `activity/daily-log.csv`.
- If today's row is missing, it appends one check-in row.
- The workflow commits the change to `main` using your configured GitHub noreply email.
- If the first scheduled run is delayed or missed, the second run acts as a backup.

### Schedule

The workflow runs in the `Asia/Shanghai` timezone:

- 09:17 every day
- 20:37 every day

The script is idempotent, so both runs cannot create duplicate rows for the same date.

### Use This Template

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

### Transparency

This repository is an automated activity log. A daily row here means a continuity check-in was recorded; it does not imply substantive code changes in another project on that date.

### Files

- `activity/daily-log.csv`: daily check-in records
- `scripts/update-daily-log.sh`: idempotent log updater
- `.github/workflows/daily-contribution.yml`: scheduled GitHub Actions workflow
- `tests/test-update-daily-log.sh`: local smoke test for the updater

### License

MIT

---

## 简体中文

[English](#english) | 简体中文

一个很小的 GitHub Actions 模板，用来维护透明的每日研究 / 学习 check-in 日志。

它每天检查两次，并且每天最多向 `activity/daily-log.csv` 追加一行记录。目标是在你不在电脑边、没有办法进行正常项目提交时，仍然保留一条轻量、可审计的连续性记录。

这不是伪装代码贡献的工具。它创建的是清楚可见的日志记录，让仓库历史如实显示发生了什么。

### 工作原理

- GitHub Actions 按计划自动运行。
- 脚本检查 `activity/daily-log.csv` 里是否已经有当天日期。
- 如果当天记录不存在，就追加一行 check-in。
- workflow 使用你配置的 GitHub noreply 邮箱提交到 `main`。
- 如果第一次定时运行延迟或错过，第二次运行会作为补偿检查。

### 运行时间

workflow 使用 `Asia/Shanghai` 时区：

- 每天 09:17
- 每天 20:37

脚本是幂等的，所以同一天不会重复生成多条记录。

### 使用这个模板

1. 从这个模板创建一个新的仓库。
2. 打开新仓库的设置。
3. 进入 `Settings` -> `Secrets and variables` -> `Actions` -> `Variables`。
4. 添加下面两个仓库变量：

| 名称 | 示例 |
| --- | --- |
| `GIT_AUTHOR_NAME` | `your-github-username` |
| `GIT_AUTHOR_EMAIL` | `12345678+your-github-username@users.noreply.github.com` |

你的 GitHub noreply 邮箱可以在 `GitHub` -> `Settings` -> `Emails` 里找到。

设置完成后，打开 `Actions` 页面，手动运行一次 `Daily Research Check-in`，确认 workflow 能正常执行。

### 透明性说明

这个仓库是自动化活动日志。这里每天的一行记录，只表示当天记录了一次连续性 check-in；它不表示你在其他项目里做了实质性的代码工作。

### 文件说明

- `activity/daily-log.csv`：每日 check-in 记录。
- `scripts/update-daily-log.sh`：幂等日志更新脚本。
- `.github/workflows/daily-contribution.yml`：GitHub Actions 定时任务。
- `tests/test-update-daily-log.sh`：本地 smoke test。

### License

MIT
