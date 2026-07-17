# Daily Research Log

[简体中文](#简体中文) | [English](#english)

## 简体中文

一个透明、轻量的 GitHub Actions 每日 check-in 模板。它每天在专用仓库中记录一条可审计的连续性记录，不依赖你的电脑开机。

这不是伪装代码生成器，也不替代真实的软件开发。正式项目继续保留真实的 Issue、Pull Request、测试和发布记录；本仓库只保存每日连续性 check-in。

### 它解决什么问题

- 研究、写作、实验、数据整理和本地工作不一定每天形成 GitHub commit。
- 出差、开会或暂时不在电脑旁时，无法手动提交。
- 不应为了点亮贡献图而污染正式项目仓库。
- 独立日志仓库可以把连续性记录和正式开发分开。

### 适合谁

- 学生、研究者和博士生；
- 独立开发者；
- Stata、R、Python 和数据分析用户；
- 技术写作者和内容创作者；
- 使用多台电脑、不希望依赖本地定时任务的人。

### 不适合什么

- 不适合声称每天都有实质性代码开发；
- 不适合替代真实项目提交、Issue、Pull Request 或 release；
- 不适合写入密码、Token、API key、私人笔记或研究数据。

### 工作原理

- GitHub Actions 在云端运行，不需要你的电脑开机。
- 工作流按北京时间每天 00:05 和 12:05 检查。
- 脚本检查当天是否已经存在记录。
- 如果没有，就追加一行并提交到 main。
- 如果已经存在，就跳过，不会重复提交。
- GitHub Actions 可能因队列负载延迟几分钟，因此这两个时间是目标时间，不是精确保证时间。
- 每天最多产生一次真实文件变更和一次 commit。

### 使用模板

推荐点击仓库中的 **Use this template**，创建一个独立仓库，不要直接 fork。

创建后进入：

~~~text
Settings -> Secrets and variables -> Actions -> Variables
~~~

添加：

| 名称 | 示例 |
| --- | --- |
| \`GIT_AUTHOR_NAME\` | \`your-github-username\` |
| \`GIT_AUTHOR_EMAIL\` | \`12345678+your-github-username@users.noreply.github.com\` |

邮箱必须使用你自己 GitHub 账户已经关联的 noreply 邮箱：

~~~text
GitHub -> Settings -> Emails
~~~

然后：

1. 打开 Actions；
2. 手动运行一次 Daily Research Check-in 进行测试；
3. 确认仓库的 Actions 具有 Read and write permissions；
4. 之后无需每天手动运行，定时任务会在云端执行。

### 隐私与安全

仓库不保存 GitHub Token、密码、Cookie、API key 或本地路径。公开日志只包含日期、时间和固定说明。

每个使用者都必须配置自己的 GitHub noreply 邮箱，不要复制本仓库维护者的邮箱设置。

### 文件说明

- \`activity/daily-log.csv\`：每日 check-in 记录；
- \`scripts/update-daily-log.sh\`：幂等日志更新脚本；
- \`.github/workflows/daily-contribution.yml\`：定时工作流；
- \`tests/test-update-daily-log.sh\`：本地 smoke test；
- \`README.md\`：中英文说明；
- \`LICENSE\`：MIT License。

### License

MIT License。

---

## English

A transparent and lightweight GitHub Actions template for recording one auditable daily continuity check-in in a dedicated repository. It runs in the cloud and does not require your computer to stay on.

This is not a fake-code generator, and it does not replace substantive software development. Real projects should keep their real Issues, Pull Requests, tests, and releases; this repository is only for a separate daily continuity record.

### What Problem It Solves

- Research, writing, experiments, data preparation, and local work do not always produce a GitHub commit every day.
- Travel, meetings, and time away from a computer can prevent a manual commit.
- Formal project repositories should not be polluted with meaningless activity commits.
- A dedicated log repository separates continuity tracking from real development history.

### Who It Is For

- Students, researchers, and PhD candidates;
- Independent developers;
- Stata, R, Python, and data-analysis users;
- Technical writers and content creators;
- People using multiple computers who do not want a local scheduler.

### What It Is Not For

- It should not claim that substantive software development happened every day.
- It does not replace real project commits, Issues, Pull Requests, or releases.
- It must not contain passwords, tokens, API keys, private notes, or research data.

### How It Works

- GitHub Actions runs in the cloud, so your computer does not need to be on.
- The workflow checks once at 00:05 and once at 12:05 in the Asia/Shanghai timezone.
- The script checks whether today's date is already recorded.
- If no record exists, it appends one row and commits it to main.
- If a record already exists, it skips the commit.
- GitHub Actions may be delayed by queue load, so these are target times rather than exact guarantees.
- At most one real file change and one commit are created per day.

### Use This Template

Click **Use this template** to create an independent repository. Do not use a direct fork for normal use.

After creating your repository, open:

~~~text
Settings -> Secrets and variables -> Actions -> Variables
~~~

Add:

| Name | Example |
| --- | --- |
| \`GIT_AUTHOR_NAME\` | \`your-github-username\` |
| \`GIT_AUTHOR_EMAIL\` | \`12345678+your-github-username@users.noreply.github.com\` |

The email must be a noreply address associated with your own GitHub account:

~~~text
GitHub -> Settings -> Emails
~~~

Then:

1. Open Actions;
2. Run Daily Research Check-in once as a test;
3. Confirm that Actions has Read and write permissions;
4. You do not need to run it manually every day; the scheduled workflow runs in the cloud.

### Privacy and Security

The repository does not store GitHub tokens, passwords, cookies, API keys, or local paths. The public log contains only a date, timestamp, and fixed note.

Each user must configure their own GitHub noreply email. Do not copy the maintainer's email settings.

### File Overview

- \`activity/daily-log.csv\`: daily check-in records;
- \`scripts/update-daily-log.sh\`: idempotent log update script;
- \`.github/workflows/daily-contribution.yml\`: scheduled workflow;
- \`tests/test-update-daily-log.sh\`: local smoke test;
- \`README.md\`: bilingual documentation;
- \`LICENSE\`: MIT License.

### License

MIT License.
