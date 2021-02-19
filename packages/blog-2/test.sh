#!/bin/bash

run_yarn(){
  local some_packages=($(YARN_IGNORE_PATH=1 yarn --json workspaces info | jq -r '.data | fromjson | to_entries | .[].value.location | @sh'| tr -d \'))
  echo "${some_packages[@]}" > test_file
  local read_packages=($(cat test_file))
  for i in "${read_packages[@]}"; do echo "$i-lol"; done
}

run_yarn
