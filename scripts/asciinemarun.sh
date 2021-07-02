#!/bin/bash
TARGET_OS=bionic
TARGET_VERSION=1.21.2

runner () {
  COMMAND_2_RUN=$1
  FILE_2_SAVE=$2
  TITLE_4_CAST=$3
  asciinema \
    --quiet \
    --title $TITLE_4_CAST \
    --idle-time-limit 2.5 \
    --command $COMMAND_2_RUN \
    $FILE_2_SAVE
}

runner  "kubash build -y --target-os ${TARGET_OS}${TARGET_VERSION}" build.json "Kubash build run"
runner  "kubash provision -n $CLUSTER_NAME" provision.json "Kubash provision run"
