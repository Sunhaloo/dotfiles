#!/bin/bash

# make path variable for kitty directory and kitty configuration file
kitty_dir="$HOME/.config/kitty/"
kitty_conf="$HOME/.config/kitty/kitty.conf"

# function to display options to user
display_options() {
	printf "\nKitty Configuration\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # display the options
    printf "\nOption [1]: Change Font"
    printf "\nOption [2]: Change Font Size"
    printf "\nOption [3]: Change Background Opacity"
    printf "\nOption [4]: Toggle Between Light and Dark Theme"
    printf "\nOption [x]: Exit Script\n\n"
}

change_font() {
	printf "\nSelect Your Font\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # displays font options to the user
    printf "\nOption [1]: JetBrainsMono Nerd Font Mono"
    printf "\nOption [2]: Iosevka Nerd Font Mono"
    printf "\nOption [3]: VictorMono Nerd Font Mono"
    printf "\nOption [4]: MonaspiceKr Nerd Font Mono"
    printf "\nOption [5]: CaskaydiaCove Nerd Font Mono"
    printf "\nOption [6]: IBM Plex Mono"
    printf "\nOption [x]: Exit\n\n"

	# prompt the user to enter font option
	read -p "Select Font Number: " user_font

	# conditions to evaluate based on user input
	if [ "$user_font" = 1 ]; then
		# user selects "JetBrainsMono"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="JetBrainsMono Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to JetBrainsMono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 2 ]; then
		# user selects "Iosevka"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="Iosevka Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to Iosevka Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 3 ]; then
		# user selects "VictorMono
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="VictorMono Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to VictorMono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 4 ]; then
		# user selects "MonaspiceKr"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="MonaspiceKr Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to MonaspiceKr Nerd Font Mono... Please Reload Kitty\n"

	elif [ "$user_font" = 5 ]; then
		# user selects "CaskaydiaCove"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="CaskaydiaCove Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to CaskaydiaCove Nerd Font Mono... Please Reload Kitty\n"

	elif [ "$user_font" = 6 ]; then
		# user selects "Blex Mono"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|VictorMono Nerd Font Mono\|MonaspiceKr Nerd Font Mono\|CaskaydiaCove Nerd Font Mono\|BlexMono Nerd Font Mono\)"/font_family      family="BlexMono Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to BlexMono Mono Nerd Font Mono... Please Reload Kitty\n"

	elif [ "$user_font" = 'x' ] || [ "$user_font" = 'exit' ]; then
		# user wants to exit the script
        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        printf "\nGood Bye!\n\n"

        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        # exit the script
        exit 0

	else
		# if the user selects anything else
		printf "\nWrong Option\n"
	fi
}


# function to change the font size
change_font_size() {
	printf "\nFont Size Selection\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nNOTE: Font Size Format: 'xx.x' ( 'x' is a number from '0' to '9' )\n\n"
	# prompt the user to enter font size
	read -p "Please Enter Font Size: " user_font_size

	# check if user font size is in the correct format
    if [[ ! "$user_font_size" =~ ^[0-9]{1,2}(\.[0-9])?$ ]]; then
		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# output the error message
        printf "\n\nInvalid Font Size.\nPlease enter a valid font size in the format 'xx.x' (e.g., 12.5).\n\n"

		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"
		# if not exit the program with the error code
		return 1
    fi
    # change the font size to desired user font size
    sed -i "s/^font_size\s\+[0-9]\+\(\.[0-9]\+\)\?$/font_size $user_font_size/" "$kitty_conf"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# output confirmation message
    printf "\nSuccessfully changed Font size changed to '$user_font_size'\n"
}


