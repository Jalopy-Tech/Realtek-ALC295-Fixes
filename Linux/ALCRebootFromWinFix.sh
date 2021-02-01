#!/bin/bash

# Fix for no sound from internal speakers when rebooting from Windows

hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x10
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x0120

hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x0d
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0xa023


# Fix for no mic and headphone jack switching when rebooting from Windows

hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x45
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x5289

hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x46
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x0004

