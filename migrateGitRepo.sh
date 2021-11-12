#!/bin/bash
set -x
# You can find context variable at: https://docs.rundeck.com/docs/manual/job-workflows.html#context-variables
if [ -z "$RD_OPTION_STASH_URL" -o -z "$RD_OPTION_BITBUCKET_URL" ]; then
  echo "Source Stash Repository URL and target Bitbucket Repository URL must be provided."
  exit $LINENO
fi

echo "Your input: "
echo "  Stash Reository: $RD_OPTION_STASH_URL"
echo "  Bitbucket Repository: $RD_OPTION_BITBUCKET_URL"

git config --global user.name @job.username@
git config --global user.email @job.user.email@

if [ ! -z "$RD_OPTION_BRANCHES_TO_BE_MIGRATED" ]; then
    echo "  Branch to be migrated other than master: $RD_OPTION_BRANCHES_TO_BE_MIGRATED"
fi

work_space=/opt/workSpace
repo_dir=`basename $RD_OPTION_STASH_URL .git`

mkdir -p $work_space
cd $work_space

[[ -d "${repo_dir}" ]] && rm -rf ${repo_dir}

git clone $RD_OPTION_STASH_URL

cd ${repo_dir}
pwd
if [ ! -z "$RD_OPTION_BRANCHES_TO_BE_MIGRATED" ]; then
    echo "  Branch to be migrated other than master: $RD_OPTION_BRANCHES_TO_BE_MIGRATED"

    branches=`echo $RD_OPTION_BRANCHES_TO_BE_MIGRATED | tr ',' ' '`
    for branch in ${branches}
    do
        git checkout ${branch}
    done
fi
### git remote set-url origin ${bitbucket_url}
# git remote -v
#
### git push --all -f
### git push --tags -f

echo "Migration from $RD_OPTION_STASH_URL to $RD_OPTION_BITBUCKET_URL is completed."