# NOTE: 09/02/2025 ==> keymap added in kitty to change opacity
# function to change the background opacity
change_background_opacity() {
	printf "\nBackground Opacity Selection\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # displays opacity options to the user
    printf "\nOption [1]: Opaque"
    printf "\nOption [2]: Enable Transparency"
    printf "\nOption [x]: Exit\n\n"

	# prompt the user to enter font option
	read -p "Select Opacity Option: " user_opacity

	# conditions to evaluate based on user input
	if [ "$user_opacity" = 1 ]; then
		# disable transparency
        sed -i 's/^background_opacity\s\+[0-1]\{1\}\+\.[0-9]\{1\}\+/background_opacity 1.0/' "$kitty_conf"
        # output confirmation message
        printf "\nChange Background Opacity To Opaque\n"
    elif [ "$user_opacity" = 2 ]; then
		# enable transparency
        sed -i 's/^background_opacity\s\+[0-1]\{1\}\+\.[0-9]\{1\}\+/background_opacity 0.7/' "$kitty_conf"
        # output confirmation message
        printf "\nChange Background Opacity To Desired Transparency\n"

    elif [ "$user_opacity" = 'x' ] || [ "$user_opacity" = "exit" ]; then
		# user wants to exit the script
        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        printf "\nGood Bye!\n\n"

        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        # exit the script
        exit 0

	else
		# if the user selects anything else
		printf "\nWrong Option\n"
	fi
}

# function to choose between dark and light theme
change_theme() {
    printf "\nTheme ( Dark / Light Mode ) Selection\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # displays opacity options to the user
    printf "\nOption [1]: Dark Mode"
    printf "\nOption [2]: Light Mode"
    printf "\nOption [x]: Exit\n\n"

	# prompt the user to enter font option
	read -p "Select Theme Option: " user_theme

	# conditions to evaluate based on user input
    if [ "$user_theme" = 1 ]; then
        # if the user selects dark mode
        sed -i 's/^include themes\/\(vague\|one_half_light\)\.conf/include themes\/vague.conf/' "$kitty_conf"

    elif [ "$user_theme" = 2 ]; then
        sed -i 's/^include themes\/\(vague\|one_half_light\)\.conf/include themes\/one_half_light.conf/' "$kitty_conf"
        # if the user selects light mode
    elif [ "$user_theme" = 'x' ] || [ "$user_theme" = "exit" ]; then
		# user wants to exit the script
        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        printf "\nGood Bye!\n\n"

        # output '-' 50 times
        printf '%0.s-' {1..50}
        printf "\n"

        # exit the script
        exit 0

	else
		# if the user selects anything else
		printf "\nWrong Option\n"
    fi
}


# our main function
main() {
	printf "\n"
	# check if kitty directory exists
	if [ -d "$kitty_dir" ]; then
		printf "Kitty Directory Found\n"

		# check if `kitty.conf` file exists
		if [ -e "$kitty_conf" ]; then
			printf "Kitty Configuration Found\n"

			# output '-' 50 times
			printf '%0.s-' {1..50}
			printf "\n"

			# call the function to display options to the user
			display_options

			# ask the user to select and option
			read -p "Please Select and Option: " user_option

			# conditions to evaluate depending on user's input
			if [[ "$user_option" = 1 ]]; then
				# if the user wants to change the font
				change_font

			elif [[ "$user_option" = 2 ]]; then
				# if the user wants to change the font size
				change_font_size

			elif [[ "$user_option" = 3 ]]; then
				# if the user wants to change the background opacity
				change_background_opacity

			elif [[ "$user_option" = 4 ]]; then
                # if the user wants to change the theme ( either dark / light mode )
                change_theme

            elif [ "$user_option" = 'x' ] || [ "$user_option" = "exit" ]; then
				# user wants to exit the script
				# output '-' 50 times
				printf '%0.s-' {1..50}
				printf "\n"

				printf "\nGood Bye!\n\n"

				# output '-' 50 times
				printf '%0.s-' {1..50}
				printf "\n"

                # exit the script
				exit 0

			else
				# users presses unavailable option
				# output '-' 50 times
				printf '%0.s-' {1..50}
				printf "\n"

				# output approriate message
				printf "\nWrong Option\n\n"

				# output '-' 50 times
				printf '%0.s-' {1..50}
				printf "\n"
			fi

		# if we don't file the configuration file for kitty
		else
			# output appropriate message
			printf "Kitty Configuration NOT Found\n"
		fi

	# if we don't file the configuration directory for kitty
	else
		# output appropriate message
		printf "Kitty Directory NOT Found\n\n"
	fi
}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi
