isoremixer(1) -- Automatic slipstream / remaster Windows ISO images with Cygwin
=============================================

## SYNOPSIS

`isoremixer <OS> <OPTION_FLAG>`

## DESCRIPTION

Automatic slipstream / remaster Windows ISO images with Cygwin and NTLite.
Automatically download and build a custom ISO image by combining Cygwin, wine,
winetricks and fastpkg. Automatically includes virtualization drivers and
deployment scripts for Cygwin and SSHD.

This project is still under development.

How isoremixer works:

1. Download required files from the Internet (via fastpkg). Like Windows ISO's,
   cygwin.exe installer, drivers and so on.
2. Create a custom Wineprefix.
3. Download Cygwin packages.
4. Install requirements like .NET for Nlite via winetricks.
5. Extract ISO content and drivers to be included in Nlite.
6. Load preset and script files from user or system folder.
7. Start builder program. Like Nlite.

If you encounter errors, log files can be found in each respective wineprefix
under ~.local/share/wineprefixes/

## OPTIONS

* `-h`, `--help` :  Displays the help screen
* `r` :  Use Cygwin fastpkg repacks instead of Cygwin mirror. Use this option
  when you want to use a specific collection of Cygwin packages. Useful when
  in an offline environment. Also, faster than downloading from a mirror.
* `s` :  Skip fastpkg downloads. Only use this if you are sure that you have
  all required files in the fastpkg downloads folder.
* `d` :  Only download files. Then exit.
* `e` :  Erase extra disk and Wine prefix. Use for cleanup.
* `x` :  Erase only the extra disk. Use for cleanup but keep the VM.
* `p` :  Erase everything including VM, extra disk and Wine prefix. Use for
  cleanup.
* `c` :  Only start Cygwin-setup. Only for debugging purposes. Then exit.

* `<OS>` :
  Select an OS version, Se below for availabe OS:es.

## OS ARGUMENT

Look in these folders for available presets and scripts:

    ls /usr/local/share/isoremixer/presets/os

Custom user presets and scripts can be put in these folders:

    ls $HOME/.isoremixer/presets/os

## EXAMPLES

Build a Windows XP ISO image:

    $ isoremixer xp

This will search for the file xp.ini in the folder
$HOME/.isoremixer/presets/os/. If it does not
exist, it will search in the folder /usr/local/share/isoremixer/presets/os/.

When you have successfully created your iso file you can clean up everything,
meaning removing all build files:

    $ isoremixer xp e

## CUSTOM PRESETS

To use ur own preset and/or script files, copy the entire recommended/default
preset folder to $HOME/.isoremixer.
Like this:

    $ cp -r /usr/local/share/isoremixer/presets/ $HOME/.isoremixer/presets/

Then you can for example create a custom os preset by copying the default
template.ini . The template.ini also contains examples and a list of available
options.

### Cygwin autoinstall/setup scripts

Cygwin autoinstall/setup secripts are in 'presets/'. All script files must
start with `"setup_cygwin..."`

The file 'setup_cygwin.bat' is the main auto install file. It will call all
other script files in the same folder.

### Mirrors

For older versions of Cygwin look at:    
[www.crouchingtigerhiddenfruitbat.org/cygwin/timemachine.html](http://www.crouchingtigerhiddenfruitbat.org/cygwin/timemachine.html)  
[cygwin.com/setup/](https://cygwin.com/setup/)  
[ctm.crouchingtigerhiddenfruitbat.org/pub/cygwin/circa/](http://ctm.crouchingtigerhiddenfruitbat.org/pub/cygwin/circa/)

## COPYRIGHT

See license file

## SEE ALSO

wine(1), winetricks(1), fastpkg(1), [www.cygwin.com](https://www.cygwin.com/)
