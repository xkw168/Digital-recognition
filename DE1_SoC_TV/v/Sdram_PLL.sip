set_global_assignment -entity "Sdram_PLL" -library "lib_Sdram_PLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "Sdram_PLL" -library "lib_Sdram_PLL" -name IP_TOOL_VERSION "13.1"
set_global_assignment -entity "Sdram_PLL" -library "lib_Sdram_PLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_Sdram_PLL" -name SPD_FILE [file join $::quartus(sip_path) "Sdram_PLL.spd"]

set_global_assignment -library "lib_Sdram_PLL" -name MISC_FILE [file join $::quartus(sip_path) "Sdram_PLL_sim/Sdram_PLL.vo"]
