#!/bin/bash
#Master_Key_Pro
#An open source tool
#Designed and coded by edalexan
#13/Sep/24

#AN LITLE INTRO
echo "#Master_Key_Pro
#An open source tool
#Designed and coded by edalexan
#13/Sep/24

Repo -> https://github.com/EdAnder32/Master-Key


#How to execute? Como rodar o script?
#EN
# - Open the terminal in the folder where the script is located and type:
#     chmod +x Master_key_setup.sh && chmod +x files/Master_key_Pro.sh
# - Run the script with the command below:
#     ./Master_key_setup.sh

#PT
# - Abra o terminal na pasta onde se encontra o sript e digite:
#     chmod +x Master_key_setup.sh && chmod +x files/Master_key_Pro.sh
# - Rode o script com o comando abaixo:
#     ./Master_key_setup.sh

#EN
# What does the Master Key do?
# SYNOPSIS: In a universe where lost souls embark on a journey through the vast system of things, a group of warrior soldiers prepares to face a new and terrible enemy: the common core! Facing such an enemy requires the use of special weapons, the same weapons that will grant them unique abilities useful for a lifetime! However, for an unknown reason—an unforeseen event, something improbable, a bug, an unknown—they are unable to access these weapons. Until the emergence of a master key, the MASTER KEY, the one that will restore everything they lost. Will they make good use of it? We shall see...

# The Master Key is an open-source tool developed in shell by edalexan, designed to open and resolve bugs related to app launch crashes. Simply put, the Master Key creates copies of existing app shortcuts, modifies them with the correct paths to their binaries, and automates this process to run every time the user logs into their PC. Its backend is purely shell, while its front end is in shell too (a litle bit of zenity.

#PT
# O que faz o Master Key?
# SINOPSE: Num universo onde almas perdidas encontram-se em uma viagem pelo amplo sistema de coisas, um grupo de soldados guerreiros prepara-se para enfrentar um novo e terrível inimigo: o common core! Enfrentar tal inimigo requer o uso armas especiais, mesmas armas que os irão dar-lhes habilidades únicas que serão úteis pra a vida inteira! No entanto, por um motivo desconhecido, um imprevisto, algo improvável, um bug, um unknow, eles não conseguem ter acesso a tais armas. Até o surgimento de uma chave mestra, a MASTER KEY, aquela que lhes devolverá tudo o que eles perderam. Será que eles farão bom uso dela? Veremos...

# O Master Key é uma ferramenta desenvolvida em shell por edalexan, de código aberto destinada a abrir e resolver bugs de travamento na abertura de aplicativos. Em termos simples, a Master Key cria cópias dos atalhos existentes dos apps instalados, modifica eles com o caminho correto dos binários e automatiza esse processo pra ser feito sempre que o usuário fizer login no seu PC. Seu Backend é puramente Shell, seu front é em Shell também (um pouco de Zenity)

#FAQ - Frequentily Asked Questions | PFQ - Perguntas Frequentemente Questionadas

#EN
# 1. All my shortcuts disappeared. What should I do?
# A: The Master Key makes a copy of the shortcuts into a local folder (see below for a detailed explanation of how the Master Key works), and these modified shortcuts become the new ones. In this case, you can simply go to the directory where the shortcut copies are stored (~/.local/share/applications) and delete them. Repeat the same for the Master Key shortcut by going to its folder (~/.config/autostart) and deleting it. After that, log out and the shortcuts will reappear.

# 2. Does the Master Key modify my system?
# A: Yes, the Master Key modifies some settings on your system. Specifically, it changes the path of all shortcuts for apps installed via Flatpak and ensures that the script runs in the background whenever you log in.

# 3. Can I revert the changes made by the Master Key?
# A: Absolutely! To do so, follow the steps in question 1 and delete the copy created by the Master Key in ~/.local/bin.

# 4. I noticed that the Master Key collects my username. Why does it do that?
# A: For statistical purposes, the tool collects your username as soon as you run it. Knowing how many people are using the tool and the potential bugs they report helps optimize the tool to be as efficient as possible.

#PT
# 1. Todos os atalhos desapareceram. O que tenho que fazer?
# R: O Master Key faz uma cópia dos atalhos para uma pasta local (veja mais abaixo para entender como o Master Key funciona detalhadamente), e são estes atalhos modificados que passarão a ser os novos. Neste caso, voce poderá simplesmente ir ao directório onde as cópias dos atalhos estão (~/.local/share/applications) e deletar elas. Repita o mesmo para o atalho do Master Key indo a sua pasta (~/.config/autostart) e deletando ele. Depois é só dar logout e os atalhos irão aparecer.

# 2. O Master Key faz modificações no meu sistema?
# R: Sim, o Master Key modifica algumas definições do seu sistema. Detalhadamente, o Master Key altera o caminho de todos os atalhos dos apps instalados via flatpak e faz com que o script rode em segundo plano sempre que voce fizer login.

# 3. Posso reverter as alterações feitas pelo Master Key?
# R: Com certeza! Para isso siga os passos da pergunta 1 e apague a cópia criada pelo Master Key em ~/.local/bin.

