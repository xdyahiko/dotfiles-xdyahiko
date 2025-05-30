#!/usr/bin/env fish

while true
    if pgrep -x spotify > /dev/null
        if not pgrep -x cava > /dev/null
            foot --app-id cava -e fish -c cava &
        end
    else
        if pgrep -x cava > /dev/null
            pkill -x cava
        end
    end
    sleep 2
end
