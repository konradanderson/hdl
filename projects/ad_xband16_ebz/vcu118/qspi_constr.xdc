################################################################################
# Copyright (C) 2025 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# DUAL QUAD SPI constraints from PG153

#STARTUPE3 (UltraScale+) primitive included inside IP:
# Following are the SPI device parameters

# Max Tco

# Min Tco

# Setup time requirement

# Hold time requirement

# Following are the board/trace delay numbers
# Assumption is that all Data lines are matched



#Can loosen these for timing closure


#Can loosen these for timing closure

#Unclear if Xilinx thinks you actually need these constraints now. Will put in place but leave looser... 1ns default is a little nuts.
create_generated_clock -name clk_sck -source [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk] -edges {3 5 7} [get_pins -hierarchical */CCLK]
set_input_delay -clock clk_sck -clock_fall -max 7.450 [get_pins -hierarchical {*STARTUP*/DATA_IN[*]}]
set_input_delay -clock clk_sck -clock_fall -min 1.450 [get_pins -hierarchical {*STARTUP*/DATA_IN[*]}]
set_multicycle_path -setup -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] 3
set_multicycle_path -hold -end -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] 2
set_output_delay -clock clk_sck -max 2.550 [get_pins -hierarchical {*STARTUP*/DATA_OUT[*]}]
set_output_delay -clock clk_sck -min -1.950 [get_pins -hierarchical {*STARTUP*/DATA_OUT[*]}]
set_multicycle_path -setup -start -from [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] -to clk_sck 3
set_multicycle_path -hold -from [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] -to clk_sck 2
set_max_delay -datapath_only -from [get_pins -hier {*STARTUP*_inst/DI[*]}] 2.00 -quiet
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] -to [get_pins -hier *STARTUP*_inst/USRCCLKO] 2.00 -quiet
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] -to [get_pins -hier {*STARTUP*_inst/DO[*]}] 2.00 -quiet
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk]] -to [get_pins -hier {*STARTUP*_inst/DTS[*]}] 2.00 -quiet

#Set_max_delay constraints are automatically applied in Vivado 2020.1 onwards
#Set multicycle constraints may be removed or updated on getting timing violations. We are removing to see if it helps.

