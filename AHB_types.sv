 import uvm_pkg::*;  `include "uvm_macros.svh"

 class AHB_types extends uvm_object;
 	


 	`uvm_object_utils(AHB_types)

 	typedef enum bit[1:0] {IDLE, BUSY, NONSEQ, SEQ} trans_t;
 	typedef enum bit[2:0] {SINGLE, INCR, WRAP4, INCR4, WRAP8, INCR8, WRAP16, INCR16} burst_t;
 	typedef enum bit {READ, WRITE} write_t;

 	function new (string name = "AHB_types");
 		super.new(name);
 	endfunction: new 

 endclass : AHB_types