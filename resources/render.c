#include "includes/application.h"

void ft_render_objects(Window  *window)
{
	Panel		*fixed = add_fixed_layout_to_window(window);

	Label		*label1 = create_label_with_position(fixed, "M A S T E R  K E Y", 30, 30, NULL);
	Label		*label2 = create_label_with_position(fixed, "M A S T E R  K E Y - lista de aplicativos", 30, 100, NULL);

	Image		*image1 = create_image_with_position(fixed, "./assets/chrome.png", 45, 180, 80, 80);
	Image		*image2 = create_image_with_position(fixed, "./assets/firefox.png",170, 180, 80, 80);
	Image		*image3 = create_image_with_position(fixed, "./assets/spotify.png",300, 180, 80, 80);
	Image		*image4 = create_image_with_position(fixed, "./assets/slack.png", 430, 180, 80, 80);
	Image		*image5 = create_image_with_position(fixed, "./assets/vscode.png", 550, 180, 80, 80);

	Button		*button1 = create_button_with_position(fixed, "  chrome  ", 40, 270, on_button_click, "chrome");
	Button		*button2 = create_button_with_position(fixed, "  firefox  ", 165, 270, on_button_click, "firefox");
	Button		*button3 = create_button_with_position(fixed, "  spotify  ", 295, 270, on_button_click, "spotify");
	Button		*button4 = create_button_with_position(fixed, "  slack  ", 428, 270, on_button_click, "slack");
	Button		*button5 = create_button_with_position(fixed, "  vscode  ", 545, 270, on_button_click, "vscode");
	

	Style *label1_style = "label { color: green; font-size: 50px}";
	Style *label2_style = "label { color: white; font-size: 18px}";
	
	apply_css(label1, label1_style);
	apply_css(label2, label2_style);

}
