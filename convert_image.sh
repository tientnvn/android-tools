echo "Start convert Images!"

echo "Waiting for converter!"

CONTAINER=$1
echo $1
echo $CONTAINER/*.png

for file in $CONTAINER/*.png
do
    file_name=$(echo $file | cut -d"/" -f2)
    echo "Convert " $file_name
    echo "Convert " $file_name >> $LOG_FILE_PATH
    WIDTH=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    HEIGHT=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    echo "width: $WIDTH height: $HEIGHT"

    DES_WIDTH=$(expr $WIDTH \/ 4 )
    DES_HEIGHT=$(expr $HEIGHT \/ 4)
    XXX=x
    OPTION="$DES_WIDTH$XXX$DES_HEIGHT"
    echo $OPTION

    if [ ! -f "$DRAWABLE_LDPI_FOLDER_PATH/$file_name" ]; then
        convert $file -resize $OPTION $DRAWABLE_LDPI_FOLDER_PATH/$file_name
    else
        echo "File " $DRAWABLE_LDPI_FOLDER_PATH/$file_name " exists."
        echo "File " $DRAWABLE_LDPI_FOLDER_PATH/$file_name " exists." >> $LOG_FILE_PATH
    fi
done

for file in $CONTAINER/*.png
do
    file_name=$(echo $file | cut -d"/" -f2)
    echo "Convert " $file_name
    echo "Convert " $file_name >> $LOG_FILE_PATH
    WIDTH=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    HEIGHT=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    echo "width: $WIDTH height: $HEIGHT"

    DES_WIDTH=$(expr $WIDTH \/ 2 )
    DES_HEIGHT=$(expr $HEIGHT \/ 2)
    XXX=x
    OPTION="$DES_WIDTH$XXX$DES_HEIGHT"
    echo $OPTION
    if [ ! -f "$DRAWABLE_HDPI_FOLDER_PATH/$file_name" ]; then
        convert $file -resize $OPTION $DRAWABLE_HDPI_FOLDER_PATH/$file_name
    else
        echo "File " $DRAWABLE_HDPI_FOLDER_PATH/$file_name " exists."
        echo "File " $DRAWABLE_HDPI_FOLDER_PATH/$file_name " exists." >> $LOG_FILE_PATH
    fi
done

for file in $CONTAINER/*.png
do
    file_name=$(echo $file | cut -d"/" -f2)
    echo "Convert " $file_name
    echo "Convert " $file_name >> $LOG_FILE_PATH
    WIDTH=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    HEIGHT=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    echo "width: $WIDTH height: $HEIGHT"

    DES_WIDTH=$(expr $WIDTH \/ 3 \* 2)
    DES_HEIGHT=$(expr $HEIGHT \/ 3 \* 2)
    XXX=x
    OPTION="$DES_WIDTH$XXX$DES_HEIGHT"
    echo $OPTION
    if [ ! -f "$DRAWABLE_XHDPI_FOLDER_PATH/$file_name" ]; then
        convert $file -resize $OPTION $DRAWABLE_XHDPI_FOLDER_PATH/$file_name
    else
        echo "File " $DRAWABLE_XHDPI_FOLDER_PATH/$file_name " exists."
        echo "File " $DRAWABLE_XHDPI_FOLDER_PATH/$file_name " exists." >> $LOG_FILE_PATH
    fi
done

for file in $CONTAINER/*.png
do
    file_name=$(echo $file | cut -d"/" -f2)
    echo "Convert " $file_name
    echo "Convert " $file_name >> $LOG_FILE_PATH
    WIDTH=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    HEIGHT=$(identify $file | cut -d" " -f3| cut -d"x" -f1)
    echo "width: $WIDTH height: $HEIGHT"

    DES_WIDTH=$WIDTH
    DES_HEIGHT=$HEIGHT
    XXX=x
    OPTION="$DES_WIDTH$XXX$DES_HEIGHT"
    echo $OPTION
    if [ ! -f "$DRAWABLE_XXHDPI_FOLDER_PATH/$file_name" ]; then
        convert $file -resize $OPTION $DRAWABLE_XXHDPI_FOLDER_PATH/$file_name
    else
        echo "File " $DRAWABLE_XXHDPI_FOLDER_PATH/$file_name " exists."
        echo "File " $DRAWABLE_XXHDPI_FOLDER_PATH/$file_name " exists." >> $LOG_FILE_PATH
    fi
done

echo "DONE!"
