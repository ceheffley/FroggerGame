module  color_mapper ( input              is_frog, is_font,
							  input			[1:0]		is_timer,
							  input			[1:0]		is_turtle_up [4:0],
							  input			[4:0]		isFinish, FrogFinished, TurtleEnabled, frog_data_out,
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  input			[4:0][3:0] isCar, isLog,
							  input			[4:0][3:0][4:0] car_data_out, log_data_out,
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
    
	 logic [0:20][23:0] color_palette = {{24'hff0000}, {24'hffe0a8}, {24'hffe0a8}, {24'h4b3100}, {24'hffe0a8}, {24'hffe0a8}, {24'hfcfcfc}, {24'haeacae}, {24'h398802}, {24'h398802}, {24'h398802}, {24'h398802}, {24'hf0bc3c}, {24'haeacae}, {24'h3a3701}, {24'h6c6c01}, {24'h398802}, {24'h7ec50e}, {24'h398802}, {24'h65b0ff}, {24'h65b0ff}};
	 
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
    always_comb
    begin
			if(is_font == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if ((is_frog == 1'b1) && (frog_data_out != 5'b0)) 
			begin
            // White ball
            Red = color_palette[frog_data_out][23:16];
            Green = color_palette[frog_data_out][15:8];
            Blue = color_palette[frog_data_out][7:0];
			end
			else if(is_timer[0])
			begin
				if(is_timer[1])
				begin
					Red = 8'hfc;
					Green = 8'hd7;
					Blue = 8'h03;
				end
				else
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
			end
			else if(DrawX <= 124)
			begin
				Red = 8'h97; 
				Green = 8'h97;
				Blue = 8'h97;
			end
			else if(DrawX >= 544)
			begin
				Red = 8'h97; 
				Green = 8'h97;
				Blue = 8'h97;
			end
			else if(DrawY <= 75)
			begin
				Red = 8'h97; 
				Green = 8'h97;
				Blue = 8'h97;
			end
			else if(DrawY >= 440)
			begin
				Red = 8'h97; 
				Green = 8'h97;
				Blue = 8'h97;
			end
			else if ((isCar[0] != 4'b0000)||(isCar[1] != 4'b0000)||(isCar[2] != 4'b0000)||(isCar[3] != 4'b0000)||(isCar[4] != 4'b0000))
			begin
				if(isCar[0] != 4'b0000)
				begin
					case(isCar[0])
						4'b0001:
						begin
							if(car_data_out[0][0] != 5'b0)
							begin
								Red = color_palette[car_data_out[0][0]][23:16];
								Green = color_palette[car_data_out[0][0]][15:8];
								Blue = color_palette[car_data_out[0][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0010:
						begin
							if(car_data_out[0][1] != 5'b0)
							begin
								Red = color_palette[car_data_out[0][1]][23:16];
								Green = color_palette[car_data_out[0][1]][15:8];
								Blue = color_palette[car_data_out[0][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0100:
						begin
							if(car_data_out[0][2] != 5'b0)
							begin
								Red = color_palette[car_data_out[0][2]][23:16];
								Green = color_palette[car_data_out[0][2]][15:8];
								Blue = color_palette[car_data_out[0][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b1000:
						begin
							if(car_data_out[0][3] != 5'b0)
							begin
								Red = color_palette[car_data_out[0][3]][23:16];
								Green = color_palette[car_data_out[0][3]][15:8];
								Blue = color_palette[car_data_out[0][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'h00;
							Green = 8'h00;
						end
					endcase
				end
				else if(isCar[1] != 4'b0000)
				begin
					case(isCar[1])
						4'b0001:
						begin
							if(car_data_out[1][0] != 5'b0)
							begin
								Red = color_palette[car_data_out[1][0]][23:16];
								Green = color_palette[car_data_out[1][0]][15:8];
								Blue = color_palette[car_data_out[1][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0010:
						begin
							if(car_data_out[1][1] != 5'b0)
							begin
								Red = color_palette[car_data_out[1][1]][23:16];
								Green = color_palette[car_data_out[1][1]][15:8];
								Blue = color_palette[car_data_out[1][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0100:
						begin
							if(car_data_out[1][2] != 5'b0)
							begin
								Red = color_palette[car_data_out[1][2]][23:16];
								Green = color_palette[car_data_out[1][2]][15:8];
								Blue = color_palette[car_data_out[1][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b1000:
						begin
							if(car_data_out[1][3] != 5'b0)
							begin
								Red = color_palette[car_data_out[1][3]][23:16];
								Green = color_palette[car_data_out[1][3]][15:8];
								Blue = color_palette[car_data_out[1][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'h00;
							Green = 8'h00;
						end
					endcase
				end
				else if(isCar[2] != 4'b0000)
				begin
					case(isCar[2])
						4'b0001:
						begin
							if(car_data_out[2][0] != 5'b0)
							begin
								Red = color_palette[car_data_out[2][0]][23:16];
								Green = color_palette[car_data_out[2][0]][15:8];
								Blue = color_palette[car_data_out[2][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0010:
						begin
							if(car_data_out[2][1] != 5'b0)
							begin
								Red = color_palette[car_data_out[2][1]][23:16];
								Green = color_palette[car_data_out[2][1]][15:8];
								Blue = color_palette[car_data_out[2][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0100:
						begin
							if(car_data_out[2][2] != 5'b0)
							begin
								Red = color_palette[car_data_out[2][2]][23:16];
								Green = color_palette[car_data_out[2][2]][15:8];
								Blue = color_palette[car_data_out[2][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b1000:
						begin
							if(car_data_out[2][3] != 5'b0)
							begin
								Red = color_palette[car_data_out[2][3]][23:16];
								Green = color_palette[car_data_out[2][3]][15:8];
								Blue = color_palette[car_data_out[2][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'h00;
							Green = 8'h00;
						end
					endcase
				end
				else if(isCar[3] != 4'b0000)
				begin
					case(isCar[3])
						4'b0001:
						begin
							if(car_data_out[3][0] != 5'b0)
							begin
								Red = color_palette[car_data_out[3][0]][23:16];
								Green = color_palette[car_data_out[3][0]][15:8];
								Blue = color_palette[car_data_out[3][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0010:
						begin
							if(car_data_out[3][1] != 5'b0)
							begin
								Red = color_palette[car_data_out[3][1]][23:16];
								Green = color_palette[car_data_out[3][1]][15:8];
								Blue = color_palette[car_data_out[3][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0100:
						begin
							if(car_data_out[3][2] != 5'b0)
							begin
								Red = color_palette[car_data_out[3][2]][23:16];
								Green = color_palette[car_data_out[3][2]][15:8];
								Blue = color_palette[car_data_out[3][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b1000:
						begin
							if(car_data_out[3][3] != 5'b0)
							begin
								Red = color_palette[car_data_out[3][3]][23:16];
								Green = color_palette[car_data_out[3][3]][15:8];
								Blue = color_palette[car_data_out[3][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'h00;
							Green = 8'h00;
						end
					endcase
				end
				else 
				begin
					case(isCar[4])
						4'b0001:
						begin
							if(car_data_out[4][0] != 5'b0)
							begin
								Red = color_palette[car_data_out[4][0]][23:16];
								Green = color_palette[car_data_out[4][0]][15:8];
								Blue = color_palette[car_data_out[4][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0010:
						begin
							if(car_data_out[4][1] != 5'b0)
							begin
								Red = color_palette[car_data_out[4][1]][23:16];
								Green = color_palette[car_data_out[4][1]][15:8];
								Blue = color_palette[car_data_out[4][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b0100:
						begin
							if(car_data_out[4][2] != 5'b0)
							begin
								Red = color_palette[car_data_out[4][2]][23:16];
								Green = color_palette[car_data_out[4][2]][15:8];
								Blue = color_palette[car_data_out[4][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						4'b1000:
						begin
							if(car_data_out[4][3] != 5'b0)
							begin
								Red = color_palette[car_data_out[4][3]][23:16];
								Green = color_palette[car_data_out[4][3]][15:8];
								Blue = color_palette[car_data_out[4][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'h00;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'h00;
							Green = 8'h00;
						end
					endcase
				end
			end
			else if ((isLog[0] != 4'b0000)||(isLog[1] != 4'b0000)||(isLog[2] != 4'b0000)||(isLog[3] != 4'b0000)||(isLog[4] != 4'b0000))
			begin
				if(isLog[0] != 4'b0000)
				begin
					case(isLog[0])
						4'b0001:
						begin
							if(log_data_out[0][0] != 5'b0)
							begin
								Red = color_palette[log_data_out[0][0]][23:16];
								Green = color_palette[log_data_out[0][0]][15:8];
								Blue = color_palette[log_data_out[0][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0010:
						begin
							if(log_data_out[0][1] != 5'b0)
							begin
								Red = color_palette[log_data_out[0][1]][23:16];
								Green = color_palette[log_data_out[0][1]][15:8];
								Blue = color_palette[log_data_out[0][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0100:
						begin
							if(log_data_out[0][2] != 5'b0)
							begin
								Red = color_palette[log_data_out[0][2]][23:16];
								Green = color_palette[log_data_out[0][2]][15:8];
								Blue = color_palette[log_data_out[0][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b1000:
						begin
							if(log_data_out[0][3] != 5'b0)
							begin
								Red = color_palette[log_data_out[0][3]][23:16];
								Green = color_palette[log_data_out[0][3]][15:8];
								Blue = color_palette[log_data_out[0][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'hff;
							Green = 8'h00;
						end
					endcase
				end
				else if(isLog[1] != 4'b0000)
				begin
					case(isLog[1])
						4'b0001:
						begin
							if(log_data_out[1][0] != 5'b0)
							begin
								Red = color_palette[log_data_out[1][0]][23:16];
								Green = color_palette[log_data_out[1][0]][15:8];
								Blue = color_palette[log_data_out[1][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0010:
						begin
							if(log_data_out[1][1] != 5'b0)
							begin
								Red = color_palette[log_data_out[1][1]][23:16];
								Green = color_palette[log_data_out[1][1]][15:8];
								Blue = color_palette[log_data_out[1][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0100:
						begin
							if(log_data_out[1][2] != 5'b0)
							begin
								Red = color_palette[log_data_out[1][2]][23:16];
								Green = color_palette[log_data_out[1][2]][15:8];
								Blue = color_palette[log_data_out[1][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b1000:
						begin
							if(log_data_out[1][3] != 5'b0)
							begin
								Red = color_palette[log_data_out[1][3]][23:16];
								Green = color_palette[log_data_out[1][3]][15:8];
								Blue = color_palette[log_data_out[1][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'hff;
							Green = 8'h00;
						end
					endcase
				end
				else if(isLog[2] != 4'b0000)
				begin
					case(isLog[2])
						4'b0001:
						begin
							if(log_data_out[2][0] != 5'b0)
							begin
								Red = color_palette[log_data_out[2][0]][23:16];
								Green = color_palette[log_data_out[2][0]][15:8];
								Blue = color_palette[log_data_out[2][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0010:
						begin
							if(log_data_out[2][1] != 5'b0)
							begin
								Red = color_palette[log_data_out[2][1]][23:16];
								Green = color_palette[log_data_out[2][1]][15:8];
								Blue = color_palette[log_data_out[2][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0100:
						begin
							if(log_data_out[2][2] != 5'b0)
							begin
								Red = color_palette[log_data_out[2][2]][23:16];
								Green = color_palette[log_data_out[2][2]][15:8];
								Blue = color_palette[log_data_out[2][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b1000:
						begin
							if(log_data_out[2][3] != 5'b0)
							begin
								Red = color_palette[log_data_out[2][3]][23:16];
								Green = color_palette[log_data_out[2][3]][15:8];
								Blue = color_palette[log_data_out[2][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'hff;
							Green = 8'h00;
						end
					endcase
				end
				else if(isLog[3] != 4'b0000)
				begin
					case(isLog[3])
						4'b0001:
						begin
							if(log_data_out[3][0] != 5'b0)
							begin
								Red = color_palette[log_data_out[3][0]][23:16];
								Green = color_palette[log_data_out[3][0]][15:8];
								Blue = color_palette[log_data_out[3][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0010:
						begin
							if(log_data_out[3][1] != 5'b0)
							begin
								Red = color_palette[log_data_out[3][1]][23:16];
								Green = color_palette[log_data_out[3][1]][15:8];
								Blue = color_palette[log_data_out[3][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0100:
						begin
							if(log_data_out[3][2] != 5'b0)
							begin
								Red = color_palette[log_data_out[3][2]][23:16];
								Green = color_palette[log_data_out[3][2]][15:8];
								Blue = color_palette[log_data_out[3][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b1000:
						begin
							if(log_data_out[3][3] != 5'b0)
							begin
								Red = color_palette[log_data_out[3][3]][23:16];
								Green = color_palette[log_data_out[3][3]][15:8];
								Blue = color_palette[log_data_out[3][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'hff;
							Green = 8'h00;
						end
					endcase
				end
				else 
				begin
					case(isLog[4])
						4'b0001:
						begin
							if(log_data_out[4][0] != 5'b0)
							begin
								Red = color_palette[log_data_out[4][0]][23:16];
								Green = color_palette[log_data_out[4][0]][15:8];
								Blue = color_palette[log_data_out[4][0]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0010:
						begin
							if(log_data_out[4][1] != 5'b0)
							begin
								Red = color_palette[log_data_out[4][1]][23:16];
								Green = color_palette[log_data_out[4][1]][15:8];
								Blue = color_palette[log_data_out[4][1]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b0100:
						begin
							if(log_data_out[4][2] != 5'b0)
							begin
								Red = color_palette[log_data_out[4][2]][23:16];
								Green = color_palette[log_data_out[4][2]][15:8];
								Blue = color_palette[log_data_out[4][2]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						4'b1000:
						begin
							if(log_data_out[4][3] != 5'b0)
							begin
								Red = color_palette[log_data_out[4][3]][23:16];
								Green = color_palette[log_data_out[4][3]][15:8];
								Blue = color_palette[log_data_out[4][3]][7:0];
							end
							else
							begin
								Red = 8'h00;
								Green = 8'h00;
								Blue = 8'hff;
							end
						end
						default: 
						begin
							Red = 8'h00;
							Blue = 8'hff;
							Green = 8'h00;
						end
					endcase
				end
			end
			else if (isFinish != 5'b00000)
			begin
				if((isFinish[0] && FrogFinished[0]) || (isFinish[1] && FrogFinished[1]) || (isFinish[2] && FrogFinished[2]) || (isFinish[3] && FrogFinished[3]) || (isFinish[4] && FrogFinished[4]))
				begin
					Red = 8'h00;
					Green = 8'hff;
					Blue = 8'h00;
				end
				else
				begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
			end
			else if (DrawY < 244)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else
			begin
				Red = 8'h00; 
				Green = 8'h00;
				Blue = 8'h00;
			end
    end 
    
endmodule
