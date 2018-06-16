# JavaCardDev
A setup of a development environment for creating Java Card applets with JDK 1.3 and JavaCardKit 2.2.1

- - -

## Installing Linux in a VM

Install a 32-bit linux like debian-9.4.0-i386-netinst.iso in Virtualbox 5.2.12 as a Linux/Debian (32-bit)- accept the suggested settings in the wizard.

VirtualBox can be downloaded from [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) and grab the Debian from [debian.org/distrib/netinst](https://www.debian.org/distrib/netinst#smallcd). Don't forget that it is the 32-bit i386 version you want here.

I guess that other virtualizers / Linux dists will work just as well. I'm just a Debian fanboy and happened to have the VirtualBox already installed on my machine so this is how I set it up.

## Installing the VM

Before starting the VM go to Settings and change the following:

* Change to "Bridged Adapter" in Network|Adapter1
* In Shared Folders map ~/Desktop/JavaCard to JavaCard with auto-mount enabled

After starting up the VM use the default graphical installer and accept suggested settings. Set the username and passwords according to your own preferences. Also select a mirror close to you for the "Configure the package manager"

At "Software selection" uncheck "Debian desktop environment" and "print server", but select the "SSH server".

After the installer rebooted the system login as root. *(I know it's a bad habit to be root as default, but I really don't care here. You are welcome to use another user and move things around a bit.)*

The scripts and makefile assumes that everything is installed under /root/JavaCard - but that should be easy to change if you are so inclined.

## Install required packages

```
apt-get -y install zip dkms build-essential linux-headers-686
```

## Install guest additions for the VirtualBox VM [optional]

To to able to enable the filesystem sharing between host and guest the "Guest Additions" must be installed. If the installer bugs out with some errors then a likely cause is that the kernel is too new for the VirtualBox version. Install the latest VirtualBox and try again.

Under the Devices-entry in the VirtualBox menu select the "Insert Guest Additions CD image"

```
cd /media/cdrom
./VBoxLinuxAdditions.run
ln -s /media/sf_JavaCard ~/JavaCard
```

## Change the font on the console [optional]

I find the default font to be a bit on the light side and hard to read, so I usually change the font to TerminusBold.

```
dpkg-reconfigure console-setup
```
* Select the default UTF-8 Enconding
* Select the Latin1-western charset
* Select the TerminusBold font, 10x20 size

## Smartcard reader [optional]

If you want to upload/install the applet directly from the Linux guest then you need to map the SmartCard reader to the Guest, or else the Host will have it allocated for itself.  

Insert the SmartCard reader, then under the Devices|USB|USB Settings... in the VirtualBox menu select the USB -tab. Then at the right side of the screen click usb-connector with a green plus sign and select the reader in the list of attached devices. After re-inserting the SmartCard reader it will be connected and accessible to the Linux guest.

## Download the Java SDK and JavaCard Kit

It's easier to download the SDK and Kit from the host since Oracle by some reason requires you to be logged in to your Oracle account to be able to download the older SDKs. 

Download the `j2sdk-1_3_1_20-linux-i586.bin` from [oracle.com/.../java-archive-downloads-javase13](http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase13-419413.html)


and `java_card_kit-2_2_1-linux-dom.zip` from [oracle.com/.../java_card_kit-2.2.1-oth-JPR](http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javame-419430.html#java_card_kit-2.2.1-oth-JPR)

## Download the required legacy glibc

The JDK 1.3 requires an old glibc to be installed.

Also download [archive.debian.org/.../libstdc++2.9-glibc2.1_2.91.66-4_i386.deb](http://archive.debian.org/debian/pool/main/e/egcs1.1/libstdc++2.9-glibc2.1_2.91.66-4_i386.deb)

## Copy and installation of the downloaded files

Move the files to the shared folder and then install/unpack them.

``` 
./j2sdk-1_3_1_20-linux-i586.bin
unzip java_card_kit-2_2_1-linux-dom.zip
dpkg -i libstdc++2.9-glibc2.1_2.91.66-4_i386.deb
```
 
After this you can safely remove the `*.deb *.zip *.bin` files.
