#!/bin/bash

DESKTOP=$(xdg-user-dir DESKTOP)
ICON_DIR="$HOME/.local/share/icons/webapps"

mkdir -p "$ICON_DIR"

BROWSER="google-chrome"

create_shortcut () {

NAME="$1"
URL="$2"

# extrair domínio
DOMAIN=$(echo "$URL" | awk -F/ '{print $3}')

ICON_URL="https://www.google.com/s2/favicons?sz=128&domain=$DOMAIN"
ICON_FILE="$ICON_DIR/$(echo "$NAME" | tr ' ' '_' ).png"

# baixar ícone automaticamente
wget -q -O "$ICON_FILE" "$ICON_URL"

FILE="$DESKTOP/$NAME.desktop"

cat <<EOF > "$FILE"
[Desktop Entry]
Version=1.0
Name=$NAME
Exec=$BROWSER --app=$URL
Icon=$ICON_FILE
Terminal=false
Type=Application
Categories=Network;
EOF

chmod +x "$FILE"

}

create_shortcut "Khan Academy" "https://www.khanacademy.org"
create_shortcut "Redação Paraná" "https://redacao.pr.gov.br"
create_shortcut "Leia Paraná" "https://leiaparana.odilo.us"
create_shortcut "Alura" "https://www.alura.com.br"
create_shortcut "GitHub" "https://github.com"
create_shortcut "Canva" "https://www.canva.com"
create_shortcut "Prezi" "https://prezi.com"
create_shortcut "BR Modelo Web" "https://www.brmodeloweb.com/"

create_shortcut "Inglês Paraná Teens" "https://professor.escoladigital.pr.gov.br/ingles-parana-teens"
create_shortcut "Inglês Paraná High" "https://professor.escoladigital.pr.gov.br/ingles-parana-high"

create_shortcut "Matific" "https://www.matific.com"
create_shortcut "Google Classroom" "https://classroom.google.com"
create_shortcut "Wayground" "https://wayground.com"

create_shortcut "p5.js Editor" "https://editor.p5js.org"
create_shortcut "Google Colab" "https://colab.research.google.com"

echo "Atalhos criados com ícones automáticos!"
