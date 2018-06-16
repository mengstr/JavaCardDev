#!/bin/sh

#########################################
# SETUP OF JAVA & JAVACARD ENVIRONMENTS #
#########################################
BASE=/root/JavaCard

APPHOME=$BASE/jdk1.3.1_20

JRE_HOME=$BASE/jdk1.3.1_20/jre
PATH=$PATH:$JRE_HOME/bin/i386/native_threads

JAVA_HOME=$BASE/jdk1.3.1_20
PATH=$PATH:$JAVA_HOME/bin/i386/native_threads

JC_HOME=$BASE/java_card_kit-2_2_1
PATH=$PATH:$JC_HOME/bin

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASE/jdk1.3.1_20/jre/lib/i386/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASE/jdk1.3.1_20/jre/lib/i386/native_threads
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASE/jdk1.3.1_20/jre/lib/i386/server
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASE/jdk1.3.1_20/jre/lib/i386/classic
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BASE/jdk1.3.1_20/jre/lib/i386/client

export APPHOME
export JAVA_HOME
export JRE_HOME
export LD_LIBRARY_PATH
export PATH
export JC_HOME

################################
# SETUP OF PROJECT ENVIRONMENT #
################################

APP=HelloWorld

BUILD_DIR=build
BUILD_CLASSES_DIR=$BUILD_DIR
BUILD_JAVACARD_DIR=$BUILD_DIR

mkdir -p $BUILD_CLASSES_DIR $BUILD_JAVACARD_DIR

RID=0xFE:0xED:0xDE:0xAD:0xBE        # FE ED DE AD BE (EF)

APPLET_AID=$RID:0xEF:0x55:0x00
APPLET_NAME=$APP
PACKAGE_NAME=$APP
PACKAGE_AID=$RID:0xEF:0x55
PACKAGE_VERSION=1.0

JCFLAGS="-g -d $BUILD_CLASSES_DIR -classpath $JC_HOME/lib/api.jar"
JFLAGS="-classpath $JC_HOME/lib/converter.jar:$JC_HOME/lib/offcardverifier.jar"

# COMPILE THE JAVA CODE
javac $JCFLAGS $APP.java

# CONVERT THE RESULING CLASSES INTO A CAP FILE
java  $JFLAGS \
    com.sun.javacard.converter.Converter \
    -verbose \
    -classdir $BUILD_CLASSES_DIR \
    -d $BUILD_DIR \
    -out EXP JCA CAP \
    -exportpath $JC_HOME/api_export_files \
    -applet $APPLET_AID $APPLET_NAME \
    $PACKAGE_NAME $PACKAGE_AID $PACKAGE_VERSION
