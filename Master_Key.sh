
echo "\e[32mMaster Key\e[0m"
echo "Designed by edalexan"
echo "Abrir: "
echo "1. VsCode"

read CHOICE

if [ "$CHOICE" = 1 ]; then
	APP=VsCode
	directory=$(find /var/lib/flatpak/app/com.visualstudio.code/x86_64/stable -type d -name '????????????????????*' | head -n 1)
	cd "$directory"
	app_dir=files/extra/vscode/bin
	cd "$app_dir"
	./code
fi
