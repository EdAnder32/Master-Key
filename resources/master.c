#include "includes/application.h"

void on_button_click(Tool *widget, Pointer ptr)
{
	const char *arg = (char *)ptr;

	// Caminho para o script Bash
    const char *script_path = "./script.sh";

    // Argumento a ser passado para o script
    const char *argument = arg;

    // Formata o comando para executar o script com o argumento
    char command[256];
    snprintf(command, sizeof(command), "%s %s", script_path, argument);

    // Executa o comando
    int return_value = system(command);

    // Verifica o valor retornado para saber se o comando foi bem-sucedido
    if (return_value == -1) {
        perror("Erro ao executar o script");
        return EXIT_FAILURE;
    } else {
        printf("Script executado com sucesso!\n");
    }
}