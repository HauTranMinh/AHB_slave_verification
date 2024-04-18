import uvm_pkg::*;  `include "uvm_macros.svh"

class AHB_slave_sequencer extends uvm_sequencer;
 
	`uvm_component_utils(AHB_slave_sequencer)

	function new (string name = "AHB_slave_sequencer", uvm_component parent);
		super.new(name, this);
	endfunction: new

	function build_phase (uvm_phase phase);
		super.build_phase(phase);
	endfunction: build_phase

endclass: AHB_slave_sequencer