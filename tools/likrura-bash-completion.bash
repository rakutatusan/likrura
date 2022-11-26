_likrura_complete()
{
     local cur_word prev_word type_list
     COMPREPLY=()
     cur_word="${COMP_WORDS[COMP_CWORD]}"
     prev_word="${COMP_WORDS[COMP_CWORD-1]}"
 
     opts='encrypt decrypt'
 
     COMPREPLY=( $(compgen -W "${opts}" -- ${cur_word}) )
     return 0
}
 
complete -F _likrura_complete likrura.bash cryptr
