import uvm_pkg::*;  `include "uvm_macros.svh"



class AHB_slave_transaction extends  uvm_sequence_item;

	logic [31:0] HADDR; // MODIFY THIS TO SUIT THE DUT =>>> better add a define block here
    logic [1:0] HTRANS; // 00 = IDLE / 01 = BUSY / 10 = non-seq / 11 = seq // 
	logic [2:0] HSIZE;  // 000 = byte / 001 = 2 bytes / 010 = 4 bytes
  	logic HWRITE; // low = read mode / HIGH = write mode 
  	logic [31:0] HWDATA; // MODIFY THIS TO SUIT THE DUT 
	logic HREADY; // from subordinate	
	logic [2:0] HBRUST; // WHICH TYPE OF BRUST IS USING INCR / WARP / ...

	logic HREADYOUT; 
	logic [1:0] HRESP; // LOW = ok / HIGH = ERROR => need to check this
	logic [31:0] HRDATA; // DATA FEEDBACK FROM SLAVE

	`uvm_object_utils_begin(AHB_slave_transaction)
		`uvm_field_int(HADDR, UVM_ALL_ON) // depend on the signals
		`uvm_field_int(HTRANS, UVM_ALL_ON)
		`uvm_field_int(HSIZE, UVM_ALL_ON)
		`uvm_field_int(HWRITE, UVM_ALL_ON)
		`uvm_field_int(HWDATA, UVM_ALL_ON)
		`uvm_field_int(HREADY, UVM_ALL_ON)
		`uvm_field_int(HBRUST, UVM_ALL_ON)
		`uvm_field_int(HREADYOUT, UVM_ALL_ON)
		`uvm_field_int(HRESP, UVM_ALL_ON)
		`uvm_field_int(HRDATA, UVM_ALL_ON)
	`uvm_object_utils_end

	function new (string name = "AHB_slave_transaction");
		super.new(name);
	endfunction: new	

endclass : AHB_slave_transaction