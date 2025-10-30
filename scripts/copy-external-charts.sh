#!/usr/bin/env bash
set -euo pipefail

# Base destination directory for collected charts
DEST_DIR="charts"

# Ensure the destination exists
mkdir -p "$DEST_DIR"

# Find all Chart.yaml files (case-sensitive) recursively
find "external" -type f -name "Chart.yaml" | while read -r chart_file; do
  # Get the parent directory (the chart root)
  chart_dir=$(dirname "$chart_file")
  chart_name=$(basename "$chart_dir")

  # Skip if it's already inside the charts/ destination
  if [[ "$chart_dir" == ./"$DEST_DIR"* ]]; then
    echo "Skipping chart already under $DEST_DIR/: $chart_dir"
    continue
  fi

  # Destination path
  target_dir="$DEST_DIR/$chart_name"

  echo "📦 Copying chart: $chart_dir → $target_dir"

  # Copy the entire chart directory
  rm -rf "$target_dir"
  cp -R "$chart_dir" "$target_dir"
done

echo "✅ All charts copied under $DEST_DIR/"
