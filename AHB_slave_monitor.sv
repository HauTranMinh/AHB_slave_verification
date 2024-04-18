
import uvm_pkg::*;  `include "uvm_macros.svh"

class AHB_slave_monitor extends uvm_monitor;

	`uvm_component_utils(AHB_slave_monitor)

	virtual AHB_slave_if vif;

	function new (string name = "AHB_slave_monitor", uvm_component parent);
		super.new(name, this);
	endfunction: new 

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual AHB_slave_monitor)::get(this, "", "vif", vif)) begin
			`uvm_fatal("build_phase", "No virtual interface specified for this monitor intance")
		end
	endfunction: build_phase

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);

		forever begin
			// put sth here
		end
	endtask : run_phase

endclass : AHB_slave_monitor