#!/usr/bin/env bash

# (Reverse) synchronize repo with flatnotes.

script_dir_path=$(dirname $(realpath "$0"))
notes_files=$(find $script_dir_path -name 'README.md')
reverse_synched_dir_path="$1"

if [[ ! -d "$reverse_synched_dir_path" ]];
then
    echo "Usage: ./sync.sh <flatnotes_content_dir_path>"
    exit 1
fi

for file in $notes_files;
do
    title=$(head $file | grep '> Title' | cut -d ":" -f 2 | cut -c2-)

    if [[ -z $title ]];
    then
        echo "Skipping $file... (no valid title found)."
        continue;
    fi

    reverse_synched_file="$reverse_synched_dir_path/$title.md"

    if [[ ! -f "$reverse_synched_file" ]];
    then
        echo "First time synching book $title... ($file > $reverse_synched_file)"
        rsync $file "$reverse_synched_file"
        continue;
    fi

    echo "Reverse synching book $title... ($reverse_synched_file > $file)"
    rsync "$reverse_synched_file" $file
done

if [[ ! -z $(git -C "$script_dir_path" status --porcelain) ]];
then
    (cd "script_dir_path"; git add .; git commit -m "sync: flatnotes"; git push)
fi