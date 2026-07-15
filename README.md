# Daily Research Log

简体中文 | [English](#english)

一个透明、轻量的 GitHub Actions 每日 check-in 模板。它会每天自动更新一条日志，让你在不方便打开电脑或没有正式项目提交时，也能保留一条清楚可审计的 GitHub 活动记录。

这不是伪装代码贡献的工具。它只做一件事：在专门仓库里记录一次每日连续性 check-in，避免把无关提交塞进真正的项目仓库。

## 它解决什么痛点

很多人的 GitHub 贡献图并不完全反映真实状态：

- 有些工作发生在本地、论文、笔记、实验、Notion、Overleaf、Stata、数据整理或私有环境里。
- 有些天人在路上、开会、出差、考试、陪家人，无法坐在电脑前 commit。
- 有些项目不适合为了点亮贡献图而制造无意义提交。
- 有些正式仓库有分支保护、PR 流程或协作规范，不应该被每日打卡污染历史。

这个模板把“每日连续性记录”和“正式项目开发”分开：正式工作继续留在正式仓库；每日 check-in 只进入这个独立日志仓库。

## 适合谁

- 学生、研究者、博士生：希望记录持续学习、论文阅读、实验推进或研究日常。
- 独立开发者：希望保持 GitHub profile 的连续活跃，但不想污染真实项目。
- 数据分析、Stata、R、Python 用户：很多工作不一定每天都会形成 GitHub commit。
- 内容创作者 / 技术写作者：日常工作可能发生在文档、脚本、笔记和发布平台之间。
- 使用多台电脑的人：不想依赖某一台电脑开机执行定时任务。

## 不适合什么

- 不适合伪装成每天都有实质性代码开发。
- 不适合替代真正的项目提交、Issue、PR 或 release。
- 不适合把敏感笔记、日记、密码、token、API key 写进日志。

默认日志只包含日期、时间和一条固定说明。

## 工作原理

- GitHub Actions 在 GitHub 云端运行，不依赖你的电脑开机。
- 每天北京时间 09:17 自动检查一次。
- 每天北京时间 20:37 再补偿检查一次。
- 脚本检查 `activity/daily-log.csv` 是否已有当天记录。
- 如果没有，就追加一行 check-in。
- 如果已经有，就直接跳过。
- workflow 使用你配置的 GitHub noreply 邮箱提交到 `main`。

每天最多产生一次真实文件变更和一次 commit。

## 使用这个模板

推荐使用 `Use this template` 创建你自己的独立仓库，而不是 fork。GitHub contributions 通常要求 commit 进入非 fork 仓库的默认分支，模板仓库更适合这个用途。

创建新仓库后，进入：

```text
Settings -> Secrets and variables -> Actions -> Variables
```

添加两个仓库变量：

| 名称 | 示例 |
| --- | --- |
| `GIT_AUTHOR_NAME` | `your-github-username` |
| `GIT_AUTHOR_EMAIL` | `12345678+your-github-username@users.noreply.github.com` |

你的 GitHub noreply 邮箱可以在这里找到：

```text
GitHub -> Settings -> Emails
```

设置完成后，打开 `Actions` 页面，手动运行一次 `Daily Research Check-in`，确认 workflow 能正常执行。

## 隐私与安全

仓库不会保存 GitHub token、密码、cookie 或 API key。

workflow 使用 GitHub Actions 运行时自动提供的临时权限提交文件。仓库里只保存 workflow 配置、脚本、README、License 和公开日志。

公开日志示例：

```csv
date,timestamp,note
2026-07-15,2026-07-15 17:47:57 CST,automated daily research check-in
```

## 文件说明

- `activity/daily-log.csv`：每日 check-in 记录。
- `scripts/update-daily-log.sh`：幂等日志更新脚本。
- `.github/workflows/daily-contribution.yml`：GitHub Actions 定时任务。
- `tests/test-update-daily-log.sh`：本地 smoke test。
- `README.md`：中英双语说明。
- `LICENSE`：MIT License。

## License

MIT

---

## English

[简体中文](#daily-research-log) | English

A transparent, lightweight GitHub Actions template for keeping a daily check-in log. It records one small, auditable activity entry per day when you are away from your computer or do not have a normal project commit to make.

This is not a fake-code generator. It separates a daily continuity record from real project development, so your actual repositories stay clean.

### What Problem It Solves

GitHub contribution graphs do not always capture real work:

- Some work happens in papers, notes, experiments, private tools, Stata, Overleaf, Notion, or local data workflows.
- Some days you are traveling, in meetings, or away from your development machine.
- Some projects should not receive meaningless commits just to keep a contribution graph active.
- Some repositories have branch protection, PR review, or collaboration rules.

This template keeps the daily continuity record in a dedicated log repository instead of mixing it into real project history.

### Who It Is For

- Students and researchers tracking reading, experiments, or research routines.
- Indie developers who want a clean GitHub activity baseline.
- Data, Stata, R, and Python users whose daily work does not always become a commit.
- Technical writers and content creators working across notes, scripts, and publishing platforms.
- People who use multiple computers and do not want a local scheduled task.

### How It Works

- GitHub Actions runs in the cloud.
- The workflow checks in at 09:17 and 20:37 in the `Asia/Shanghai` timezone.
- The script checks whether today's date already exists in `activity/daily-log.csv`.
- If today's row is missing, it appends one check-in row.
- If the row already exists, it skips.
- The workflow commits the change to `main` with your configured GitHub noreply email.

### Use This Template

Use `Use this template` to create your own standalone repository. This is better than forking because GitHub contributions generally need commits on the default branch of a non-fork repository.

Then add these repository variables under `Settings -> Secrets and variables -> Actions -> Variables`:

| Name | Example |
| --- | --- |
| `GIT_AUTHOR_NAME` | `your-github-username` |
| `GIT_AUTHOR_EMAIL` | `12345678+your-github-username@users.noreply.github.com` |

You can find your GitHub noreply email at `GitHub -> Settings -> Emails`.

After setup, open the `Actions` tab and manually run `Daily Research Check-in` once to verify it works.

### Privacy

This repository does not store GitHub tokens, passwords, cookies, or API keys. The public log contains only date, timestamp, and a short note.

### License

MIT
