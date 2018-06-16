APPHOME=/root/JavaCard/jdk1.3.1_20

JRE_HOME=/root/JavaCard/jdk1.3.1_20/jre
PATH=$PATH:$JRE_HOME/bin/i386/native_threads

JAVA_HOME=/root/JavaCard/jdk1.3.1_20
PATH=$PATH:$JAVA_HOME/bin/i386/native_threads

JC_HOME=/root/JavaCard/java_card_kit-2_2_1/
PATH=$PATH:$JC_HOME/bin

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/JavaCard/jdk1.3.1_20/jre/lib/i386/
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/JavaCard/jdk1.3.1_20/jre/lib/i386/native_threads
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/JavaCard/jdk1.3.1_20/jre/lib/i386/server
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/JavaCard/jdk1.3.1_20/jre/lib/i386/classic
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/JavaCard/jdk1.3.1_20/jre/lib/i386/client

export APPHOME
export JAVA_HOME
export JRE_HOME
export LD_LIBRARY_PATH
export PATH
export JC_HOME
