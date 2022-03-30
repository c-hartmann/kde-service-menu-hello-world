#! /usr/bin/env bash

# vim: syntax=sh tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab :

#
# 	servicemenus-hello-world.sh Version 0.1.0
# 	Copyright (C) 2022 Christian Hartmann <hartmann.christian@gmail.com>
#
#       SPDX-FileCopyrightText: 2022 Christian Hartmann <hartmann.christian@gmail.com>
#
#       SPDX-License-Identifier: LicenseRef-KDE-Accepted-GPL
#
#       This program is free software; you can redistribute it and/or
#       modify it under the terms of the GNU General Public License as
#       published by the Free Software Foundation; either version 3 of
#       the license or (at your option) at any later version that is
#       accepted by the membership of KDE e.V. (or its successor
#       approved by the membership of KDE e.V.), which shall act as a
#       proxy as defined in Section 14 of version 3 of the license.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details.
#



# some useful helpers
MY_PATH="${BASH_SOURCE[0]}"
MY_FILE="${MY_PATH##*/}"
MY_NAME="${MY_FILE%%.*}"
MY_CONFIG="${MY_NAME}.config"

# no arguments? quit!
(( $# == 0 )) && exit 128

# main function
_main ()
{
    _message_text="Hello World"
    kdialog \
      --title 'Hello' \
      --yes-label 'Hello' \
      --no-label 'Cancel' \
      --warningyesno "$_message_text" \
      --dontagain "${MY_CONFIG}:first_run"
    if (( $? == 0 )); then
        return 0
    else
        # bug or feature?
        # kdialog remembers OK or CANCEL last decision
        # when do not display again option is cheched. so if user(in)
        # checks "do not display again" _and_ Cancel the operation,
        # kdialog will always return false on every next invocation.
        # so we delete config file immediatly on Cancel and ensure
        # dialog will pop up on next run.
        rm ~/.config/"$MY_CONFIG"
        return 1 # canceled
    fi
}

# call main with all remaining command line arguments
_main "$@"
