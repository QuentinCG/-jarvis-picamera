#!/usr/bin/env bash

jv_pg_pc_lang()
{
  case "$1" in
    take_picture_success) echo "Photo prise.";;
    take_picture_failed) echo "Impossible de prendre la photo...";;
    take_video_success) echo "Vidéo prise.";;
    take_video_failed) echo "Impossible de prendre la video...";;

    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
