module encoder(
	input clk,
	input reset,
	input x,
	input y,
	
	output reg [7:0] counter
);
	reg [3:0] state;
	reg [1:0] temp_x_y;
	wire [1:0] x_y;
	assign x_y = {x,y};
	always @(posedge clk)
	begin
		if(reset == 1'b1) begin
			state <= 0;
			counter <= 8'd0;
		end
		else begin	
			case(state)
				0: begin
					if(x_y == 2'b11) state <= 1;
				end
				1: begin
					if(x_y == 2'b11) state <= 2;
					else state <= 0;
				end
				2: begin
					case(x_y)
						2'b10: begin temp_x_y <= x_y; state <= 3; end
						2'b01: begin temp_x_y <= x_y; state <= 3; end
						default: state <= 2;
					endcase
				end
				3: begin
					if(temp_x_y == x_y) begin 
						case(x_y)
						2'b10: begin counter <= counter +1; end
						2'b01: begin counter <= counter -1; end
						endcase
						state <= 0;
					end
					else state <= 2;
				end
			endcase
		end
	end
endmodule	
