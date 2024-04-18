class AHB_slave_sequence_write extends uvm_sequence #(AHB_slave_transaction);

	`uvm_object_utils(AHB_slave_sequence_write)
	`uvm_declare_p_sequencer(AHB_slave_sequencer)


	function  void new (string name = "AHB_slave_sequence_write");
		super.new(name);
	endfunction: new

	task body();
		AHB_slave_transaction req;

		req = AHB_slave_sequencer::type_id::create("req");

		start_item(req);

		finish_item(req);
	endtask: body 

endclass: AHB_slave_sequence_write