#! /usr/bin/env bash

# vim: syntax=sh tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab :

#
#       servicemenus-hello-world.sh Version 0.2.0
#       Copyright (C) 2022 Christian Hartmann <hartmann.christian@gmail.com>
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

# TODO rename config file to a hopefully more unique name. same as locales

# some eventually useful helpers
MY_PATH="${BASH_SOURCE[0]}"
MY_FILE="${MY_PATH##*/}"
MY_NAME="${MY_FILE%%.*}"

# where my config goes
MY_CONFIG="${MY_NAME}.config" # is $HOME/.config/hello-world.config

# where my shared data goes
MY_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"

### l10n
export TEXTDOMAIN="${MY_NAME}"
export TEXTDOMAINDIR="${MY_DATA_DIR}/org.kde.servicemenus.${MY_NAME}/locale"

### execute the shell builtin script
. gettext.sh

# no arguments? quit!
# (as this is an example first. we do not make any use of it here)
(( $# == 0 )) && printf '%s\n' "usage: $MY_NAME <foo>" && exit 128

# main function
_main ()
{
    # read a translated version of Hello World or use a default
    local _message_text_i10n="$(gettext 'Hello World')"
    local _message_text="${_message_text_i10n:-'Hello World'}"

    # same procedure for the OK button label
    local _ok_button_label_i10n="$(gettext 'Hello')"
    local _ok_button_label="${_ok_button_label_i10n:-'Hello'}"

    kdialog \
      --title     "$_message_text" \
      --ok-label  "$_ok_button_label" \
      --msgbox    "$_message_text" \
      --dontagain "${MY_CONFIG}:first_run"
}

# say hello
_main
