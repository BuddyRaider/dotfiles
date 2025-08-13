#!/usr/bin/env bash

s1=$(pactl load-module module-null-sink sink_name="VirtSink01")
s2=$(pactl load-module module-null-sink sink_name="VirtSink02")
s3=$(pactl load-module module-null-sink sink_name="VirtSink03")

echo "Press any key when ready to remove sink devices (Ctrl+C to cancel): "
read -s -n 1

# Attempt to unload just the three sinks we made
#id1=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink01/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#id2=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink02/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#id3=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink03/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#pactl unload-module "$id1"
#pactl unload-module "$id2"
#pactl unload-module "$id3"

# The following command removes all instances of "module-null-sink"
pactl unload-module module-null-sink
