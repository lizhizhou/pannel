module epl_bus_to_io(
	// EPL interface
	input  EPL_SCLK,	
	input  EPL_SDI,	
	output reg EPL_SDO,		
	input  EPL_SLE,		
	output  EPL_SRDY,
	// IO interface
	input  [31:0] port_i,
	output reg [31:0] port_o
);	
	reg [63:0] data_buffer;
	always@(posedge EPL_SCLK)
	begin
		if(EPL_SLE == 1'b1) begin
			integer i;
			EPL_SDO <= data_buffer[63];
			for(i=0;i<63;i=i+1)
				data_buffer[i+1] <= data_buffer[i];
			data_buffer[0]<= EPL_SDI;	
		end else
		begin
			port_o <= data_buffer[63:32];
			data_buffer[31:0] <= port_i;
		end
		
	end
endmodule 