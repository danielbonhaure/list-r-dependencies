#!/usr/bin/env bash

source_files=($(find -name *.R))

grep -hE '\b(require|library)\([[:alnum:]\.]+\)' "${source_files[@]}" | \
    sed '/^[[:blank:]]*#/d' | \
    sed -E 's/.*\(([[:alnum:]]*)\).*/\1/' | \
    sort -uf \
    > DEPENDS.1

grep -hE '.*::' "${source_files[@]}" | \
    sed '/^[[:blank:]]*#/d' | \
    sed -E 's/.*[^[:alpha:]]([[:alnum:]]*)::.*/\1/' | \
    sort -uf \
    > DEPENDS.2
