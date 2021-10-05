#!/bin/sh

# To add new keyboard, append a "sub()" line for each



swaymsg -t get_inputs | jq -r \
    "first(.[]|select(.identifier == \"$1\" and .type == \"keyboard\")) \
    | .xkb_active_layout_name \
    | sub(\"English \\\(intl., with AltGr dead keys\\\)\"; \"US\") \
    | sub(\"English \\\(US, intl., with dead keys\\\)\"; \"FR\") \
    | sub(\"English French\"; \"EF\")"

swaymsg -mrt subscribe '["input"]' | jq -r --unbuffered \
    "select(.change == \"xkb_layout\")
    | .input
    | select(.identifier == \"$1\" and .type == \"keyboard\") \
    | .xkb_active_layout_name \
    | sub(\"English \\\(intl., with AltGr dead keys\\\)\"; \"US\") \
    | sub(\"English \\\(US, intl., with dead keys\\\)\"; \"FR\") \
    | sub(\"English French\"; \"EF\")"
