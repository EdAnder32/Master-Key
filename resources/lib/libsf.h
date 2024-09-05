#ifndef LIBSF_H
# define LIBSF_H
//gcc -o plarte test4.c -I./libsf-s -L./libsf-s -lsf `pkg-config --cflags --libs gtk+-3.0`
# include <gtk/gtk.h>
# define f(o) G_CALLBACK(o)

#define loop(window) do { \
    gtk_widget_show_all(window); \
    gtk_main(); \
} while(0)

#define Application(argc, argv) do { \
    gtk_init(&argc, &argv); \
} while (0)

// Macros para eventos de mouse
# define BUTTON_PRESS_EVENT "button-press-event"
# define BUTTON_RELEASE_EVENT "button-release-event"
# define MOTION_NOTIFY_EVENT "motion-notify-event"


// Macros para eventos de teclado
# define KEY_PRESS_EVENT "key-press-event"
# define KEY_RELEASE_EVENT "key-release-event"
# define CLICK "clicked"

// Macros para outros eventos
# define ENTER_NOTIFY_EVENT "enter-notify-event"
# define LEAVE_NOTIFY_EVENT "leave-notify-event"
# define SCROLL_EVENT "scroll-event"
# define WINDOW_STATE_EVENT "window-state-event"

// Definições dos códigos para as setas direcionais compatíveis com
#define UP_ARROW       GDK_KEY_Up       // Up Arrow
#define DOWN_ARROW     GDK_KEY_Down     // Down Arrow
#define LEFT_ARROW     GDK_KEY_Left     // Left Arrow
#define RIGHT_ARROW    GDK_KEY_Right    // Right Arrow

#define SETA_CIMA      GDK_KEY_Up
#define SETA_BAIXO     GDK_KEY_Down
#define SETA_ESQUERDA  GDK_KEY_Left
#define SETA_DIREITA   GDK_KEY_Right

// Códigos de eventos de teclado
#define TECLA_ENTER      GDK_KEY_Return     // Enter Key
#define TECLA_ESC        GDK_KEY_Escape     // Escape Key
#define TECLA_TAB        GDK_KEY_Tab        // Tab Key
#define TECLA_BACKSPACE  GDK_KEY_BackSpace  // Backspace Key
#define TECLA_DELETE     GDK_KEY_Delete     // Delete Key
#define TECLA_HOME       GDK_KEY_Home       // Home Key
#define TECLA_END        GDK_KEY_End        // End Key
#define TECLA_PAGEUP     GDK_KEY_Prior      // Page Up Key
#define TECLA_PAGEDOWN   GDK_KEY_Next       // Page Down Key

// Códigos de eventos de mouse
#define MOUSE_LEFT_CLICK   GDK_BUTTON_PRIMARY   // Left Mouse Button
#define MOUSE_RIGHT_CLICK  GDK_BUTTON_SECONDARY // Right Mouse Button
#define MOUSE_MIDDLE_CLICK GDK_BUTTON_MIDDLE    // Middle Mouse Button
#define MOUSE_SCROLL_UP    GDK_SCROLL_UP        // Scroll Up
#define MOUSE_SCROLL_DOWN  GDK_SCROLL_DOWN      // Scroll Down

// Estados da janela
#define JANELA_MINIMIZADA  GDK_WINDOW_STATE_ICONIFIED  // Minimized Window
#define JANELA_MAXIMIZADA  GDK_WINDOW_STATE_MAXIMIZED  // Maximized Window
#define JANELA_NORMAL      GDK_WINDOW_STATE_NORMAL     // Normal Window

// Modificadores de teclado
#define MOD_CTRL   GDK_CONTROL_MASK  // Ctrl Key
#define MOD_SHIFT  GDK_SHIFT_MASK    // Shift Key
#define MOD_ALT    GDK_MOD1_MASK     // Alt Key

// Funções comuns
#define FUNCAO_ABRIR  gtk_file_chooser_dialog_new   // Open File Dialog
#define FUNCAO_SALVAR gtk_file_chooser_dialog_new   // Save File Dialog
#define FUNCAO_MENSAGEM gtk_message_dialog_new      // Message Dialog
#define FUNCAO_NOTIFICACAO gtk_notification_new      // Notification


# define GWK GtkWidget
# define Tool GtkWidget
# define Panel GtkWidget
# define Window GtkWidget
# define Button GtkWidget
# define Label GtkWidget
# define Image GtkWidget
# define Textbox GtkWidget
# define String char*
# define Text GtkWidget
# define Type GtkWidget
# define EventKey GdkEventKey
# define Pointer gpointer
# define Style const char


// Estruturas de dados
typedef struct s_root
{
	Tool *window;
	Tool *fixed;
	Tool *item;
	int		x;
	int		y;
	int		th;
}		t_root;

typedef struct
{
	void (*key_handler)(GdkEventKey *event, gpointer user_data);
	gpointer user_data;
}	t_key_event_data;

typedef struct
{
	void (*mouse_handler)(GdkEventButton *event, gpointer user_data);
	gpointer user_data;
}	t_mouse_event_data;

typedef struct
{
	void (*loop_handler)(gpointer user_data);
	gpointer user_data;
}	t_loop_event_data;

