import sys
import os
import datetime
import subprocess

from keyhac import *


def configure(keymap):

    # Vim key bind
    keymap_global = keymap.defineWindowKeymap()
    keymap_global["LAlt-H"] = "Left"
    keymap_global["LAlt-J"] = "Down"
    keymap_global["LAlt-K"] = "Up"
    keymap_global["LAlt-L"] = "Right"

