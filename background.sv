module background(input Clk, Reset, frame_clk,
						input [9:0] DrawX, DrawY,
						output logic is_pond
						);

always_comb
begin
	if(DrawY <= 200)
		is_pond = 1'b1;
	else
		is_pond = 1'b0;
end



endmodule 