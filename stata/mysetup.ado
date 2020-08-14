// Make the program availiable in all Stata sessions: mkdir -p <personal ado path>; cp mysetup.ado <personal ado path>
// Update the path to match the personal ADO path which is shown by 
// opening Stata and running -sysdir-.


capture program drop mysetup
program define mysetup, rclass
    version 16.0
    display "Storing setup, show with -return list-"
    return scalar whats_the_question=42
    return local my_project_dir="~/<path to stata projects>"
end

mysetup
return list
