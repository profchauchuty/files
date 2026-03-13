#!/bin/bash

DESKTOP="$HOME/Desktop"

create_shortcut () {

NAME=$1
URL=$2

cat <<EOF > "$DESKTOP/$NAME.desktop"
[Desktop Entry]
Version=1.0
Name=$NAME
Exec=xdg-open $URL
Icon=web-browser
Terminal=false
Type=Application
Categories=Network;
EOF

chmod +x "$DESKTOP/$NAME.desktop"

}

create_shortcut "Khan Academy" "https://www.khanacademy.org"
create_shortcut "Redação Paraná" "https://redacao.pr.gov.br"
create_shortcut "Leia Paraná" "https://leiaparana.pr.gov.br"
create_shortcut "Alura" "https://www.alura.com.br"
create_shortcut "GitHub" "https://github.com"
create_shortcut "Canva" "https://www.canva.com"
create_shortcut "Prezi" "https://prezi.com"

create_shortcut "Inglês Paraná" "https://www.educacao.pr.gov.br"
create_shortcut "Inglês Paraná Teens" "https://www.educacao.pr.gov.br"
create_shortcut "Inglês Paraná High" "https://www.educacao.pr.gov.br"

create_shortcut "Matific" "https://www.matific.com"
create_shortcut "Google Classroom" "https://classroom.google.com"
create_shortcut "Wayground" "https://wayground.com"

create_shortcut "p5.js Editor" "https://editor.p5js.org"
create_shortcut "Google Colab" "https://colab.research.google.com"
create_shortcut "Quizzes" "https://quizizz.com"

echo "Atalhos criados na área de trabalho!"
