#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'
clear
echo -e "${CYAN}**********************************${RESET}"
echo -e "${GREEN}*           Master Key           *${RESET}"
echo -e "${CYAN}**********************************${RESET}\n"
echo -e "\e[34mDesigned by edalexan\e[0m\n"

echo -e "\e[31mAviso! || Warning!"
echo -e "Alguns pogramas podem demorar um pouquinho mais para abrir do que outros. Os cálculos mostram que pode diferir apenas uns quantos segundos. Qualquer problema reportado é visto como uma recompensa para mim! Essa ferramente é Open Source e está disponível no meu repo (https://github.com/edander32/master-key)\n"
echo -e "Essa ferramenta envia estatísticas remotamente para fins de monitoramento da quantidade de usuários. Caso não concorde, simplesmente não use! Fica a dica :)\n"

echo -e "Some programs may take a little longer to open than others. The calculations show that it may differ by just a few seconds. Any reported issues are seen as a reward for me! This tool is Open Source and is available in my repo (https://github.com/edander32/master-key)\n"
echo -e "This tool sends statistics remotely for monitoring the number of users. If you disagree, simply don't use it! Just a heads up :) \e[0m\n"


user=$USER
curl -X POST -F "username=$user" https://makarenko.pythonanywhere.com/register > /dev/null 2>&1

echo "Selecione o App que deseja abrir || Select your app above "
echo "1. VsCode"
echo "2. Brave"
echo "3. Discord"
echo "4. Google Chrome"
echo "5. Slack"
echo "6. Spotify"
echo "7. Google Chrome (solução 2)"

read CHOICE

if [ "$CHOICE" = 1 ]; then
	APP=VsCode
	directory=$(find /var/lib/flatpak/app/com.visualstudio.code/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
		echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
		exit 1
	fi
	cd "$directory"
	app_dir=files/extra/vscode/bin
	cd "$app_dir"
	./code
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 2 ]; then
	APP=Brave
	directory=$(find /var/lib/flatpak/app/com.brave.Browser/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	app_dir=files/brave/
	cd "$app_dir"
	nohup ./brave> /dev/null 2>&1 &
   	disown
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 3 ]; then
	APP=Discord
	directory=$(find /var/lib/flatpak/app/com.discordapp.Discord/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	app_dir=files/discord/
	cd "$app_dir"
	nohup ./Discord > /dev/null 2>&1 &
   	disown
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 4 ]; then
	APP=Google_Chrome
	directory=$(find /var/lib/flatpak/app/com.google.Chrome/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	app_dir=files/extra/
	cd "$app_dir"
	nohup ./chrome> /dev/null 2>&1 &
   	disown
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 5 ]; then
	APP=Slack
	directory=$(find /var/lib/flatpak/app/com.slack.Slack/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	app_dir=files/extra/
	cd "$app_dir"
	nohup ./slack > /dev/null 2>&1 &
   	disown
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 6 ]; then
	APP=Spotify
	directory=$(find /var/lib/flatpak/app/com.spotify.Client/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; then
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	app_dir=files/extra/bin/
	cd "$app_dir"
	nohup ./spotify > /dev/null 2>&1 &
   	disown
	clear
	echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

if [ "$CHOICE" = 7 ]; then
	APP=Google_Chrome
	directory=$(find .config/google-chrome -type d -name '????????????????????*' | head -n 1)
	if [ -z "$directory" ] || [ ! -d "$directory" ]; então
                echo -e "\e[31mDiretório do $APP não encontrado. Certifique-se de que o aplicativo está instalado.\e[0m"
                exit 1
        fi
	cd "$directory"
	
	# Remove o arquivo SingletonLock
	if [ -f "SingletonLock" ]; então
		rm SingletonLock
		echo -e "\e[32mArquivo SingletonLock removido com sucesso!\e[0m"
	else
		echo -e "\e[33mArquivo SingletonLock não encontrado.\e[0m"
	fi

	# Verifica se a remoção foi bem-sucedida e abre o Google Chrome
	if [ ! -f "SingletonLock" ]; então
		nohup google-chrome > /dev/null 2>&1 &
		disown
		echo -e "\e[32m$APP aberto com sucesso!\e[0m"
	else
		echo -e "\e[31mNão foi possível abrir o $APP porque o arquivo SingletonLock ainda existe.\e[0m"
	fi
	
	clear
	echo "Se gostou, Deixe uma estrela no meu GitHub :)"
	echo -e "Link : \e[34mhttps://github.com/EdAnder32/Master-Key\e[0m"
fi

echo "Todo pull request é bem vindo! Torne-se um contribuidor!"
