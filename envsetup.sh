. ./config

# Current date with format DDMMYYY
DATE=$(date +"%d%m%Y")

# Current time
START_TIME=$(date +"%I%M%S")

export_source_tree_variable_path() {
    echo "Start export source tree variable path"
    export LOG_FILE_NAME="masterbuild_"$DATE"_"$START_TIME".log"
    export ROOT_FOLDER=$PWD
    export LOG_FILE_PATH=$ROOT_FOLDER/$LOG_FILE_NAME

    export REPORT_FOLDER_PATH=$ROOT_FOLDER/$REPORT_FOLDER_NAME

    export PROJECT_FOLDER_PATH=$ROOT_FOLDER/$PROJECT_FOLDER_NAME

    export DEFAULT_EXAMPLE_PROJECT_PATH=$PROJECT_FOLDER_PATH/$DEFAULT_EXAMPLE_PROJECT_NAME

    export APP_FOLDER_PATH=$DEFAULT_EXAMPLE_PROJECT_PATH/$APP_FOLDER_NAME

    export SOURCE_FOLDER_PATH=$APP_FOLDER_PATH/$SOURCE_FOLDER_NAME

    export MAIN_FOLDER_PATH=$SOURCE_FOLDER_PATH/$MAIN_FOLDER_NAME

    export RESOURCE_FOLDER_PATH=$MAIN_FOLDER_PATH/$RESOURCE_FOLDER_NAME

    export DRAWABLE_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_FOLDER_NAME

    export DRAWABLE_HDPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_HDPI_FOLDER_NAME

    export DRAWABLE_LDPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_LDPI_FOLDER_NAME

    export DRAWABLE_MDPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_MDPI_FOLDER_NAME

    export DRAWABLE_XHDPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_XHDPI_FOLDER_NAME

    export DRAWABLE_XXHDPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_XXHDPI_FOLDER_NAME

    export LAYOUT_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$LAYOUT_FOLDER_NAME

    export MENU_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$MENU_FOLDER_NAME

    export VALUES_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$VALUES_FOLDER_NAME

    export VALUES_VI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$VALUES_VI_FOLDER_NAME

    export ANIM_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$ANIM_FOLDER_NAME

    export DRAWABLE_NODPI_FOLDER_PATH=$RESOURCE_FOLDER_PATH/$DRAWABLE_NODPI_FOLDER_NAME

}

print_wellcome() {

    echo "Log file: " $LOG_FILE_PATH
    echo "Log file: " $LOG_FILE_PATH >> $LOG_FILE_PATH

    echo "Welcome build tool!"
    echo "Welcome build tool!" >> $LOG_FILE_PATH

    print_information "Root directory:" $ROOT_FOLDER
    print_information "Date:" $DATE
    print_information "Current time:" $START_TIME
    print_information "Report folder:" $REPORT_FOLDER_PATH
    print_information "Projects folder:" $PROJECT_FOLDER_PATH
    print_information "Default example project folder:" $DEFAULT_EXAMPLE_PROJECT_PATH
    print_information "App folder:" $APP_FOLDER_PATH
    print_information "Source folder:" $SOURCE_FOLDER_PATH
    print_information "Main folder:" $MAIN_FOLDER_PATH
    print_information "Resource folder:" $RESOURCE_FOLDER_PATH
    print_information "Drawable folder:" $DRAWABLE_FOLDER_PATH
    print_information "Drawable HDPI folder:" $DRAWABLE_HDPI_FOLDER_PATH
    print_information "Drawable LDPI folder:" $DRAWABLE_LDPI_FOLDER_PATH
    print_information "Drawable MDPI folder:" $DRAWABLE_MDPI_FOLDER_PATH
    print_information "Drawable XHDPI folder:" $DRAWABLE_XHDPI_FOLDER_PATH
    print_information "Drawable XXHDPI folder:" $DRAWABLE_XXHDPI_FOLDER_PATH
    print_information "Drawable NODPI folder:" $DRAWABLE_NODPI_FOLDER_PATH
    print_information "Layout folder:" $LAYOUT_FOLDER_PATH
    print_information "Menu folder:" $MENU_FOLDER_PATH
    print_information "Values folder:" $VALUES_FOLDER_PATH
    print_information "Values VI folder:" $VALUES_VI_FOLDER_PATH
    print_information "Animation folder:" $ANIM_FOLDER_PATH
}

print_information() {

    TEXT=$1

    INFO=$2

    echo $1 $2
    echo $1 $2 >> $LOG_FILE_PATH
}

generate_source_tree() {
    echo "Start generate source tree"

    create_folder $REPORT_FOLDER_PATH

    create_folder $PROJECT_FOLDER_PATH

    create_folder $DEFAULT_EXAMPLE_PROJECT_PATH

    create_folder $APP_FOLDER_PATH

    create_folder $SOURCE_FOLDER_PATH

    create_folder $MAIN_FOLDER_PATH

    create_folder $RESOURCE_FOLDER_PATH

    create_folder $DRAWABLE_FOLDER_PATH

    create_folder $DRAWABLE_HDPI_FOLDER_PATH

    create_folder $DRAWABLE_LDPI_FOLDER_PATH

    create_folder $DRAWABLE_MDPI_FOLDER_PATH

    create_folder $DRAWABLE_XHDPI_FOLDER_PATH

    create_folder $DRAWABLE_XXHDPI_FOLDER_PATH

    create_folder $DRAWABLE_NODPI_FOLDER_PATH

    create_folder $LAYOUT_FOLDER_PATH

    create_folder $MENU_FOLDER_PATH

    create_folder $VALUES_FOLDER_PATH

    create_folder $VALUES_VI_FOLDER_PATH

    create_folder $ANIM_FOLDER_PATH

}

create_folder() {
    FOLDER_PATH=$1
    if [ ! -d "$FOLDER_PATH" ]; then
        # Create main folder
        echo "Directory " $FOLDER_PATH " does not exist. Create new one!"
        echo "Directory " $FOLDER_PATH " does not exist. Create new one!" >> $LOG_FILE_PATH
        mkdir $FOLDER_PATH
    else
        echo "Directory " $FOLDER_PATH " exists."
        echo "Directory " $FOLDER_PATH " exists." >> $LOG_FILE_PATH
    fi
}

clean_source_tree() {
    echo "Start clean source"
}

convert_image() {
    ./convert_image.sh $1
}

generate_selector() {
    # ./generate_button_selector.sh done_1 dark
    ./generate_button_selector_with_overlay.sh player_clock_off
    for file in images/*.png
    do
        file_name=$(echo $file | cut -d"/" -f2)
        name=$(echo $file_name | cut -d"." -f1)
        echo "Create selector for " $name
        echo "Create selector for " $name >> $LOG_FILE_PATH
        ./generate_button_selector_with_overlay.sh $name
    done
}

export_source_tree_variable_path

print_wellcome

generate_source_tree

clean_source_tree

convert_image images

convert_image images_overlay

generate_selector
