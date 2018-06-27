#!/bin/bash
dir=/opt/orchestration/deploycode/
for I in dev prod test; do
  export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=false"
  if [ ! -d ${dir}/${I} ]; then
    git clone --branch ${I} git@github.com:tulpert/lacking-rainbow.git ${dir}/${I}
  fi
  git --git-dir=${dir}/${I}/.git --work-tree=${dir}/${I} pull -q origin ${I}
  git --git-dir=${dir}/${I}/.git --work-tree=${dir}/${I} reset -q --hard
done
