#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
  Take a video with the PiCamera (Raspberry Pi only)
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
import time # Sleep
import argparse # Manage program arguments
import sys # Use exit calls

if __name__ == "__main__":
  # Parse received parameters
  parser = argparse.ArgumentParser(description='Take a video with the PiCamera (Raspberry Pi only)')
  parser.add_argument('-p', '--path', help='Storage path of the video')
  parser.add_argument('-d', '--duration', type=int, help='Video duration')
  args = parser.parse_args()

  try:
    # Prepare to initialize the PiCamera
    camera = PiCamera()

    # Take the video
    camera.start_recording(str(args.path))
    time.sleep(int(args.duration))
    camera.stop_recording()
  except Exception:
    print("Take video: False")
    sys.exit(1)

  # End program with success (no exception)
  print("Take video: True")
  sys.exit(0)
