#!/usr/bin/env bash
# Checks log statements from the Tellicast Client and calculates reception metrics over the last 24 hours.
#
# IMPORTANT: Assumes log_level=verbose is set on files /etc/cast-client_ter-1.ini through /etc/cast-client_ter-5.ini
#
# NOTE: Log timestamp in format "YYYY-MM-DD HH:MM:SS[.mmm]" expected after the level prefix, for example:
#       "MSG:2026-09-14 11:37:29.234:Delivered all 3 files of filelist 1bc52be2000b2e62 from channel `T02-S6A-01'"

HIT="Delivered"
MISS="Missed"

LOG_DIR="/var/log/tellicast-client"
LOG_FILES=( "recv_ter-1.log" "recv_ter-2.log" "recv_ter-3.log" "recv_ter-4.log" "recv_ter-5.log" )
CUTOFF=$(date -d '24 hours ago' '+%Y-%m-%d %H:%M:%S')

echo -e "FILENAME\tHITS\tMISSES\tHITRATE"

for logfile in "${LOG_FILES[@]}"; do
    fullpath="${LOG_DIR}/${logfile}"

    read -r hit_count miss_count < <(
        sudo awk -v cutoff="$CUTOFF" -v hit_pattern="$HIT" -v miss_pattern="$MISS" '
        BEGIN {
            hits = 0
            misses = 0
        }
        {
            # Extract the first colon, then the timestamp (19 chars long)
            colon = index($0, ":")
            if (colon == 0) next
            ts = substr($0, colon + 1, 19)

            # Validate that the extracted timestamp has correct format
            if (ts !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$/) next

            if (ts >= cutoff) {
                lower = tolower($0)
                if (lower ~ tolower(hit_pattern))  hits++
                if (lower ~ tolower(miss_pattern)) misses++
            }
        }
        END {
            print hits + 0, misses + 0
        }
        ' "$fullpath" 2>/dev/null || echo "0 0"
    )

    if [[ "$hit_count" -eq 0 && "$miss_count" -eq 0 ]]; then
        hit_rate="N/A"
    else
        hit_rate=$(awk -v h="$hit_count" -v m="$miss_count" 'BEGIN { printf "%.2f", h/(h+m) }')
    fi

    echo -e "${logfile}\t${hit_count}\t${miss_count}\t${hit_rate}"
done