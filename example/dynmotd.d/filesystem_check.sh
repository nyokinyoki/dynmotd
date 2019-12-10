# mounts

function dots {
        # $1 is mount string
        let DOTNUM=19-${#1}
        DOTSTR=$(printf '%.0s.' $(seq $DOTNUM))
}

echo "===== Mounts ================================================================="
df | grep ^/dev | tr -s " " | cut -d " " -f 6 | while read -r MOUNT
do
        dots "$MOUNT"
        MOUNT_VAL=$(df -Ph | grep "$MOUNT$" | awk '{print $4, "-",$5}' | tr -d '\n')
        echo -e " $COLOR_COLUMN- $MOUNT$RESET_COLORS$DOTSTR: $COLOR_VALUE ${MOUNT_VAL} (avail-use%) $RESET_COLORS"
done
