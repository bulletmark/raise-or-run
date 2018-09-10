## Linux shell script to raise app window, or run app if window not already open

This is is a simple bash script which is called with an argument "app"
which you want to start. If there is already a window open with that
app's window manager class then that window is raised and given focus,
otherwise if there is no window already open then the app is started. This
script uses [wmctrl](https://sites.google.com/site/tstyblo/wmctrl) to
determine the classes of already open windows, and also to select an
open window.

The latest version and documentation is available at
http://github.com/bulletmark/raise-or-run.

### INSTALLATION

NOTE: Arch users can just install [raise-or-run from the
AUR](https://aur.archlinux.org/packages/raise-or-run/) and skip to the next
section. Otherwise, do the following.

You require the [bash](https://www.gnu.org/software/bash/) shell and the
[wmctrl](https://sites.google.com/site/tstyblo/wmctrl)
package. Then type:

    git clone http://github.com/bulletmark/raise-or-run
    cd raise-or-run
    sudo make install

### USAGE

I use this for the [KMyMoney](https://kmymoney.org/) program which
[incorrectly handles multiple files](https://bugs.kde.org/show_bug.cgi?id=350850).
If you click on a file which is already open the it tries to open the
file again and creates an error. So I change the `Exec` line in the
`/usr/usr/applications/org.kde.kmymoney.desktop` file from:

    Exec=kmymoney %u

to:

    Exec=/usr/bin/raise-or-run kmymoney %u

Now when I click on a [KMyMoney](https://kmymoney.org/) file, it jumps
to an open window if one exists, or if not then it starts the app to
open a new window.

    Usage: raise-or-run [-options] <app> [file]
    Options
    -c <WM class> Use specified class instead of assuming app name as WM class

### UPGRADE

    cd raise-or-run  # Source dir, as above
    git pull
    sudo make install

### UNINSTALL

    cd raise-or-run  # Source dir, as above
    sudo make uninstall

### LICENSE

Copyright (C) 2018 Mark Blakeney. This program is distributed under the
terms of the GNU General Public License.

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later
version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License at <http://www.gnu.org/licenses/> for more details.

<!-- vim: se ai syn=markdown: -->