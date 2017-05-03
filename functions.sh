#!/usr/bin/env bash

# Take a picture with the PiCamera
# $1 (string): Storage path
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_pc_take_picture()
{
  # Send request to the PiCamera
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/script/take_picture.py --path $1`

  # Show the result to user (if requested)
  if [[ $result =~ "Take picture: True" ]]; then
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_pc_lang take_picture_success)"
    fi
    return 0
  else
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_pc_lang take_picture_failed)"
    fi
  fi

  return 1
}

# Take a video with the PiCamera
# $1 (string): Storage path
# $2 (int): Video time
# $3 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_pc_take_video()
{
  # Send request to the PiCamera
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/script/take_video.py --path $1 --duration $2`

  # Show the result to user (if requested)
  if [[ $result =~ "Take video: True" ]]; then
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_pc_lang take_video_success)"
    fi
    return 0
  else
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_pc_lang take_video_failed)"
    fi
  fi

  return 1
}
