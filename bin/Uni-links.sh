#!/bin/bash
# vim: nowrap:ts=4:tw=0

browser="firefox"
args="--new-window"

# links:
intranet="https://intrastudent.uni.lu"
re_enrolment="https://wwwen.uni.lu/students/useful_information_from_a_to_z"
# owa="https://owa.uni.lu"
owa="https://outlook.office365.com/owa/uniluxembourg.onmicrosoft.com/0180556255@uniluxembourg.mail.onmicrosoft.com/"
guichet_etudiant="https://inscription.uni.lu/Inscriptions/Student/GuichetEtudiant"

moodle="https://moodle.uni.lu/course/index.php?categoryid=438"
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
bsp_activity_report="https://docs.google.com/spreadsheets/d/11y0zILOsMJBMp3zOCdKH0y-IM8qJIyAglVGbygX9X2U/edit#gid=1449240152"

password_forget_reset="https://inscription.uni.lu/Inscriptions/Public/OubliMDP"
password_troubleshooting="https://acme.uni.lu/TS"

goto() {
    "$browser" "$args" "$1" &
}

message(){
    # $1 : command
    # $2 : help message
    [[ ${#1} -eq 1 ]] && type='c' || type='s'
    printf "   -$PREDICATE%$type\t%s\n" "$1" "$2"
}

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
