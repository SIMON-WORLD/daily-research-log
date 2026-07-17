

## Troubleshooting

If a scheduled run does not create a record, check the following:

1. Actions is enabled for the repository.
2. Workflow permissions are set to Read and write permissions.
3. GIT_AUTHOR_NAME and GIT_AUTHOR_EMAIL are configured under repository Variables.
4. The Actions run log does not show a permission or authentication error.
5. The run may be delayed by GitHub Actions queue load; check the run event and timestamp before rerunning.

## Troubleshooting (English)

If a scheduled run does not create a record, check that Actions is enabled, workflow permissions allow Read and write access, both author variables are configured, and the run log has no permission or authentication error. The schedule may be delayed by GitHub queue load; check the event and timestamp before rerunning.