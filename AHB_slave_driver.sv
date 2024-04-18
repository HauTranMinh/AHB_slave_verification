class AHB_slave_driver extends uvm_driver #(AHB_slave_transaction);

	`uvm_component_utils(AHB_slave_driver)
	virtual AHB_slave_if vif;
	// declare TLM port to double check here

	function void new (string name = "AHB_slave_driver", uvm_component parent);
		super.new(name, parent);
	endfunction: new

// ===========================================================================//
// ==============================BUILD PHASE==================================//
// ===========================================================================//

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db #(virtual AHB_slave_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("build_phase", "driver virtual interface failed")
		end
	endfunction: build_phase

// ===========================================================================//
// ================================RUN PHASE==================================//
// ===========================================================================//

	virtual task run_phase(uvm_phase phase);
		super.build_phase(phase);
		initial_val();

		forever begin
			wait(vif.HRESETn == 0);
			case (state)
				// fsm for slave AHB protocol
				default : `uvm_error("AHB_slave_driver", "unexpected transfer state!!!");
			endcase
		end	
	endtask: run_phase

	// need to check this
	task initial_val();
		vif.HREADYOUT = 0;
		vif.HRESP = 0;
		vif.HRDATA = 0;
	endtask: initial_val

endclass: AHB_slave_driver