# USE THIS SCRIPT TO PLACE YOUR NODE_MODULES OUTSITE YOUR GOOGLEDRIVE DIRECTORY
# THE SCRIPT WILL PLACE THE NODE_MODULES DIRECTORY IN THE TMP_FOLDER LOCATION 

TMP_DIR=/tmp
PROJECT=$(pwd | rev | cut -f1 -d'/' - | rev)
PROJECT_DIR=$(pwd)

echo $PROJECT

TMP_DIR=$TMP_DIR/$PROJECT/node_modules
mkdir -p $TMP_DIR

export NODE_PATH=$TMP_DIR
echo "--modules-folder $NODE_PATH" >.yarnrc

rm ./node_modules
ln -s $TMP_DIR ./node_modules
yarn install --modules-folder $NODE_PATH
cd $PROJECT_DIR
$SHELL
