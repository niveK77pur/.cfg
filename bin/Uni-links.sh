#!/bin/bash
# vim: nowrap ts=4 tw=0 fdm=marker

browser="firefox"
args="--new-window"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                                   Functions
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# {{{
goto() {
    "$browser" "$args" "$1" &
}

message(){
    # $1 : command
    # $2 : help message
    [[ ${#1} -eq 1 ]] && type='c' || type='s'
    printf "   -$PREDICATE%$type\t%s\n" "$1" "$2"
}
# }}}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                                    TU Wien
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# {{{
# Links ------------------------------------------------------------------------

tiss="https://tiss.tuwien.ac.at/education/favorites.xhtml?dswid=3646&dsrid=73"    # Favoriten
# tiss="https://tiss.tuwien.ac.at/events/personSchedule.xhtml?dswid=5620&dsrid=210"   # Kalender

tuwel_courses=(
    "https://tuwel.tuwien.ac.at/course/view.php?id=21304"               # Introduction to Visual Computing
    "https://tuwel.tuwien.ac.at/course/view.php?id=21568"               # Einführung zu Künstliche Intelligenz
    "https://tuwel.tuwien.ac.at/course/view.php?idnumber=188410-2020S"  # Software Engineering und Projektmanagement (VO)
    "https://tuwel.tuwien.ac.at/course/view.php?id=153"                 # Software Engineering und Projektmanagement (PR)
    "http://www.complang.tuwien.ac.at/andi/185A48"                      # Übersetzerbau
    "http://www.complang.tuwien.ac.at/ubvl/"                            # Übersetzerbau (Übung)
    "https://tuwel.tuwien.ac.at/course/view.php?id=22147"               # Introduction to security (VU)
    "https://tuwel.tuwien.ac.at/course/view.php?id=21976"               # Introduction to security (UE)
)

mattermost=(
    "https://mattermost.fsinf.at/w-inf-tuwien/channels/uebersetzerbau"              # Übersetzerbau
    "https://mattermost.secpriv.tuwien.ac.at/introsec-ss20/channels/town-square"    # Introduction to security
)

oead="https://housing.oead.at/de/login"

reset="https://reset.inso.tuwien.ac.at/#/course/701/view"
hackthespace="https://hackthe.space/"

# Help -------------------------------------------------------------------------

helpMessage() {
    message 'i'  "TISS; everything course related"
    message 'uh' "TUWEL; Get more options."
    message 'mh' "Mattermost; Get more options."
    message 'o'  "OeAD; website of the housing"
    message 's'  "ssh into the Übersetzerbau machine"
    message 'r'  "RESET; for Project Management"
    message 't'  "Use this option to open the link in a new tab."
    message 'h'  "Print this help screen and exit."
}

mattermostHelpMessage() {
    PREDICATE=m
    message 'c'  "Übersetzerbau (Compilers)"
    message 'S'  "Introduction to security"
    message 'h'  "Print this help screen and exit."
}

tuwelHelpMessage() {
    PREDICATE=u
    message 'v'  "Introduction to Visual Computing"
    message 'a'  "Introduction to Artificial Intelligence"
    message 'p'  "Software Engineering und Projektmanagement (VO)"
    message 'P'  "Software Engineering und Projektmanagement (PR)"
    message 'c'  "Übersetzerbau (Compilers)"
    message 'C'  "Übersetzerbau (Compilers) Übungsteil"
    message 's'  "Introduction to security (VU)"
    message 'S'  "Introduction to security (UE)"
    message 'h'  "Print this help screen and exit."
}

# Main -------------------------------------------------------------------------
if [ $# -eq 0 ]
then
    echo "Use -h to get help about the options."
else
    while getopts hiu:m:srot opt
    do
        case "$opt" in
            i) goto "$tiss" ;;
            u) 
                case "$OPTARG" in
                    v) goto "${tuwel_courses[0]}";;
                    a) goto "${tuwel_courses[1]}";;
                    p) goto "${tuwel_courses[2]}";;
                    P) goto "${tuwel_courses[3]}";;
                    c) goto "${tuwel_courses[4]}";;
                    C) goto "${tuwel_courses[5]}";;
                    s) goto "${tuwel_courses[6]}";;
                    S) goto "${tuwel_courses[7]}";;
                    h) tuwelHelpMessage ;;
                esac
                ;;
            m)
                case "$OPTARG" in
                    c) goto "${mattermost[0]}";;
                    s) goto "${mattermost[1]}";;
                    h) mattermostHelpMessage ;;
                esac
                ;;
            s) goto "$hackthespace" ;;
            r) goto "$reset" ;;
            o) goto "$oead" ;;
            t) args='--new-tab' ;;
            h) helpMessage ;;
        esac
    done
