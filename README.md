# JavaCardDev
A setup of a development environment for creating Java Card applets with JDK 1.3 and JavaCardKit 2.2.1
- - -

Install a 32-bit linux like debian-9.4.0-i386-netinst.iso in Virtualbox 5.2.12 as a Linux/Debian (32-bit)- accept the suggested settings.

Before starting the VM go to Settings and:

Change to "Bridged Adapter" in Network|Adapter1
In Shared Folders map ~/Desktop/JavaCard to JavaCard with auto-mount
Use the default graphical installer and accept suggested settings. Set the username and passwords according to your own preferences. Also select a close mirror for the "Configure the package manager"

At "Software selection" uncheck "Debian desktop environment" and "print server", but select the "SSH server".

After the installer rebooted the system login as root

### Install required packages

```
apt-get -y install zip dkms build-essential linux-headers-686
```
### Install guest aditions for the VirtualBox VM [optional]

Under the Devices-entry in the VirtualBox menu select the "Insert Guest Additions CD image"

```
cd /media/cdrom
./VBoxLinuxAdditions.run
ln -s /media/sf_JavaCard ~/JavaCard
```

# Change the font on the console [optional]

```
dpkg-reconfigure console-setup
```
* Select the default UTF-8 Enconding
* Select the Latin1-western charset
* Select the TerminusBold font, 10x20 size

### Smartcard reader [optional]
Insert the SmartCard reader Under the Devices|USB|USB Settings... in the VirtualBox menu select the USB -tab and then click the usb-connector with a green plus sign and select the reader in the list of attached devices. After re-inserting the SmartCard reader it will be connected to the Linux guest

### Download the Java SDK and JavaCard Kit
At the host download j2sdk-1_3_1_20-linux-i586.bin from http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase13-419413.html

http://download.oracle.com/otn/java/j2sdk/1.3.1_20/j2sdk-1_3_1_20-linux-i586.bin

and java_card_kit-2_2_1-linux-dom.zip from http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javame-419430.html#java_card_kit-2.2.1-oth-JPR

http://download.oracle.com/otn-pub/java/java_card_kit/2.2.1/java_card_kit-2_2_1-linux-dom.zip

# Download the required legacy libc

Also download http://archive.debian.org/debian/pool/main/e/egcs1.1/libstdc++2.9-glibc2.1_2.91.66-4_i386.deb 

# Copy and installation of the downloaded files
Move the files to the shared folder and then:

``` 
unzip java_card_kit-2_2_1-linux-dom.zip
./j2sdk-1_3_1_20-linux-i586.bin
dpkg -i libstdc++2.9-glibc2.1_2.91.66-4_i386.deb
rm *.zip *.bin *.deb
```
 
