set_global_assignment -entity "MAC_3" -library "lib_MAC_3" -name IP_TOOL_NAME "altera_mult_add"
set_global_assignment -entity "MAC_3" -library "lib_MAC_3" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "MAC_3" -library "lib_MAC_3" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_MAC_3" -name SPD_FILE [file join $::quartus(sip_path) "MAC_3.spd"]

set_global_assignment -library "lib_MAC_3" -name MISC_FILE [file join $::quartus(sip_path) "MAC_3_sim/MAC_3.v"]
