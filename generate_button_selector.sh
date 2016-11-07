
createButtonSelector() {

BUTTON_NAME=$1
THEME=$2

CHECKED=button_$BUTTON_NAME\_$THEME\_checked
PRESSED=button_$BUTTON_NAME\_$THEME\_pressed
NORMAL=button_$BUTTON_NAME\_$THEME\_normal
FILE=$DRAWABLE_FOLDER_PATH/selector_button_$BUTTON_NAME\_$THEME\.xml

echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" >> $FILE
echo "<selector xmlns:android=\"http://schemas.android.com/apk/res/android\">" >> $FILE
echo "    <item android:drawable=\"@drawable/$CHECKED\" android:state_checked=\"true\"></item>" >> $FILE
echo "    <item android:drawable=\"@drawable/$PRESSED\" android:state_pressed=\"true\"></item>" >> $FILE
echo "    <item android:drawable=\"@drawable/$NORMAL\"></item>" >> $FILE
echo "</selector>" >> $FILE

}

checkResource() {

BUTTON_NAME=$1
THEME=$2

REPORT=$REPORT_FOLDER_PATH/button\_$BUTTON_NAME\_$THEME\.log
CHECKED=$DRAWABLE_NODPI_FOLDER_PATH/button_$BUTTON_NAME\_$THEME\_checked.9.png
PRESSED=$DRAWABLE_NODPI_FOLDER_PATH/button_$BUTTON_NAME\_$THEME\_pressed.9.png
NORMAL=$DRAWABLE_NODPI_FOLDER_PATH/button_$BUTTON_NAME\_$THEME\_normal.9.png
FILE=$DRAWABLE_FOLDER_PATH/selector_button_$BUTTON_NAME\_$THEME\.xml

if [ -f "$CHECKED" ];
then
    echo "OK! File $CHECKED exist."
else
    echo "File $CHECKED does not exist."
    echo "File $CHECKED does not exist." >> $REPORT
fi

if [ -f "$PRESSED" ];
then
    echo "OK! File $PRESSED exist."
else
    echo "File $PRESSED does not exist."
    echo "File $PRESSED does not exist." >> $REPORT
fi

if [ -f "$NORMAL" ];
then
    echo "OK! File $NORMAL exist."
else
    echo "File $NORMAL does not exist."
    echo "File $NORMAL does not exist." >> $REPORT
fi


if [ -f "$FILE" ];
then
   echo "OK! File $FILE exist."
else
   echo "File $FILE does not exist"
   echo "Create $FILE now!"

   createButtonSelector $BUTTON_NAME $THEME
fi


}

checkResource $1 $2