# 4. Vi que o Master Key pega o meu username. Pra que isso?
# R: Por fins de estatísticas, a ferramenta recolhe o nome de usuário tão logo o mesmo o execute. Ter uma ideia de quantas pessoas estão usando e dos possíveis bugs que elas possam relatar ajuda a tornar a ferramenta o mais otimizado possível!" > /nfs/homes/$USER/Master_Key_Pro_Installer.txt


# 1. This place is reserved to extra functions!
remove_singleton(){
	#
	if [ "$1" -eq 1 ]; then
		cd ~/.config/BraveSoftware/Brave-Browser && rm SingletonLock 2> /dev/null
	fi
	if [ "$1" -eq 2 ]; then
		cd ~/.config/google-chrome && rm SingletonLock 2> /dev/null
	fi
	if [ "$1" -eq 3 ]; then
		cd ~/.config/opera && rm SingletonLock 2> /dev/null
	fi
}


# 2. Starting Graphic Interface
zenity --info --text="Bem vindo! Clique em Ok para arranjar os apps." --title="Master Key Pro"

# 3. Auto Updates for the new Master Key home!
cp $(pwd)/Master_key_Pro.sh ~/.local/bin


# 4. Exporting all files to '.local' directory
cp /var/lib/flatpak/exports/share/applications/* ~/.local/share/applications
echo "Movendo arquivos para .local"
sleep 0.5
echo "Apps Instalados"
ls ~/.local/share/applications | awk -F '.' '{print $2}'


# 5. Changing settings from files with a progress bar
(
	dir="$HOME/.local/share/applications/"
	total_files=$(ls "$dir"*.desktop | wc -l)
	current_file=0

	for file in "$dir"*.desktop; do
		current_file=$((current_file + 1))
		progress=$((current_file * 100 / total_files)) 
		app_name=$(basename "$file" .desktop)
        
		echo "$progress"
		echo "# Atualizando ($current_file de $total_files)..."

        directory=$(find /var/lib/flatpak/app/"$app_name"/x86_64/stable -type d -name '????????????????????*' 2> /dev/null | head -n 1)
        if [ -z "$directory" ] || [ ! -d "$directory" ]; then
            echo -e "\e[31mDiretório '$app_name' não encontrado. Pulando...\e[0m"
            sleep 0.5
            continue
        fi

        case "$app_name" in
            "com.brave.Browser")
                remove_singleton "1"
                app_dir="$directory/files/brave"
                exec_path="$app_dir/brave"
                ;;
            "com.discordapp.Discord")
                app_dir="$directory/files/discord"
                exec_path="$app_dir/Discord"
                ;;
            "com.google.Chrome")
                remove_singleton "2"
                app_dir="$directory/files/extra"
                exec_path="$app_dir/google-chrome.sh"
                ;;
            "com.opera.Opera")
                remove_singleton "3"
                app_dir="$directory/files/opera"
                exec_path="$app_dir/opera"
                ;;
            "com.slack.Slack")
                app_dir="$directory/files/extra"
                exec_path="$app_dir/slack"
                ;;
            "com.spotify.Client")
                app_dir="$directory/files/extra/bin"
                exec_path="$app_dir/spotify"
                ;;
            "com.sublimetext.three")
                app_dir="$directory/files/extra/sublime_text"
                exec_path="$app_dir/sublime_text"
                ;;
            "org.mozilla.firefox")
                app_dir="$directory/files/lib/firefox"
                exec_path="$app_dir/firefox"
                ;;
            "com.visualstudio.code")
                app_dir="$directory/files/extra/vscode/bin"
                exec_path="$app_dir/code"
                ;;
            *)
                echo -e "\e[33mApp $app_name não mapeado, pulando...\e[0m"
                continue
                ;;
        esac

        # 5.1 Updating changes on file
        sed -i "s|^Exec=.* |Exec=$exec_path |g" "$file"
        echo -e "\e[32mApp $app_name atualizado com sucesso!\e[0m"
    done
) | zenity --progress --title="Master Key Pro" --text="Aguarde, atualizando apps..." --percentage=0 --auto-close

if [ $? != 0 ]; then
    zenity --error --text="A atualização dos apps falhou!"
    exit 1
fi



# 6. Preparing autostarting for Master Key
cd ~/.config/autostart
if [ ! -f "Master_key_Pro.sh" ]; then
	echo -e "[Desktop Entry]\nType=Application\nExec=/nfs/homes/$USER/.local/bin/Master_key_Pro.sh\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName=Master Key Pro\nComment=Iniciar o script de inicialização no login" > Master_key_Pro.desktop
fi

# 7. Finish operation and sending back positive sign
echo -e "\e[32mTODOS OS APPS FORAM ATUALIZADOS!\e[0m"
user=$USER
curl -X POST -F "username=$user" https://makarenko.pythonanywhere.com/register > /dev/null 2>&1

# 8. Closing Graphic Dialogue
zenity --info --text="Pronto! Seus apps já devem estar funcionando" --title="Master Key Pro"
zenity --question --text="Considere me seguir ou deixar uma estrela no meu GitHub🙂" --title="Master Key Pro"
if [ $? = 0 ]; then
	xdg-open https://www.github.com/edander32 2> /dev/null
fi
xdg-open /nfs/homes/$USER/Master_Key_Pro_Installer.txt
