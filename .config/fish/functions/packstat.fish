function packstat
    if test (count $argv) -lt 1
        echo "Usage: packstat <interface> [interval_seconds]"
        return 1
    end

    set IFACE $argv[1]
    set INTERVAL $argv[2]

    function __get_packets --argument iface
        ethtool -S $iface 2>/dev/null | /usr/bin/grep -E "rx_packets:|tx_packets:" | awk -F" " '{print $2}'
    end

    # Initial read
    set pkt (__get_packets $IFACE)
    set RX_LAST $pkt[1]
    set TX_LAST $pkt[2]

    while true
        sleep $INTERVAL
        set pkt (__get_packets $IFACE)
        set RX_NOW $pkt[1]
        set TX_NOW $pkt[2]

        set RX_PPS (math "($RX_NOW - $RX_LAST) / $INTERVAL")
        set TX_PPS (math "($TX_NOW - $TX_LAST) / $INTERVAL")

        echo (date "+%H:%M:%S")" | $IFACE | RX: $RX_PPS pps | TX: $TX_PPS pps"

        set RX_LAST $RX_NOW
        set TX_LAST $TX_NOW
    end
end
