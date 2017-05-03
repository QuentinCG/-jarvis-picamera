#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
  Take a picture with the PiCamera (Raspberry Pi only)
"""
__author__ = 'Quentin Comte-Gaz'
__email__ = "quentin@comte-gaz.com"
__license__ = "MIT License"
__copyright__ = "Copyright Quentin Comte-Gaz (2017)"
__python_version__ = "2.7+ and 3.+"
__version__ = "1.0 (2017/05/03)"
__status__ = "Usable for any project"
__dependency__ = "PiCamera (use 'sudo apt-get install python-picamera' or 'sudo apt-get install python3-picamera' to install package)"

from picamera import PiCamera # Take picture/video
import argparse # Manage program arguments
import sys # Use exit calls

if __name__ == "__main__":
  # Parse received parameters
  parser = argparse.ArgumentParser(description='Take a picture with the PiCamera (Raspberry Pi only)')
  parser.add_argument('-p', '--path', help='Storage path of the picture')
  args = parser.parse_args()

  try:
    # Prepare to initialize the PiCamera
    camera = PiCamera()

    # Take the picture
    camera.capture(str(args.path))
  except Exception:
    print("Take picture: False")
    sys.exit(1)

  # Quit the program with error (the program should never go there)
  print("Take picture: True")
  sys.exit(0)
