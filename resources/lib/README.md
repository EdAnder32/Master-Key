

#██      ██ ██████  ███████ ███████ 
#██      ██ ██   ██ ██      ██      
#██      ██ ██████  ███████ █████   
#██      ██ ██   ██      ██ ██      
#███████ ██ ██████  ███████ ██  
                                                                               

# Manual da Biblioteca `libsf`

## Estruturas de Dados

### `t_root`
```c
typedef struct s_root {
    GtkWidget *window;
    GtkWidget *fixed;
    GtkWidget *item;
    int x;
    int y;
    int th;
} t_root;
```
Esta estrutura é usada para armazenar referências a widgets GTK e posições no layout fixo.

### `t_key_event_data`
```c
typedef struct {
    void (*key_handler)(GdkEventKey *event, gpointer user_data);
    gpointer user_data;
} t_key_event_data;
```
Estrutura para associar um manipulador de eventos de teclado e dados de usuário.

### `t_mouse_event_data`
```c
typedef struct {
    void (*mouse_handler)(GdkEventButton *event, gpointer user_data);
    gpointer user_data;
} t_mouse_event_data;
```
Estrutura para associar um manipulador de eventos de mouse e dados de usuário.

### `t_loop_event_data`
```c
typedef struct {
    void (*loop_handler)(gpointer user_data);
    gpointer user_data;
} t_loop_event_data;
```
Estrutura para associar um manipulador de eventos de loop e dados de usuário.

## Funções

### Criação de Janelas e Layouts

- **`GtkWidget *create_window_s(const char *title, int width, int height);`**
  - Cria uma janela com o título especificado e dimensões dadas.

- **`GtkWidget *add_fixed_layout_to_window(GtkWidget *window);`**
  - Adiciona um layout fixo à janela especificada.

### Adicionando Widgets

- **`GtkWidget *add_button(GtkWidget *container, const char *label, int x, int y, GCallback callback);`**
  - Adiciona um botão ao contêiner especificado na posição `(x, y)` com um rótulo e um callback.

- **`GtkWidget *add_label(GtkWidget *container, const char *text, int x, int y);`**
  - Adiciona um rótulo ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_entry(GtkWidget *container, int x, int y, GCallback callback);`**
  - Adiciona uma caixa de entrada no contêiner na posição `(x, y)` com um callback.

- **`GtkWidget *add_color_chooser(GtkWidget *container, int x, int y, GCallback callback);`**
  - Adiciona um seletor de cores ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_drawing_area(GtkWidget *container, int x, int y, int width, int height, GCallback draw_callback);`**
  - Adiciona uma área de desenho ao contêiner na posição e dimensões especificadas.

- **`GtkWidget *add_file_chooser(GtkWidget *container, int x, int y, GCallback callback);`**
  - Adiciona um seletor de arquivos ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_image(GtkWidget *container, const char *file_path, int x, int y);`**
  - Adiciona uma imagem ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_separator(GtkWidget *container, int x, int y, gboolean horizontal);`**
  - Adiciona um separador (horizontal ou vertical) ao contêiner.

- **`void add_tabs(GtkWidget *notebook, GtkWidget **pages, const char **titles, int count);`**
  - Adiciona várias abas ao notebook, com páginas e títulos especificados.

- **`GtkWidget *add_volume_slider(GtkWidget *container, int x, int y, GCallback callback);`**
  - Adiciona um controle deslizante de volume ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_checkbox(GtkWidget *container, const char *label, int x, int y, GCallback callback);`**
  - Adiciona uma caixa de seleção ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_radio_button(GtkWidget *container, GtkWidget *group, const char *label, int x, int y);`**
  - Adiciona um botão de rádio ao grupo especificado, posicionado no contêiner.

