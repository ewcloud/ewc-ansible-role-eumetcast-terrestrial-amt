#!/usr/bin/env bash
# Checks log statements from the Tellicast Client and calculates reception metrics accordingly.
# IMPORTANT: Assumes log_level=verbose is set on files /etc/cast-client_ter-1.ini through /etc/cast-client_ter-5.ini

HIT="Delivered"
MISS="Missed"

LOG_DIR="/var/log/tellicast-client"
LOG_FILES=( "recv_ter-1.log" "recv_ter-2.log" "recv_ter-3.log" "recv_ter-4.log" "recv_ter-5.log" )


echo -e "FILENAME\tHITS\tMISSES\tHITRATE"

for logfile in "${LOG_FILES[@]}"; do
        hit_count=$(sudo grep -i "$HIT" "${LOG_DIR}/$logfile" --no-messages | wc -l)
        miss_count=$(sudo grep -i "$MISS" "${LOG_DIR}/$logfile" --no-messages | wc -l)

        if [[ "$hit_count" -eq 0 ]] && [[ "$miss_count" -eq 0 ]]; then
                hit_rate="N/A"
        else
                hit_rate=$(awk -v h="$hit_count" -v m="$miss_count" 'BEGIN { printf "%.2f", h/(h+m) }')
        fi

        echo -e "${logfile}\t${hit_count}\t${miss_count}\t${hit_rate}"
done