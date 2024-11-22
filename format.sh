#!/bin/bash
for filename in ./kern/*.krn; do
    cat "$filename" \
        | shed -x "text" -e "s/'/’/g" \
        | shed -x "kern" -e "s/i//g" \
        | shed -x "kern" -e "s/LL/L/g" \
        | shed -x "kern" -e "s/JJ/J/g" \
        | sed 's/Soprano/Sopran/g' \
        | sed 's/Alto/Alt/g' \
        | echo -n "$(cat)" > "$filename.tmp"
	mv "$filename.tmp" "$filename"
done
