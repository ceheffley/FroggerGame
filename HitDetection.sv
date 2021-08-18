module HitDetection(input is_frog,
						  input [4:0][3:0] isCar,
						  input [7:0] TimeLeft,
						  output is_dead);

always_comb
begin
	if((is_frog && ((isCar[0] != 4'b0000)||(isCar[1] != 4'b0000)||(isCar[2] != 4'b0000)||(isCar[3] != 4'b0000)||(isCar[4] != 4'b0000))) || (TimeLeft == 8'h00)) 
		is_dead = 1'b1;
	else
		is_dead = 1'b0;
end



endmodule 