fi
# }}}
exit 0
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                                     UniLu
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# {{{
# Links ------------------------------------------------------------------------
intranet="https://intrastudent.uni.lu"
re_enrolment="https://wwwen.uni.lu/students/useful_information_from_a_to_z"
# owa="https://owa.uni.lu"
owa="https://outlook.office365.com/owa/uniluxembourg.onmicrosoft.com/0180556255@uniluxembourg.mail.onmicrosoft.com/"
guichet_etudiant="https://inscription.uni.lu/Inscriptions/Student/GuichetEtudiant"

moodle="https://moodle.uni.lu/course/index.php?categoryid=568"
moodle_courses=(
    "https://moodle.uni.lu/course/view.php?id=3333" # Security 1
    "https://moodle.uni.lu/course/view.php?id=3332" # Information Management 1
    "https://moodle.uni.lu/course/view.php?id=3331" # Algorithms and Complexity
    "https://moodle.uni.lu/course/view.php?id=3330" # Programming Fundamentals 3
    "https://moodle.uni.lu/course/view.php?id=3329" # Discrete Mathematics 2
)

dropbox_students="https://www.dropbox.com/sh/h83eajpydshiqat/AADvnpKPZdGVPUtMoHh03PARa?dl=0&lst"
dropbox_meetings="https://www.dropbox.com/sh/hhjpm7k4zdatrez/AADFKNOP8g3gQHqilO9dWF_Ea?dl=0"
dropbox_maps="https://www.dropbox.com/sh/kuvdenyhta19ojm/AAC0sGkB97ZafdiUFqXOVIXka?dl=0&lst="

slack_bics="https://bicsworld.slack.com/"
slack_ngjobs="https://ngjobs.slack.com/"
slack_e4l="https://energy4life.slack.com/"
slack_rues="https://ruesgrp.slack.com/"

google_docs="https://docs.google.com/document/u/0/"
google_sheets="https://docs.google.com/spreadsheets/u/0/"
google_drive_bsp="https://docs.google.com/spreadsheets/d/11y0zILOsMJBMp3zOCdKH0y-IM8qJIyAglVGbygX9X2U/edit#gid=1449240152"

BMT="https://messir.uni.lu/bmt/home"
bsp_activity_report="https://docs.google.com/spreadsheets/d/1tVj7fNuhFbiy165YyAZ7JQmUji0MuuC932kq9aDGjx0/edit#gid=1449240152"

password_forget_reset="https://inscription.uni.lu/Inscriptions/Public/OubliMDP"
password_troubleshooting="https://acme.uni.lu/TS"

# Help -------------------------------------------------------------------------
helpMessage() {
    echo   "   $(basename $0) [-t] links ..."
    message 'bh' "Get more options for BSP."
    message 'dh' "Get more options for dropbox."
    message 'e'  "Update and check personal information, bank account details, etc.
        (Guichet Étudiant)"
    message 'gh' "Get more options for google."
    message 'i'  "Access university's intranet for all students."
    message 'mh' "Get more options for moodle."
    message 'o'  "Access email for student address. (OWA)"
    message 'ph' "Get help for password and account links ..."
    message 'r'  "You have to re-enrol online ever semester!"
    message 'sh' "Get more options for slack."
    message 't'  "Use this option to open the link in a new tab."
    message 'h'  "Print this help screen and exit."
}