- **`GtkWidget *add_combo_box(GtkWidget *container, int x, int y, gchar **items, int item_count, GCallback callback);`**
  - Adiciona uma caixa de combinação ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_calendar(GtkWidget *container, int x, int y, GCallback callback);`**
  - Adiciona um calendário ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_status_bar(GtkWidget *container, int x, int y);`**
  - Adiciona uma barra de status ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_context_menu(GtkWidget *widget, GtkWidget *menu);`**
  - Adiciona um menu de contexto a um widget.

- **`GtkWidget *add_toolbar_with_buttons(GtkWidget *container, const char **button_labels, int count);`**
  - Adiciona uma barra de ferramentas com botões especificados.

- **`GtkWidget *add_spinner(GtkWidget *container, int x, int y);`**
  - Adiciona um spinner ao contêiner na posição `(x, y)`.

- **`GtkWidget *add_text_view(GtkWidget *container, int x, int y, int width, int height);`**
  - Adiciona uma área de texto ao contêiner com dimensões especificadas.

### Criação de Widgets com Posição

- **`GtkWidget *create_image_with_position(GtkWidget *container, const char *file_path, int x, int y, int width, int height);`**
  - Cria uma imagem com posição e dimensões especificadas.

- **`GtkWidget *create_scale_with_position(GtkWidget *container, int x, int y, int min, int max, int step);`**
  - Cria um controle deslizante com valores mínimos, máximos e passo especificados.

- **`GtkWidget *create_checkbox_with_position(GtkWidget *container, const char *label, int x, int y, gboolean active);`**
  - Cria uma caixa de seleção com um estado inicial especificado.

- **`GtkWidget *create_drawing_area_with_position(GtkWidget *container, int x, int y, int width, int height, gboolean (*draw_callback)(GtkWidget *, cairo_t *, gpointer), gpointer data);`**
  - Cria uma área de desenho com callback de desenho especificado.

- **`GtkWidget *create_label_with_position(GtkWidget *container, const char *text, int x, int y, const GdkRGBA *color);`**
  - Cria um rótulo com cor e posição especificadas.

- **`GtkWidget *create_button_with_position(GtkWidget *container, const char *label, int x, int y, void (*callback)(GtkWidget *, gpointer), gpointer data);`**
  - Cria um botão com posição e callback especificados.

### Criação de Widgets

- **`GtkWidget *create_check_button(const char *label, gboolean initial_state);`**
  - Cria um botão de verificação com um estado inicial.

- **`GtkWidget *create_progress_bar(double initial_fraction);`**
  - Cria uma barra de progresso com uma fração inicial.

- **`GtkWidget *create_spin_button(double min, double max, double step, double initial_value);`**
  - Cria um botão giratório com valores mínimo, máximo e passo especificados.

- **`GtkWidget *create_combo_box(const char **items, int num_items, int default_index);`**
  - Cria uma caixa de combinação com itens especificados e um índice padrão.

- **`GtkWidget *create_image_ph(GtkWidget *container, const char *file_path, gint x, gint y, gint width, gint height);`**
  - Cria uma imagem com caminho de arquivo, posição e dimensões especificados.

- **`GtkWidget *create_vbox(gboolean homogeneous, gint spacing);`**
  - Cria uma caixa vertical com espaçamento especificado.

- **`GtkWidget *create_hbox(gboolean homogeneous, gint spacing);`**
  - Cria uma caixa horizontal com espaçamento especificado.

- **`GtkWidget *create_grid(gint row_spacing, gint column_spacing);`**
  - Cria uma grade com espaçamento entre linhas e colunas.

- **`GtkWidget *create_fixed_layout(void);`**
  - Cria um layout fixo.

- **`GtkWidget *create_entry1(GtkFixed *fixed, gint x, gint y, const char *border_color, void (*callback)(GtkEntry *, gpointer));`**
  - Cria uma entrada com cor da borda especificada.

- **`GtkWidget *create_label(GtkWidget *container, const char *text);`**
  - Cria um rótulo com texto especificado.

- **`GtkWidget *create_text_view(GtkWidget *container);`**
  - Cria uma área de texto.

### Manipulação de Eventos

-

 **`void loop_window(GtkWidget *window);`**
  - Inicia o loop principal para a janela.

- **`void add_event(GtkWidget *widget, const char *event_name, GCallback callback);`**
  - Adiciona um evento a um widget com um callback.

- **`void add_to_fixed(GtkFixed *fixed, GtkWidget *widget, gint x, gint y);`**
  - Adiciona um widget a um layout fixo na posição especificada.

- **`void add_to_grid(GtkGrid *grid, GtkWidget *widget, guint left, guint top, guint width, guint height);`**
  - Adiciona um widget a uma grade na posição e dimensões especificadas.

- **`GtkWidget *new_window(const char *title, int width, int height);`**
  - Cria uma nova janela com título e dimensões especificadas.

- **`void apply_css(GtkWidget *widget, const char *css);`**
  - Aplica um estilo CSS a um widget.

- **`void set_button_color(GtkWidget *button, const char *color);`**
  - Define a cor de um botão.

- **`void set_label_color(GtkWidget *label, const char *color);`**
  - Define a cor de um rótulo.

- **`void set_entry_border_color(GtkWidget *entry, const char *color);`**
  - Define a cor da borda de uma entrada.

- **`void create_image(GtkFixed *fixed, const char *file_path, gint x, gint y);`**
  - Cria uma imagem em um layout fixo.

- **`void create_entry(GtkFixed *fixed, gint x, gint y);`**
  - Cria uma entrada em um layout fixo.

- **`void create_text(GtkFixed *fixed, const char *text, gint x, gint y);`**
  - Cria um texto em um layout fixo.

- **`void create_button(GtkFixed *fixed, const char *label, gint x, gint y, void (*callback)(GtkWidget *, gpointer), gpointer user_data);`**
  - Cria um botão em um layout fixo com callback.

- **`void show_notification(GtkWidget *parent, const char *title, const char *message);`**
  - Exibe uma notificação com título e mensagem.

- **`void set_mouse_event_handler(GtkWidget *widget, void (*handler)(GdkEventButton *, gpointer), gpointer user_data);`**
  - Define o manipulador de eventos de mouse para um widget.

- **`void set_key_event_handler(GtkWidget *widget, void (*handler)(GdkEventKey *, gpointer), gpointer user_data);`**
  - Define o manipulador de eventos de teclado para um widget.

- **`void set_loop_event_handler(guint interval, void (*handler)(gpointer), gpointer user_data);`**
  - Define um manipulador de eventos de loop com intervalo especificado.

### Criação de Menus e Outros

- **`GtkWidget *create_image_c(GtkWidget *container, const char *file_path);`**
  - Cria uma imagem em um contêiner.

- **`GtkWidget *create_calendar(GtkWidget *container);`**
  - Cria um calendário em um contêiner.

- **`GtkWidget *create_file_chooser_button(GtkWidget *container, const char *title, GtkFileChooserAction action, GCallback callback, gpointer data);`**
  - Cria um botão de seletor de arquivos.

- **`GtkWidget *create_color_chooser(GtkWidget *container, GCallback callback, gpointer data);`**
  - Cria um seletor de cores em um contêiner.

- **`GtkWidget *create_notebook(GtkWidget *container);`**
  - Cria um notebook em um contêiner.

- **`void add_tab_to_notebook(GtkWidget *notebook, const char *label, GtkWidget *content);`**
  - Adiciona uma aba ao notebook com rótulo e conteúdo.

- **`GtkWidget *create_media_viewer(GtkWidget *container);`**
  - Cria um visualizador de mídia em um contêiner.

- **`void set_status_bar_message(GtkWidget *status_bar, const char *message);`**
  - Define a mensagem da barra de status.

- **`GtkWidget *create_toolbar(GtkWidget *container);`**
  - Cria uma barra de ferramentas em um contêiner.

- **`GtkToolItem *create_toolbar_button(GtkWidget *toolbar, const char *icon_name, const char *tooltip, GCallback callback, gpointer data);`**
  - Cria um botão na barra de ferramentas com ícone e tooltip.

- **`GtkWidget *add_widget_at_position(GtkWidget *fixed_container, GtkWidget *widget, int x, int y);`**
  - Adiciona um widget ao contêiner fixo na posição especificada.

- **`void reposition_widget_in_grid(GtkGrid *grid, GtkWidget *widget, int left, int top);`**
  - Reposiciona um widget na grade.

- **`GtkWidget *create_color_chooser_with_position(GtkWidget *container, int x, int y, int width, int height, GdkRGBA *color);`**
  - Cria um seletor de cores com posição e dimensões especificadas.

- **`void color_activated(GtkColorChooser *chooser, gpointer user_data);`**
  - Função de callback para quando uma cor é selecionada no seletor de cores.

Espero que esse manual tenha ajudado a esclarecer o uso de cada função e estrutura no seu arquivo.

#	    _______  __ ________  _______  __    ____  _____
#	   / ____/ |/ // ____/  |/  / __ \/ /   / __ \/ ___/
#	  / __/  |   // __/ / /|_/ / /_/ / /   / / / /\__ \ 
#	 / /___ /   |/ /___/ /  / / ____/ /___/ /_/ /___/ / 
#	/_____//_/|_/_____/_/  /_/_/   /_____/\____//____/  
		                                           


##Exemplo de Manipulação de Eventos

#include "libsf.h"

// Função de callback para eventos de mouse
void on_mouse_click(GdkEventButton *event, gpointer user_data) {
    if (event->type == GDK_BUTTON_PRESS) {
        g_print("Botão do mouse clicado em (%f, %f)\n", event->x, event->y);
    }
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    GtkWidget *window = create_window_s("Evento de Mouse", 400, 300);
    GtkWidget *fixed = add_fixed_layout_to_window(window);
    
    GtkWidget *button = add_button(fixed, "Clique-me", 100, 100, NULL);

    // Configurando o manipulador de eventos de mouse
    set_mouse_event_handler(button, on_mouse_click, NULL);

    gtk_widget_show_all(window);
    loop_window(window);

    return 0;
}

##Evento de Teclado

#include "libsf.h"

// Função de callback para eventos de teclado
gboolean on_key_press(GtkWidget *widget, GdkEventKey *event, gpointer user_data)
{
	if (event->keyval == GDK_KEY_q)
	{
		g_print("Tecla 'q' pressionada! Saindo...\n");
		gtk_main_quit();
		return (TRUE);
	}
	else
		g_print("Tecla '%c' pressionada!\n", (char)event->keyval);
	return (FALSE);
}

int main(int argc, char *argv[])
{
	gtk_init(&argc, &argv);

	GtkWidget *window = create_window_s("Evento de Teclado", 400, 300);
	GtkWidget *fixed = add_fixed_layout_to_window(window);

	GtkWidget *label = add_label(fixed, "Pressione 'q' para sair", 100, 100);

	g_signal_connect(window, "key-press-event", G_CALLBACK(on_key_press), NULL);

	gtk_widget_show_all(window);
	gtk_main();
	return (0);
}

##Evento de Loop

#include "libsf.h"

// Função de callback para evento de loop
gboolean	on_loop(gpointer user_data)
{
	static int count = 0;
	g_print("Contagem do loop: %d\n", count++);
	return (TRUE);
}

int	main(int argc, char *argv[])
{
	gtk_init(&argc, &argv);

	GtkWidget *window = create_window_s("Evento de Loop", 400, 300);

	// Configurando o manipulador de eventos de loop
	g_timeout_add(1000, on_loop, NULL);  // Executa a cada 1000ms (1 segundo)

	gtk_widget_show_all(window);
	gtk_main();

	return (0);
}

# edittext
#include "libsf.h"

// Função de callback para alteração do texto da entrada
void on_text_entry_changed(GtkWidget *widget, gpointer user_data)
{
	const char *text = gtk_entry_get_text(GTK_ENTRY(widget));
	g_print("Texto alterado: %s\n", text);
}

int main(int argc, char *argv[])
{
	gtk_init(&argc, &argv);

	GtkWidget *window = create_window_s("Evento de Alteração de Texto", 400, 300);
	GtkWidget *fixed = add_fixed_layout_to_window(window);

	GtkWidget *entry = add_entry(fixed, 100, 100, G_CALLBACK(on_text_entry_changed));

	gtk_widget_show_all(window);
	gtk_main();
	return (0);
}

# button 
#include "libsf.h"

// Função de callback para um botão
void on_button_click(GtkWidget *widget, gpointer user_data)
{
	g_print("Botão clicado!\n");
}

int main(int argc, char *argv[])
{
	gtk_init(&argc, &argv);

	GtkWidget *window = create_window_s("Layout Fixo", 400, 300);
	GtkWidget *fixed = add_fixed_layout_to_window(window);

	GtkWidget *button1 = create_button_with_position(fixed, "Botão 1", 50, 50, on_button_click, NULL);
	GtkWidget *button2 = create_button_with_position(fixed, "Botão 2", 200, 50, on_button_click, NULL);
	GtkWidget *label = create_label_with_position(fixed, "Texto", 50, 150, NULL);

	gtk_widget_show_all(window);
	gtk_main();

	return 0;
}

#  seleção de cor
// Função de callback para seleção de cor
void on_color_activated(GtkColorChooser *chooser, gpointer user_data) {
    GdkRGBA color;
    gtk_color_chooser_get_rgba(chooser, &color);
    g_print("Cor selecionada: rgba(%f, %f, %f, %f)\n", color.red, color.green, color.blue, color.alpha);
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    GtkWidget *window = create_window_s("Evento de Seleção de Cor", 400, 300);
    GtkWidget *fixed = add_fixed_layout_to_window(window);

    GtkWidget *color_chooser = create_color_chooser(fixed, G_CALLBACK(on_color_activated), NULL);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}

#include "libsf.h"

// Função de callback para eventos de rolagem
gboolean on_scroll(GtkWidget *widget, GdkEventScroll *event, gpointer user_data) {
    if (event->direction == GDK_SCROLL_UP) {
        g_print("Rolagem para cima\n");
    } else if (event->direction == GDK_SCROLL_DOWN) {
        g_print("Rolagem para baixo\n");
    }
    return FALSE;
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    GtkWidget *window = create_window_s("Evento de Scroll", 400, 300);
    GtkWidget *fixed = add_fixed_layout_to_window(window);

    GtkWidget *label = add_label(fixed, "Use o scroll do mouse aqui", 50, 50);

    // Configurando o manipulador de eventos de rolagem
    g_signal_connect(window, "scroll-event", G_CALLBACK(on_scroll), NULL);
    gtk_widget_set_events(window, GDK_SCROLL_MASK);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}


#include "libsf.h"

// Função de callback para os botões da barra de ferramentas
void on_toolbar_button_clicked(GtkWidget *widget, gpointer user_data) {
    g_print("Botão da barra de ferramentas clicado\n");
}

int main(int argc, char *argv[]) {
    gtk_init(&argc, &argv);

    GtkWidget *window = create_window_s("Toolbar", 400, 300);
    GtkWidget *fixed = add_fixed_layout_to_window(window);

    GtkWidget *toolbar = create_toolbar(fixed);

    const char *button_labels[] = {"Botão 1", "Botão 2", "Botão 3"};
    for (int i = 0; i < 3; i++) {
        create_toolbar_button(toolbar, "icon_name", button_labels[i], G_CALLBACK(on_toolbar_button_clicked), NULL);
    }

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}



# compilar cc ou gcc
[gcc -o test test.c -I./libsf-s -L./libsf-s -lsf `pkg-config --cflags --libs gtk+-3.0`]
" -I./libsf-s -L./libsf-s -lsf `pkg-config --cflags --libs gtk+-3.0` "


# Contato

Se você tiver alguma dúvida ou precisar de assistência, sinta-se à vontade para entrar em contato comigo.

Email: [liedsonhabacuc@gmail.com](mailto:meuemail@example.com)

