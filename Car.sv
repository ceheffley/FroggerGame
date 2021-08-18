module CarRow(input       	Clk,              
									Reset,              
									frame_clk_rising_edge, 
									CarDirection,
									GoNextLevel,
				  input [1:0]  CarNumber,
				  input [2:0]  RowNumber,
				  input [9:0]	CarSpeed, Offset1, Offset2, Offset3, Offset4,
				  input [9:0]  DrawX, DrawY,
				  output logic	[3:0] is_car_row,
				  output logic [3:0][4:0] car_data_out);

	logic [9:0] Car_Y_Center [3:0];

	always_comb
	begin
		case(RowNumber)
			3'b000: 
			begin
				if(CarNumber == 2'b00)
				begin
					Car_Y_Center[0] = 10'd384;
					Car_Y_Center[1] = 10'd0;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b01)
				begin
					Car_Y_Center[0] = 10'd384;
					Car_Y_Center[1] = 10'd384;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b10)
				begin
					Car_Y_Center[0] = 10'd384;
					Car_Y_Center[1] = 10'd384;
					Car_Y_Center[2] = 10'd384;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b11)
				begin
					Car_Y_Center[0] = 10'd384;
					Car_Y_Center[1] = 10'd384;
					Car_Y_Center[2] = 10'd384;
					Car_Y_Center[3] = 10'd384;
				end
			end
			3'b001: 
			begin
				if(CarNumber == 2'b00)
				begin
					Car_Y_Center[0] = 10'd356;
					Car_Y_Center[1] = 10'd0;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b01)
				begin
					Car_Y_Center[0] = 10'd356;
					Car_Y_Center[1] = 10'd356;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b10)
				begin
					Car_Y_Center[0] = 10'd356;
					Car_Y_Center[1] = 10'd356;
					Car_Y_Center[2] = 10'd356;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b11)
				begin
					Car_Y_Center[0] = 10'd356;
					Car_Y_Center[1] = 10'd356;
					Car_Y_Center[2] = 10'd356;
					Car_Y_Center[3] = 10'd356;
				end
			end
			3'b010: 
			begin
				if(CarNumber == 2'b00)
				begin
					Car_Y_Center[0] = 10'd328;
					Car_Y_Center[1] = 10'd0;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b01)
				begin
					Car_Y_Center[0] = 10'd328;
					Car_Y_Center[1] = 10'd328;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b10)
				begin
					Car_Y_Center[0] = 10'd328;
					Car_Y_Center[1] = 10'd328;
					Car_Y_Center[2] = 10'd328;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b11)
				begin
					Car_Y_Center[0] = 10'd328;
					Car_Y_Center[1] = 10'd328;
					Car_Y_Center[2] = 10'd328;
					Car_Y_Center[3] = 10'd328;
				end
			end
			3'b011: 
			begin
				if(CarNumber == 2'b00)
				begin
					Car_Y_Center[0] = 10'd300;
					Car_Y_Center[1] = 10'd0;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b01)
				begin
					Car_Y_Center[0] = 10'd300;
					Car_Y_Center[1] = 10'd300;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b10)
				begin
					Car_Y_Center[0] = 10'd300;
					Car_Y_Center[1] = 10'd300;
					Car_Y_Center[2] = 10'd300;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b11)
				begin
					Car_Y_Center[0] = 10'd300;
					Car_Y_Center[1] = 10'd300;
					Car_Y_Center[2] = 10'd300;
					Car_Y_Center[3] = 10'd300;
				end
			end
			3'b100: 
			begin
				if(CarNumber == 2'b00)
				begin
					Car_Y_Center[0] = 10'd272;
					Car_Y_Center[1] = 10'd0;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b01)
				begin
					Car_Y_Center[0] = 10'd272;
					Car_Y_Center[1] = 10'd272;
					Car_Y_Center[2] = 10'd0;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b10)
				begin
					Car_Y_Center[0] = 10'd272;
					Car_Y_Center[1] = 10'd272;
					Car_Y_Center[2] = 10'd272;
					Car_Y_Center[3] = 10'd0;
				end
				else if (CarNumber == 2'b11)
				begin
					Car_Y_Center[0] = 10'd272;
					Car_Y_Center[1] = 10'd272;
					Car_Y_Center[2] = 10'd272;
					Car_Y_Center[3] = 10'd272;
				end
			end
			default:
			begin
				Car_Y_Center[0] = 10'd0;
				Car_Y_Center[1] = 10'd0;
				Car_Y_Center[2] = 10'd0;
				Car_Y_Center[3] = 10'd0;
			end
		endcase
		
	end

	Car car_instance1(.*, .is_car(is_car_row[0]), .car_data_out(car_data_out[0]), .Car_X_Offset(Offset1), .Car_Y_Center(Car_Y_Center[0]));
	Car car_instance2(.*, .is_car(is_car_row[1]), .car_data_out(car_data_out[1]), .Car_X_Offset(Offset2), .Car_Y_Center(Car_Y_Center[1]));
	Car car_instance3(.*, .is_car(is_car_row[2]), .car_data_out(car_data_out[2]), .Car_X_Offset(Offset3), .Car_Y_Center(Car_Y_Center[2]));
	Car car_instance4(.*, .is_car(is_car_row[3]), .car_data_out(car_data_out[3]), .Car_X_Offset(Offset4), .Car_Y_Center(Car_Y_Center[3]));

endmodule



module Car(input         Clk,                // 50 MHz clock
								  Reset,              // Active-high reset signal
								  frame_clk_rising_edge,        // The clock indicating a new frame (~60Hz)
								  CarDirection,
								  GoNextLevel,
				input [9:0]	  CarSpeed, Car_Y_Center, Car_X_Offset,
				input [9:0]   DrawX, DrawY,       // Current pixel coordinates
				output logic  is_car,
				output logic [4:0] car_data_out);

    logic [9:0] Car_X_Center = 10'd124;  // Center position on the X axis
    //logic [9:0] Car_Y_Center = 10'd250;  // Center position on the Y axis
	 parameter [9:0] Car_X_Min = 10'd124;     // Leftmost point on the X axis
    parameter [9:0] Car_X_Max = 10'd544;     // Rightmost point on the X axis
    parameter [9:0] Car_Size_X = 10'd56;     // will be 56x28
	 parameter [9:0] Car_Size_Y = 10'd28;		// 


    logic [9:0] Car_X_Pos = 10'd220;
	 logic [9:0] Car_Y_Pos = 10'd250;
    logic [9:0] Car_X_Pos_in = 10'd400;
	 logic [9:0] Car_Motion = 10'd0;
	 
	 assign Car_X_Center = 10'd124 + Car_X_Offset;
	 
	 logic GoNextLevelDelayed;
	 always_ff @ (posedge Clk) begin
		if(GoNextLevel)
			GoNextLevelDelayed <= 1'b1;
		else
			GoNextLevelDelayed <= 1'b0;
	 end
	 
	 always_ff @ (posedge Clk) begin
			if(Reset || GoNextLevelDelayed)
			begin
				Car_X_Pos <= Car_X_Center;
				Car_Y_Pos <= Car_Y_Center;
			end
			else if (frame_clk_rising_edge)
			begin
				Car_X_Pos <= Car_X_Pos_in;
			end
	 
	 end
	 
	 
	 always_comb
	 begin
		if(CarDirection)
		begin
			Car_Motion = CarSpeed;
		end
		else
		begin
			Car_Motion = ((~CarSpeed) + 1'b1);
		end
	 
	 
		Car_X_Pos_in = Car_X_Pos;
		if(frame_clk_rising_edge)
		begin
			if(~CarDirection)
			begin
				if((Car_X_Pos + Car_Size_X) <= Car_X_Min)
					Car_X_Pos_in = Car_X_Max + 1'b1;
				else
					Car_X_Pos_in = Car_X_Pos + Car_Motion;
			end
			else
			begin
				if(Car_X_Pos > Car_X_Max)
					Car_X_Pos_in = Car_X_Min + (~Car_Size_X + 1'b1);
				else
					Car_X_Pos_in = Car_X_Pos + Car_Motion;
			end
		end
	 
	 
	 
	 end


	 
	 int DistX, DistY, SizeX, SizeY;
    assign DistX = DrawX - Car_X_Pos;
    assign DistY = DrawY - Car_Y_Pos;
    assign SizeX = Car_Size_X;
	 assign SizeY = Car_Size_Y;
    always_comb begin
        if ( (DistX < SizeX)&&(DistY < SizeY)&&(DistX >= 0)&&(DistY >= 0) ) 
            is_car = 1'b1;
        else
            is_car = 1'b0;
    end
	 
	 logic we = 1'b0;
	 logic [4:0] data_In;
	 logic [18:0] write_address, read_address;
	 always_comb
	 begin
		if(is_car)
		begin
			if(~CarDirection)
				read_address = (SizeX*DistY) + DistX;
			else
				read_address = ((SizeX)*(DistY + 1) - 1) - DistX;
		end
		else
			read_address = 19'b0;
	 end
	 frameRAMCar car_ram(.*, .data_Out(car_data_out));
	 
endmodule
