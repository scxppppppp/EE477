`timescale 1ns / 1p
module booth_mult#(parameter D_IN=8)(
     input clk,
	 input rst_n,
	 
	 input start,
	 input [D_IN-1:0]mul_A,
	 input [D_IN-1:0]mul_B,
	 
	 output reg done,
	 output reg [2*D_IN-1:0]Product	 
);
	 
	 reg [1:0]					state;
	 reg [2*D_IN-1:0]			mult_A;  // result of mul_A
	 reg [D_IN:0]				mult_B;  // result of mul_A
	 reg [2*D_IN-1:0]			inv_A;  // reverse result of mul_A
	 reg  [2*D_IN-1:0]			result_tmp;  // operation register 
	 wire [1:0]					booth_code;
	 assign booth_code = mult_B[1:0];
	 assign stop=(~|mult_B)||(&mult_B);

	 always @ ( posedge clk or negedge rst_n )
		if( !rst_n ) begin
			state <= 0;
			mult_A <= 0;
			inv_A <= 0;
			result_tmp  <= 0;
			done <= 0;
			Product<=0;
		end
		else if( start )
			case( state )	
				0: begin 
					mult_A <= {{D_IN{mul_A[D_IN-1]}},mul_A}; 
					inv_A <= ~{{D_IN{mul_A[D_IN-1]}},mul_A} + 1'b1 ; 
					result_tmp <= 0; 
					mult_B <= {mul_B,1'b0};
					state <= state + 1'b1; 
				end
				1: begin
					if(~stop) begin 
 						case(booth_code)
							2'b01 : result_tmp <= result_tmp + mult_A;
							2'b10 : result_tmp <= result_tmp + inv_A;
							default: result_tmp <= result_tmp;
						endcase 
						mult_A <= {mult_A[14:0],1'b0};
						inv_A <=  {inv_A[14:0],1'b0};
						mult_B <= {mult_B[8],mult_B[8:1]};
					end
					else 
						state <= state + 1'b1;
				end
				2:begin
					done<=1'b1;
					Product<= result_tmp;
					state <= state+1;
				end
				3: begin
					done<=1'b0;
					state<=0;
				end
			endcase
endmodule


