#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 input.txt output.c"
    exit 1
fi

input_file="$1"
output_file="$2"

cat <<EOF > "$output_file"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

const char *shell_script =
EOF

awk 'BEGIN {printf "\""} {gsub(/"/, "\\\""); printf "%s\\n", $0} END {printf "\";"}' "$input_file" >> "$output_file"

cat <<EOF >> "$output_file"

void	execute_shell_script()
{
	FILE *file = fopen("/tmp/aptm_script.sh", "w");
	if (!file)
	{
		perror("Erro ao criar o arquivo temporário");
		exit(1);
	}
	fprintf(file, "%s", shell_script);
	fclose(file);

	if (chmod("/tmp/aptm_script.sh", 0755) != 0) {
		perror("Erro ao definir permissões do arquivo temporário");
		exit(1);
	}

	printf("Executando o script...\n");
	if (system("/tmp/aptm_script.sh") != 0)
		printf("Erro ao executar o script.\n");
	if (remove("/tmp/aptm_script.sh") != 0)
		perror("Erro ao remover o arquivo temporário");
}

int	main(int argc, char *argv[])
{
	execute_shell_script();
	return 0;
}
EOF
echo "Arquivo $output_file criado com sucesso."
