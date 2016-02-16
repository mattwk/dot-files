#!/bin/bash

DIR=$( cd $(dirname $0); pwd -P )

for file in dot-*; do

    target="$HOME/$(echo $(basename $file) | sed s/dot-/./)"

    if [[ -L "$target" ]]; then
        echo rm -f "$target"
        rm -f "$target"
    elif [[ -r "$target" ]];then
        mv $target{,.bak}
    fi

    echo "$DIR/$file -> $target"
    ln -s "$DIR/$file" "$target"
done

bash -c "cd $(dirname $0) && git submodule update --init --recursive"
