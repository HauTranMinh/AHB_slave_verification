interface AHB_slave_if (); // need to see the DUT to get this correct
//===========================INPUT PORT================================//
	logic HCLK; // global signal => using raising edge clock
	logic HRESETn; // reset active low => only signal active low 
	logic HSEL; // select signal => come from master => input of this
	logic [31:0] HADDR; // MODIFY THIS TO SUIT THE DUT =>>> better add a define block here
    logic [1:0] HTRANS; // 00 = IDLE / 01 = BUSY / 10 = non-seq / 11 = seq // 
	logic [2:0] HSIZE;  // 000 = byte / 001 = 2 bytes / 010 = 4 bytes
  	logic HWRITE; // low = read mode / HIGH = write mode
  	logic [31:0] HWDATA; // MODIFY THIS TO SUIT THE DUT 
	logic HREADY; // from subordinate	
	logic [2:0] HBRUST; // WHICH TYPE OF BRUST IS USING INCR / WARP / ...
//===========================OUTPUT PORT================================//
	logic HREADYOUT;
	logic [1:0] HRESP; // LOW = ok / HIGH = ERROR => need to check this
	logic [31:0] HRDATA; // DATA FEEDBACK FROM SLAVE

//	logic [31:0] length;
	
endinterface


 

