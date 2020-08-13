// NOTE: Update the pathe below to match the current system before installaing!!

// Run from command line with: stata-se -b mysetup.ado; cat mysetup.log
// Make availiable in all Stata sessions: mkdir -p /Users/jonas/Documents/Stata/ado/personal/; cp mysetup.ado /Users/jonas/Documents/Stata/ado/personal/

capture program drop mysetup
program define mysetup, rclass
    version 16.0
    display "Storing setup, show with -return list-"
    return scalar whats_the_question=42
    return local my_project_dir="~/git/my-repos"
end

mysetup
return list
