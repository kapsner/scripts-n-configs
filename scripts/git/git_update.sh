#!/bin/bash

FULL_PATH=$(pwd)

if [[ ! -d ".git" ]]; then
    printf "[ERROR] ${FULL_PATH} is not a git repositroy.\n"
    exit 1
fi

if [[ -n "$(git status -s -uall)" ]]; then
    printf "[ERROR] uncommitted changes - please commit first.\n"
    exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
printf "[INFO] current branch name: '${CURRENT_BRANCH}'\n"

DEFAULT_BRANCH=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
printf "[INFO] default branch name: '${DEFAULT_BRANCH}'\n"

if [[ "${CURRENT_BRANCH}" != "${DEFAULT_BRANCH}" ]]; then
    git checkout ${DEFAULT_BRANCH}
fi

printf "[INFO] updating repo'\n"
git pull origin ${DEFAULT_BRANCH}
