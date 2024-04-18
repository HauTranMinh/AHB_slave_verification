import uvm_pkg::*;  `include "uvm_macros.svh"

//import AHB_slave_pkg::*; 
`include "C:/Users/LENOVO/Desktop/AHB/AHB_slave/AHB_slave_transaction.sv";
`include "C:/Users/LENOVO/Desktop/AHB/AHB_slave/AHB_slave_sequencer.sv";

class AHB_slave_sequence_read extends uvm_sequence ;

	// declare variables here

	`uvm_object_utils(AHB_slave_sequence_read)

	`uvm_declare_p_sequencer(AHB_slave_sequencer)

	function new (string name = "AHB_slave_sequence");
		super.new(name);

	endfunction: new
	
		

	task body ();
		AHB_slave_transaction req;

		req = AHB_slave_transaction::type_id::create("req");

		// dont need to repeat

		start_item(req);

		// there is no rand in transaction

		finish_item(req);

	endtask: body 


endclass: AHB_slave_sequence_read
