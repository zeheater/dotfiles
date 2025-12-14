function recscr
    # if test "$argv"
    #     ffmpeg -f x11grab -video_size 1920x1080 -thread_queue_size 16 -framerate 25 -i $DISPLAY -f pulse -i record-n-play.monitor -preset ultrafast -crf 18 -probesize 256M -pix_fmt yuv420p -vsync 1 -async 1 $argv
    # else
    #     echo 'Expected output filename'
    # end
    # read -P 'Input dimension [3000x1920]: ' -l dimension
    # if string match -qr '^\d+x\d+$' -- "$dimension"
    #     # do nothing
    # else
    #     set dimension "1920x1080"
    #     echo 'Defaulting to 1920x1080'
    # end
    set -f dimension $(xdpyinfo | /usr/bin/grep dimensions | /usr/bin/grep -o -E '[0-9]+x[0-9]+ pixels' | cut -d' ' -f1)
    if test "$dimension" = '3000x1920'
        set -f display ':0.0+0,840'
        set -f video_size '1920x1050'
    else if test "$dimension" = '3840x1080'
        set -f display ':0.0+1920,0'
        set -f video_size '1920x1080'
    else
        set -f display ':0.0+0,0'
        set -f video_size '1920x1050'
    end
    set -f source       alsa_input.pci-0000_05_00.6.analog-stereo
    set -f sink         alsa_output.pci-0000_05_00.6.analog-stereo
    set -f sharednull   shared-null-sink
    set -f sharedsink   shared-sink
    set -f sharedsource shared-source

    read -P 'Input output filename [outfile.mp4]: ' -l outfile
    if test -z "$outfile"
        set outfile "outfile.mp4"
    end
    echo "Recording desktop [$display] to [$outfile]"
    
    begin
        # Create the null sink and loopback the input source into it
        pactl load-module module-null-sink sink_name="$sharednull" 
        pactl load-module module-loopback source="$source" sink="$sharednull" 

        # Create a virtual sink that splits all audio towards both the microphone sink and the output sink
        # Pipe any app you want to share with your input to this sink
        pactl load-module module-combine-sink slaves="$sharednull","$sink" sink_name="$sharedsink" sink_properties='device.description=Shared-Sink'

        # Create a virtual source monitoring the microphone sink to use within any app where you want audio input
        pactl load-module module-remap-source master="$sharednull.monitor" source_name="$sharedsource"  source_properties='device.description=Shared-Source'
    end 2> /dev/null > /dev/null
    
    sleep 2;

    ffmpeg -y \
        -f x11grab -video_size "$video_size" -thread_queue_size 16 -framerate 15 -i "$display" \
        -f pulse -i shared-source -ac 2 \
        -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $outfile
    #-c:v libx264 -crf 0 -preset ultrafast $outfile

    sleep 1;

    pactl list short modules | /usr/bin/grep "remap\|combine\|null" | cut -f1 | sort -r | xargs -L1 pactl unload-module
    # pactl list short modules | /usr/bin/grep "$sharedsink" | cut -f1 | xargs -L1 pactl unload-module
    # pactl list short modules | /usr/bin/grep "$sharedsource" | cut -f1 | xargs -L1 pactl unload-module
end
