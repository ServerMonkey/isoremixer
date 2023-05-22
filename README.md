isoremixer(1) -- Automatic build Cygwin Windows ISO images
=============================================

## SYNOPSIS

`isoremixer <OS>`

## DESCRIPTION

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

* `-h`, `--help` :
  Displays the help screen.
* `--only-cygwin` :
  Only start Cygwin.

* `<OS>` :
  Select an OS version, Se below for availabe OS:es.

## OS ARGUMENT

* `xp` : Windows XP (any version) via Nlite

## EXAMPLES

Build a Windows XP ISO image:

    $ isoremixer xp

## CUSTOM CONFIG FILES

To use your own preset and/or script files, put your files in these folders.  
If not, isoremixer will copy recommended/default preset and script files from:
/usr/local/share/isoremixer/presets/

### Presets

* `xp` : `"~/.isoremixer/presets/nlite/windows-xp-pro/Last Session.ini"`
  and `"Last Session_u.ini"`

### Scripts

* `xp` : `"~/.isoremixer/presets/setup_cygwin*"` Each script file must start
  with `"setup_cygwin..."`

## COPYRIGHT

See license file

## SEE ALSO

wine(1), winetricks(1), fastpkg(1), [www.cygwin.com](https://www.cygwin.com/)
