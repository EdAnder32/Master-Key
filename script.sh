#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

user=$USER
curl -X POST -F "username=$user" https://makarenko.pythonanywhere.com/register > /dev/null 2>&1

program=$1

if [ -z "$program" ]; then
    echo -e "${RED}Por favor, forneça o nome do programa como parâmetro.${RESET}"
    echo -e "Exemplo: ./script.sh vs_code"
    exit 1
fi

case "$program" in
    vs_code|vscode)
        APP="VsCode"
        directory=$(find /var/lib/flatpak/app/com.visualstudio.code/x86_64/stable -type d -name '????????????????????*' | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory/files/extra/vscode/bin"
        ./code
        echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        ;;
    brave)
        APP="Brave"
        directory=$(find /var/lib/flatpak/app/com.brave.Browser/x86_64/stable -type d -name '????????????????????*' | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory/files/brave/"
        nohup ./brave > /dev/null 2>&1 &
        disown
        echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        ;;
    discord)
        APP="Discord"
        directory=$(find /var/lib/flatpak/app/com.discordapp.Discord/x86_64/stable -type d -name '????????????????????*' | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory/files/discord/"
        nohup ./Discord > /dev/null 2>&1 &
        disown
        echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        ;;
    google_chrome|chrome)
        APP="Google_Chrome"
        directory=~/.config/google-chrome
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory"
	rm SingletonLock
        if [ ! -f "SingletonLock" ]; then
            directory=$(find /var/lib/flatpak/app/com.google.Chrome/x86_64/stable -type d -name '????????????????????*' | head -n 1)
            if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
                exit 1
            fi
            cd "$directory/files/extra/"
            nohup ./chrome > /dev/null 2>&1 &
            disown
            echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        else
            echo -e "${RED}Não foi possível abrir o $APP porque o arquivo SingletonLock ainda existe.${RESET}"
        fi
        ;;
    slack)
        APP="Slack"
        directory=$(find /var/lib/flatpak/app/com.slack.Slack/x86_64/stable -type d -name '????????????????????*' | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory/files/extra/"
        nohup ./slack > /dev/null 2>&1 &
        disown
        echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        ;;
    spotify)
        APP="Spotify"
        directory=$(find /var/lib/flatpak/app/com.spotify.Client/x86_64/stable -type d -name '????????????????????*' | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "${RED}Diretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.${RESET}"
            exit 1
        fi
        cd "$directory/files/extra/bin/"
        nohup ./spotify > /dev/null 2>&1 &
        disown
        echo -e "${GREEN}$APP aberto com sucesso!${RESET}"
        ;;
       all)
       #gkomba updated this config
        APP="all"
        echo "" >> ~/.zshrc
        echo "alias vscode=\"/nfs/homes/$USER/Master-Key/script.sh vscode\"" >> ~/.zshrc
        echo "alias brave=\"/nfs/homes/$USER/Master-Key/script.sh brave\"" >> ~/.zshrc
	echo "alias discord=\"/nfs/homes/$USER/Master-Key/script.sh discord\"" >> ~/.zshrc
	echo "alias chrome=\"/nfs/homes/$USER/Master-Key/script.sh google_chrome\"" >> ~/.zshrc
	echo "alias slack=\"/nfs/homes/$USER/Master-Key/script.sh slack\"" >> ~/.zshrc
	echo "alias spotify=\"/nfs/homes/$USER/Master-Key/script.sh spotify\"" >> ~/.zshrc
	source ~/.zshrc
        echo "SUCCESS!"
        echo "Now All the apps are available to open in every part of your computer"
        echo "Thanks!"
        ;;
    *)
        echo -e "${RED}Programa não reconhecido. Por favor, forneça um nome de programa válido.${RESET}"
        echo -e "Programas disponíveis: vs_code, brave, discord, google_chrome, slack, spotify"
        exit 1
        ;;
esac

echo "Todo pull request é bem vindo! Torne-se um contribuidor!"