Tool *add_fixed_layout_to_window(Tool *window);
Tool *create_context_menu(Tool *widget, GCallback callback, gpointer data);
Tool *create_window(const char *title, int width, int height);
Tool *add_button(Tool *container, const char *label, int x, int y, GCallback callback);
Tool *add_label(Tool *container, const char *text, int x, int y);
Tool *add_entry(Tool *container, int x, int y, GCallback callback);
Tool *add_color_chooser(Tool *container, int x, int y, GCallback callback);
Tool *add_drawing_area(Tool *container, int x, int y, int width, int height, GCallback draw_callback);
Tool *add_file_chooser(Tool *container, int x, int y, GCallback callback);
Tool *add_image(Tool *container, const char *file_path, int x, int y);
Tool *add_separator(Tool *container, int x, int y, gboolean horizontal);
void add_tabs(Tool *notebook, Tool **pages, const char **titles, int count);
Tool *add_volume_slider(Tool *container, int x, int y, GCallback callback);
Tool *add_checkbox(Tool *container, const char *label, int x, int y, GCallback callback);
Tool *add_radio_button(Tool *container, Tool *group, const char *label, int x, int y);
Tool *add_combo_box(Tool *container, int x, int y, gchar **items, int item_count, GCallback callback);
Tool *add_calendar(Tool *container, int x, int y, GCallback callback);
Tool *add_status_bar(Tool *container, int x, int y);
Tool *add_context_menu(Tool *widget, Tool *menu);
Tool *add_toolbar_with_buttons(Tool *container, const char **button_labels, int count);
Tool *add_spinner(Tool *container, int x, int y);
Tool *add_text_view(Tool *container, int x, int y, int width, int height);

Image *create_image_with_position(Panel *container, const char *file_path, int x, int y, int width, int height);
Tool *create_scale_with_position(Tool *container, int x, int y, int min, int max, int step);
Tool *create_checkbox_with_position(Tool *container, const char *label, int x, int y, gboolean active);
Tool *create_drawing_area_with_position(Tool *container, int x, int y, int width, int height, gboolean (*draw_callback)(Tool *, cairo_t *, gpointer), gpointer data);
Label *create_label_with_position(Panel *container, const char *text, int x, int y, const GdkRGBA *color);
Button *create_button_with_position(Panel *container, const char *label, int x, int y, void (*callback)(Tool *, gpointer), gpointer data);

Tool *create_check_button(const char *label, gboolean initial_state);
Tool *create_progress_bar(double initial_fraction);
Tool *create_spin_button(double min, double max, double step, double initial_value);
Tool *create_combo_box(const char **items, int num_items, int default_index);
Tool *create_image_ph(Tool *container, const char *file_path, gint x, gint y, gint width, gint height);
Tool *create_vbox(gboolean homogeneous, gint spacing);
Tool *create_hbox(gboolean homogeneous, gint spacing);
Tool *create_grid(gint row_spacing, gint column_spacing);
Tool *create_fixed_layout(void);
Tool *create_entry1(GtkFixed *fixed, gint x, gint y, const char *border_color, void (*callback)(GtkEntry *, gpointer));
Tool *create_label(Tool *container, const char *text);
Tool *create_text_view(Tool *container);
Tool	*create_text_view(Tool *container);

void loop_window(Tool *window);
void add_event(Tool *widget, const char *event_name, GCallback callback);
void add_to_fixed(GtkFixed *fixed, Tool *widget, gint x, gint y);
void add_to_grid(GtkGrid *grid, Tool *widget, guint left, guint top, guint width, guint height);
Tool *new_window(const char *title, int width, int height);
void apply_css(Tool *widget, const char *css);
void set_button_color(Tool *button, const char *color);
void set_label_color(Tool *label, const char *color);
void set_entry_border_color(Tool *entry, const char *color);
void create_image(GtkFixed *fixed, const char *file_path, gint x, gint y);
void create_entry(GtkFixed *fixed, gint x, gint y);
void create_text(GtkFixed *fixed, const char *text, gint x, gint y);
void create_button(GtkFixed *fixed, const char *label, gint x, gint y, void (*callback)(Tool *, gpointer), gpointer user_data);
void show_notification(Tool *parent, const char *title, const char *message);
void set_mouse_event_handler(Tool *widget, void (*handler)(GdkEventButton *, gpointer), gpointer user_data);
void set_key_event_handler(Tool *widget, void (*handler)(GdkEventKey *, gpointer), gpointer user_data);
void set_loop_event_handler(guint interval, void (*handler)(gpointer), gpointer user_data);
Tool *create_image_c(Tool *container, const char *file_path);
Tool *create_calendar(Tool *container);
Tool *create_file_chooser_button(Tool *container, const char *title,
                                      GtkFileChooserAction action, GCallback callback, gpointer data);
Tool *create_color_chooser(Tool *container, GCallback callback, gpointer data);
Tool *create_notebook(Tool *container);
void add_tab_to_notebook(Tool *notebook, const char *label, Tool *content);
Tool *create_media_viewer(Tool *container);
void set_status_bar_message(Tool *status_bar, const char *message);
Tool *create_toolbar(Tool *container);
GtkToolItem *create_toolbar_button(Tool *toolbar, const char *icon_name, const char *tooltip, GCallback callback, gpointer data);
Tool *add_widget_at_position(Tool *fixed_container, Tool *widget, int x, int y);
void reposition_widget_in_grid(GtkGrid *grid, Tool *widget, int left, int top);
Tool *create_color_chooser_with_position(Tool *container, int x, int y, int width, int height, GdkRGBA *color);
void color_activated(GtkColorChooser *chooser, gpointer user_data);

void hook(Tool *widget, const gchar *event_name, GCallback callback, gpointer user_data);

#endif // LIBSF_H