passwordHelpMessage(){
    PREDICATE=p
    message 'f' "In case you forget or want to reset the password."
    message 'r' "Does the same as -f"
    message 't' "In case you are having difficulties connecting."
    message 'h' "Print this password help screen and exit."
}

slackHelpMessage(){
    PREDICATE=s
    message 'b' "Goto slack BiCS forum."
    message 'n' "Goto slack NG Jobs forum."
    message 'e' "Goto slack Energy4Life forum."
    message 'r' "Goto slack rues forum."
    message 'h' "Print this slack help screen and exit."
}

dropboxHelpMessage(){
    PREDICATE=d
    message 'a' "'maps' folder shared on Dropbox."
    message 'm' "'meetings' folder shared on Dropbox."
    message 's' "'students' folder shared on Dropbox."
    message 'h' "Print this help screen and exit."
}

googleHelpMessage(){
    PREDICATE=g
    message 'b' "Goto Google Drive for the BPS."
    message 'd' "Goto Google Docs site."
    message 's' "Goto Google Sheets site."
    message 'h' "Print this help screen and exit."
}

moodleHelpMessage(){
    PREDICATE=m
    message 'm' "Collaborative platform for students and teachers. (Moodle)"
    message 's' "Security 1"
    message 'i' "Information Management 1"
    message 'a' "Algorithms and Complexity"
    message 'p' "Programming Fundamentals 3"
    message 'd' "Discrete Mathematics 2"
    message 'h' "Print this help screen and exit."
}

BSPHelpMessage(){
    PREDICATE=b
    message 'a' "Go to activity report (Google Sheets)."
    message 'b' "Go to the BMT page."
    message 'h' "Print this help screen and exit."
}

# Main -------------------------------------------------------------------------
if [ $# -eq 0 ]
then
    echo "Use -h to get help about the options."
else
    while getopts ieb:rog:m:s:d:jp:ht opt
    do
        case "$opt" in
            i) goto "$intranet";;
            r) goto "$re_enrolment";;
            o) goto "$owa";;
            e) goto "$guichet_etudiant";;
            m) 
                case "$OPTARG" in
                    # a)  i=0
                    #     args="--new-tab"
                    #     for c in ${moodle_courses[@]}
                    #     do
                    #         goto "$c"
                    #         i=$(( i + 1 ))
                    #     done
                    #     echo "$i courses opened."
                    #     ;;
                    m) goto "$moodle" ;;
                    s) goto "${moodle_courses[0]}" ;;
                    i) goto "${moodle_courses[1]}" ;;
                    a) goto "${moodle_courses[2]}" ;;
                    p) goto "${moodle_courses[3]}" ;;
                    d) goto "${moodle_courses[4]}" ;;
                    h) moodleHelpMessage ;;
                esac
                ;;
            d) 
                case "$OPTARG" in
                    s) goto "$dropbox_students";;
                    m) goto "$dropbox_meetings";;
                    a) goto "$dropbox_maps";;
                    h) dropboxHelpMessage ;;
                esac
                ;;
            s)
                case "$OPTARG" in
                   b) goto "$slack_bics";;
                   n) goto "$slack_ngjobs";;
                   e) goto "$slack_e4l";;
                   r) goto "$slack_rues";;
                   h) slackHelpMessage ;;
                esac
                ;;
            b)
                case "$OPTARG" in
                    a) goto "$bsp_activity_report" ;;
                    b) goto "$BMT" ;;
                    h) BSPHelpMessage ;;
                esac
                ;;
            p)
                case "$OPTARG" in
                    f|r) goto "$password_forget_reset";;
                    t)   goto "$password_troubleshooting";;
                    h)   passwordHelpMessage ;;
                esac
                ;;
            g)
                case "$OPTARG" in
                    b) goto "$google_drive_bsp";;
                    d) goto "$google_docs";;
                    s) goto "$google_sheets";;
                    h) googleHelpMessage ;;
                esac
                ;;
            t) args='--new-tab' ;;
            h) helpMessage ;;
        esac
    done
fi

# }}}
