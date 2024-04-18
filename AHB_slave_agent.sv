class AHB_slave_agent extends uvm_agent;

    AHB_slave_driver AHB_driver;
    AHB_slave_monitor AHB_monitor;
    AHB_slave_sequencer AHB_sequencer;

	`uvm_component_utils_begin(AHB_slave_agent)
		`uvm_feild_object(AHB_driver)
		`uvm_feild_object(AHB_monitor)
		`uvm_feild_object(AHB_sequencer)
	`uvm_component_utils_end

	virtual AHB_slave_if vif; 

	function void new (string name = "AHB_slave_agent", uvm_component parent);
		super.new(name, this);
	endfunction: new

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);

		AHB_driver = AHB_slave_driver::type_id::create("AHB_driver", this);
		AHB_monitor = AHB_slave_monitor::type_id::create("AHB_monitor", this);
		AHB_sequencer = AHB_slave_sequencer::type_id::create("AHB_sequencer", this);

		if(!uvm_config_db#(virtual AHB_slave_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("build_phase", "No virtual interface specified for this agent instance")
		end

		uvm_config_db #(virtual AHB_slave_if)::set(this, "AHB_driver", "vif", vif);
		uvm_config_db #(virtual AHB_slave_if)::set(this, "AHB_sequencer", "vif", vif);
		uvm_config_db #(virtual AHB_slave_if)::set(this, "AHB_monitor", "vif", vif);
		
	endfunction: build_phase

	virtual function void connect_phase (uvm_phase phase);
		AHB_driver.seq_item_port.connect(AHB_sequencer.seq_item_export);
		`uvm_info("AHB_agent", "connected driver to sequencer in connect phase")
	endfunction: connect_phase

endclass: AHB_slave_agent  