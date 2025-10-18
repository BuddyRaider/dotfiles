#!/usr/bin/env bash

#s1=$(pactl load-module module-null-sink sink_name="VirtSink01")
#s2=$(pactl load-module module-null-sink sink_name="VirtSink02")
#s3=$(pactl load-module module-null-sink sink_name="VirtSink03")

#echo "Press any key when ready to remove sink devices (Ctrl+C to cancel): "
#read -s -n 1

# Attempt to unload just the three sinks we made
#id1=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink01/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#id2=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink02/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#id3=$(pactl list modules | awk '/^Module #/{mod=$0; next} /Name: .*module-null-sink/ && /sink_name=VirtSink03/{gsub(/^Module #/, "", mod); print mod; exit}' RS='\n\n')
#pactl unload-module "$id1"
#pactl unload-module "$id2"
#pactl unload-module "$id3"

# The following command removes all instances of "module-null-sink"
#pactl unload-module module-null-sink

function getIDs () {
	pactl list modules short | grep module-null-sink | grep media.class=Audio/Source/Virtual | grep media.name=VirtSource | awk '{print $1}'
}

if [[ "$1" == "rm" ]]; then
	#pactl unload-module module-null-sink media.class=Audio/Source/Virtual
	while IFS= read -r line; do
		pactl unload-module "$line"
	done < <(getIDs)
else
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$1"
fi

if [[ -n "$2" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$2"
fi

if [[ -n "$3" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$3"
fi

if [[ -n "$4" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$4"
fi

if [[ -n "$5" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$5"
fi

if [[ -n "$6" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$6"
fi

if [[ -n "$7" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$7"
fi

if [[ -n "$8" ]]; then
	pactl load-module module-null-sink media.name=VirtSource media.class=Audio/Source/Virtual sink_name="$8"
fi

