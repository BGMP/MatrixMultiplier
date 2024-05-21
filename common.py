import os
import platform
import sys

DATA_DIR = os.path.join(os.curdir, "data")

if sys.platform == "linux":
    PLATFORM = "linux"
elif sys.platform == "win32":
    if platform.architecture()[0] == "64bit":
        PLATFORM = "win64"
    else:
        PLATFORM = "win32"
elif sys.platform == "darwin":
    PLATFORM = "macos"
