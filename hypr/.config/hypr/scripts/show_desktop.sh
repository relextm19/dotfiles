#!/bin/bash

# Configuration
# We create a unique "hidden" workspace name based on the current workspace ID.
# This ensures that if you hide windows on Workspace 1, they don't accidentally 
# get restored onto Workspace 2.
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')
hidden_workspace="special:hiddendesktop_${active_workspace_id}"

# Get the number of windows on the current active workspace
client_count=$(hyprctl activeworkspace -j | jq '.windows')

if [ "$client_count" -gt 0 ]; then
    # CASE 1: The workspace has windows. HIDE THEM.
    # ---------------------------------------------
    # Get list of all window addresses on the current workspace
    # and move them silently to the hidden special workspace.
    
    hyprctl clients -j | jq -r ".[] | select(.workspace.id == $active_workspace_id) | .address" | while read -r addr; do
        hyprctl dispatch movetoworkspacesilent "$hidden_workspace,address:$addr"
    done

else
    # CASE 2: The workspace is empty. RESTORE WINDOWS.
    # ------------------------------------------------
    # Find all windows that are sitting in our specific hidden workspace
    # and move them back to the active workspace.
    
    hyprctl clients -j | jq -r ".[] | select(.workspace.name == \"$hidden_workspace\") | .address" | while read -r addr; do
        hyprctl dispatch movetoworkspacesilent "$active_workspace_id,address:$addr"
    done
fi
