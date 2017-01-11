
createButtonSelector() {

BUTTON_NAME=$1

PRESSED=$BUTTON_NAME\_with_overlay
NORMAL=$BUTTON_NAME
FILE=$DRAWABLE_FOLDER_PATH/selector_$BUTTON_NAME\.xml

sed -e "s/\${PRESSED}/${PRESSED}/" -e "s/\${NORMAL}/${NORMAL}/" button_selector_with_overlay.template > ${FILE}
}

checkResource() {

BUTTON_NAME=$1

REPORT=$REPORT_FOLDER_PATH/$BUTTON_NAME\.log
PRESSED=$DRAWABLE_NODPI_FOLDER_PATH/$BUTTON_NAME\_with_overlay.png
NORMAL=$DRAWABLE_NODPI_FOLDER_PATH/$BUTTON_NAME.png
FILE=$DRAWABLE_FOLDER_PATH/selector_$BUTTON_NAME\.xml

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

   createButtonSelector $BUTTON_NAME
fi


}

checkResource $1
