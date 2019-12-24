#!/bin/bash
set -o errexit
path=$(echo "${1}" | sed 's/-/\//g')
localgitdir="/var/lib/oxidized/git-repos/${path}.git"
giturl="gitlab.abc.com/Infrastructure/network-device-backup/${path}.git"
url="https://${oxidized_git_username}:${oxidized_git_password}@$giturl"


if [ ! $(git -C $localgitdir rev-parse --git-dir 2>/dev/null) ]; then
        echo "==> local repo not found , start clone repo from remote"
        echo "    [Git] Clone repo to device.git"
        git clone --bare ${url} $localgitdir
        echo "    [Git] Completed"
else
        echo "==> $localgitdir already exist no need to clone , start fetch and update local repo"
        cd $localgitdir
        echo "    [Git] fetch $giturl master:master"
        git --bare fetch ${url} master:master
        echo "    [Git] completed"
fi
echo "Hook task 'verify_setting' completed"
