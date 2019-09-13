#!/bin/bash

browser="firefox"
args="--new-window"

if [ $# -eq 0 ]
then
        echo "Use -h to get help about the options."
else
        while getopts m1:ghewx opt 2>/dev/null
        do
                case $opt in
                        m) echo "checking the mails on office365."
                           "$browser" "$args" "https://outlook.office.com/owa/?realm=school.lu" &
                        ;;
                        1)
                                case "$OPTARG" in
                                        p) "$browser" "$args" "https://365education.sharepoint.com/sites/physique_1b_17-18_lhce/Shared%20Documents/Forms/AllItems.aspx"
                                                #"https://365education-my.sharepoint.com/personal/hilmi174_365_education_lu/_layouts/15/onedrive.aspx?e=5%3A8839e23e2ec7416ca6059e0b58cfe81d&id=%2Fpersonal%2Fhilmi174%5F365%5Feducation%5Flu%2FDocuments%2FMy%20Docs%2F1BC%2FDocuments%5Fde%5Fbase%5F1BC&FolderCTID=0x012000A3B4B29B5141C94B8F8763A474B5EE60"
                                                #"https://365education.sharepoint.com/sites/physique_2b_lhce/Shared%20Documents/Forms/AllItems.aspx" &
                                        ;; # Physique
                                        m) "$browser" "$args" "https://365education-my.sharepoint.com/personal/mulgu254_365_education_lu/_layouts/15/onedrive.aspx?e=5%3Af9f81d24fdd04676835636f77ac81ac6&FolderCTID=0x012000489F73C5CB5B4049AAF8B809DBEB5D10&id=%2Fpersonal%2Fmulgu254%5F365%5Feducation%5Flu%2FDocuments%2F1eB%202017%2D2018%20Mathematiques%20I"
                                                #"https://365education-my.sharepoint.com/personal/mulgu254_365_education_lu/_layouts/15/onedrive.aspx?e=5%3Af9f81d24fdd04676835636f77ac81ac6&FolderCTID=0x012000489F73C5CB5B4049AAF8B809DBEB5D10" &
                                                #"https://365education-my.sharepoint.com/personal/mulgu254_365_education_lu/_layouts/15/onedrive.aspx?e=5%3af9f81d24fdd04676835636f77ac81ac6&id=%2fpersonal%2fmulgu254_365_education_lu%2fDocuments%2f2eB+2016-2017&FolderCTID=0x012000489F73C5CB5B4049AAF8B809DBEB5D10"
                                                #"https://outlook.office.com/owa/?path=/group/2eb2016-2017@365.education.lu/files"
                                                #"https://365education.sharepoint.com/sites/2eb2016-2017/Shared%20Documents/Forms/AllItems.aspx"
                                        ;; # Mathé 1
                                        M) "$browser" "$args" "https://365education-my.sharepoint.com/personal/schsi186_365_education_lu/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fschsi186%5F365%5Feducation%5Flu%2FDocuments%2FI%2E1%2FB%2Fexercices%20suppl%C3%A9mentaires%20avec%20param%C3%A8tres"
                                        ;; # Mathé 2
                                        a) "$browser" "$args" "https://365education-my.sharepoint.com/personal/leyma228_365_education_lu/_layouts/15/onedrive.aspx" & ;;   # Allemand
                                        o) "$browser" "$args" "https://365education-my.sharepoint.com/personal/klomi158_365_education_lu/_layouts/15/WopiFrame.aspx?sourcedoc=%7B83110334-78EB-45D2-9DF3-000A30907247%7D&file=OINEL%2017-18&action=default&RootFolder=%2fpersonal%2fklomi158%5f365%5feducation%5flu%2fDocuments%2fClass%20Notebooks%2fOINEL%2017%2d18&d=w8311033478eb45d29df3000a30907247&e=5:508a4eb9e59841b1af62df090c7f6cac"
                                        ;; # Option
                                        e) "$browser" "$args" "https://outlook.office.com/owa/?path=/group/physique_1b_17-18_lhce@365.education.lu/files"
                                        ;;
                                        h) printf "  -1%c\t%s\n"  p "opens 'physique' group"
                                           printf "  -1%c\t%s\n"  o "opens 'Info option' group"
                                           printf "  -1%c\t%s\n"  e "opens 'examens de physique' group"
                                           printf "  -1%c\t%s\n"  m "opens 'mathé 1' group"
                                           printf "  -1%c\t%s\n"  M "opens 'mathé 2' group"
                                           printf "  -1%c\t%s\n"  a "opens 'deutsch' group (directory) OLD"
                                           printf "  -1%c\t%s\n"  h "display the diffrent groups"
                                           ;;
                                        ?) echo "Wrong argument. Use -1h.";;
                                esac
                        ;;
                        g) echo "checking group on oulook (in office365)."
                           "$browser" "$args" "https://outlook.office.com/owa/?realm=school.lu&exsvurl=1&ll-cc=1033&modurl=2&path=/group/physique_2b_lhce@365.education.lu/mail" &
                        ;;
                        e) echo "Going to eduMoodle."
                           "$browser" "$args" "https://ssl.education.lu/eduMoodle/course/view.php?id=598" &
                           #"https://ssl.education.lu/eduMoodle/course/view.php?id=599" &
                        ;;
                        w) echo "Going to WebUntis."
                           "$browser" "$args" "https://ssl.education.lu/WebUntis/index.do#main" &
                        ;;
                        x) echo "Going to lmrl site."
                           "$browser" "$args" "https://www.lmrl.lu/apprentissages/branches/" &
                        ;;
                        h)
                                echo -e "Usage:  $(basename $0) \e[4moptions\e[0m...\n"
                                echo "Open a new firefox window which goes to the chosen sites"
                                echo "Options are as follows:"
                                printf "  -%c\t%s\n"  e "goes directly eduMoodle"
                                printf "  -%c\t%s\n"  m "goes directly to the mail section of office365"
                                printf "  -1h\t%s\n"    "Get info about -1. Goes directly to OneDrive."
                                printf "  -%c\t%s\n"  g "goes directly to the GroupMail in office365"
                                printf "  -%c\t%s\n"  w "goes directly to WebUntis"
                                printf "  -%c\t%s\n"  x "goes directly to lmrl site (examen)"
                                printf "  -%c\t%s\n"  h "display help about the diffrent options"
                        ;;
                        ?) echo "Wrong option. Use -h." ;;
                esac
        done
fi
