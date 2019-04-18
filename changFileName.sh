#!/bin/bash
array=()
while IFS=  read -r -d $'\0'; do
    # printf $REPLY + \n
    array+=("$REPLY")
done < <(find . -regex '^.*\/[^\.]*.scss' -print0)
# done < <(find . -regex '^.*\/test.scss' -print0)

for(( i=0; i < ${#array[@]}; i++));do
    str="node_modules"
    if [[ !("${array[$i]}" =~ "$str") ]];then
        # printf 'Argument: %s\n' "$info";
        filepath=${array[$i]}
        res="$(echo  ${filepath} | grep -e '.*\.' -o)"
        echo "$res"
        # mv $filepath "${res}module.scss"
    fi

done