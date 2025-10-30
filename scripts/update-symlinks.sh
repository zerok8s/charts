#!/usr/bin/env bash

set -eo pipefail

lookup_latest_tag() {
  git fetch --tags >/dev/null 2>&1

  if ! git describe --tags --abbrev=0 HEAD~ 2>/dev/null; then
    git rev-list --max-parents=0 --first-parent HEAD
  fi
}

lookup_changed_files() {
  local latest_tag="$1"
  git --no-pager diff --find-renames --name-only "$latest_tag"
}

charts_dir="charts/"
latest_tag=$(lookup_latest_tag)
link_files=$(find charts/ -type l)
changed_files=$(lookup_changed_files "${latest_tag}")

echo "Symlinks in '${charts_dir}':"
printf -- '- %s\n' ${link_files}
echo

echo "Changed files in '${charts_dir}' since '${latest_tag}':"
printf -- '- %s\n' ${changed_files}
echo

for link_file in ${link_files}; do
  link_target=$(readlink "${link_file}")
  echo -n "Processing link file: ${link_file} (points to: ${link_target})"
  updated=false
  for changed_file in ${changed_files}; do
    if echo "${link_target}" | grep -q "${changed_file}"; then
      ln -sfn "./${link_target}" "${link_file}"
      updated=true
    fi
  done
  if [ "$updated" = true ]; then
    echo " ✅"
  else
    echo " ⚪️"
  fi
done

changed_files=$(lookup_changed_files "${latest_tag}")
echo
echo "Changed files after symlink update in '${charts_dir}' since '${latest_tag}':"
printf -- '- %s\n' ${changed_files}
