module LogRow(input       	Clk, 
									Reset,   
									frame_clk_rising_edge, 
									LogDirection, TurtleEnabled,
									GoNextLevel,
				  input [1:0]	LogNumber,
				  input [2:0]  RowNumber,
				  input [9:0]	LogSpeed, Log_Size_X, Offset1, Offset2, Offset3, Offset4,
				  input [9:0]  DrawX, DrawY,
				  output logic	[3:0] is_log_row, 
				  output logic [1:0] is_turtle_out,
				  output logic [3:0][4:0] log_data_out);

	logic [9:0] Log_Y_Center [3:0];
	//logic [3:0] is_log_row;
	logic [1:0] is_turtle_up_row [3:0];

	assign is_turtle_out = is_turtle_up_row[0];
	
	always_comb 
	begin
		case(RowNumber)
			3'b000: 
			begin
				if(LogNumber == 2'b00)
				begin
					Log_Y_Center[0] = 10'd216;
					Log_Y_Center[1] = 10'd0;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b01)
				begin
					Log_Y_Center[0] = 10'd216;
					Log_Y_Center[1] = 10'd216;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b10)
				begin
					Log_Y_Center[0] = 10'd216;
					Log_Y_Center[1] = 10'd216;
					Log_Y_Center[2] = 10'd216;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b11)
				begin
					Log_Y_Center[0] = 10'd216;
					Log_Y_Center[1] = 10'd216;
					Log_Y_Center[2] = 10'd216;
					Log_Y_Center[3] = 10'd216;
				end
			end
			3'b001: 
			begin
				if(LogNumber == 2'b00)
				begin
					Log_Y_Center[0] = 10'd188;
					Log_Y_Center[1] = 10'd0;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b01)
				begin
					Log_Y_Center[0] = 10'd188;
					Log_Y_Center[1] = 10'd188;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b10)
				begin
					Log_Y_Center[0] = 10'd188;
					Log_Y_Center[1] = 10'd188;
					Log_Y_Center[2] = 10'd188;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b11)
				begin
					Log_Y_Center[0] = 10'd188;
					Log_Y_Center[1] = 10'd188;
					Log_Y_Center[2] = 10'd188;
					Log_Y_Center[3] = 10'd188;
				end
			end
			3'b010: 
			begin
				if(LogNumber == 2'b00)
				begin
					Log_Y_Center[0] = 10'd160;
					Log_Y_Center[1] = 10'd0;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b01)
				begin
					Log_Y_Center[0] = 10'd160;
					Log_Y_Center[1] = 10'd160;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b10)
				begin
					Log_Y_Center[0] = 10'd160;
					Log_Y_Center[1] = 10'd160;
					Log_Y_Center[2] = 10'd160;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b11)
				begin
					Log_Y_Center[0] = 10'd160;
					Log_Y_Center[1] = 10'd160;
					Log_Y_Center[2] = 10'd160;
					Log_Y_Center[3] = 10'd160;
				end
			end
			3'b011: 
			begin
				if(LogNumber == 2'b00)
				begin
					Log_Y_Center[0] = 10'd132;
					Log_Y_Center[1] = 10'd0;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b01)
				begin
					Log_Y_Center[0] = 10'd132;
					Log_Y_Center[1] = 10'd132;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b10)
				begin
					Log_Y_Center[0] = 10'd132;
					Log_Y_Center[1] = 10'd132;
					Log_Y_Center[2] = 10'd132;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b11)
				begin
					Log_Y_Center[0] = 10'd132;
					Log_Y_Center[1] = 10'd132;
					Log_Y_Center[2] = 10'd132;
					Log_Y_Center[3] = 10'd132;
				end
			end
			3'b100: 
			begin
				if(LogNumber == 2'b00)
				begin
					Log_Y_Center[0] = 10'd104;
					Log_Y_Center[1] = 10'd0;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b01)
				begin
					Log_Y_Center[0] = 10'd104;
					Log_Y_Center[1] = 10'd104;
					Log_Y_Center[2] = 10'd0;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b10)
				begin
					Log_Y_Center[0] = 10'd104;
					Log_Y_Center[1] = 10'd104;
					Log_Y_Center[2] = 10'd104;
					Log_Y_Center[3] = 10'd0;
				end
				else if (LogNumber == 2'b11)
				begin
					Log_Y_Center[0] = 10'd104;
					Log_Y_Center[1] = 10'd104;
					Log_Y_Center[2] = 10'd104;
					Log_Y_Center[3] = 10'd104;
				end
			end
			default:
			begin
				Log_Y_Center[0] = 10'd0;
				Log_Y_Center[1] = 10'd0;
				Log_Y_Center[2] = 10'd0;
				Log_Y_Center[3] = 10'd0;
			end
		endcase
			
	end

	Log Log_instance1(.*, .is_log(is_log_row[0]), .log_data_out(log_data_out[0]), .is_turtle_up(is_turtle_up_row[0]), .Log_X_Offset(Offset1), .Log_Y_Center(Log_Y_Center[0]));
	Log Log_instance2(.*, .is_log(is_log_row[1]), .log_data_out(log_data_out[1]), .is_turtle_up(is_turtle_up_row[1]), .Log_X_Offset(Offset2), .Log_Y_Center(Log_Y_Center[1]));
	Log Log_instance3(.*, .is_log(is_log_row[2]), .log_data_out(log_data_out[2]), .is_turtle_up(is_turtle_up_row[2]), .Log_X_Offset(Offset3), .Log_Y_Center(Log_Y_Center[2]));
	Log Log_instance4(.*, .is_log(is_log_row[3]), .log_data_out(log_data_out[3]), .is_turtle_up(is_turtle_up_row[3]), .Log_X_Offset(Offset4), .Log_Y_Center(Log_Y_Center[3]));

endmodule



module Log(input         Clk,                // 50 MHz clock
								  Reset,              // Active-high reset signal
								  frame_clk_rising_edge,         // The clock indicating a new frame (~60Hz)
								  LogDirection,
								  GoNextLevel,
								  TurtleEnabled,
				input [9:0]	  LogSpeed, Log_Size_X, Log_Y_Center, Log_X_Offset,
				input [9:0]   DrawX, DrawY,       // Current pixel coordinates
				output logic  is_log, 
				output logic [1:0] is_turtle_up,
				output logic [4:0] log_data_out);

    logic [9:0] Log_X_Center = 10'd124;  // Center position on the X axis
    //logic [9:0] Log_Y_Center = 10'd250;  // Center position on the Y axis
	 parameter [9:0] Log_X_Min = 10'd124;     // Leftmost point on the X axis
    parameter [9:0] Log_X_Max = 10'd544;     // Rightmost point on the X axis
    //parameter [9:0] Log_Size_X = 10'd60;    
	 parameter [9:0] Log_Size_Y = 10'd28;		// is default 112x28

	 logic [4:0] log_data_out_temp;

    logic [9:0] Log_X_Pos = 10'd220;
	 logic [9:0] Log_Y_Pos = 10'd250;
    logic [9:0] Log_X_Pos_in = 10'd400;
	 logic [9:0] Log_Motion = 10'd0;
	 
	 assign Log_X_Center = 10'd124 + Log_X_Offset;
	 
	 logic [7:0] SecondCounter = 8'h3b; 
	 
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
				Log_X_Pos <= Log_X_Center;
				Log_Y_Pos <= Log_Y_Center;
			end
			else if (frame_clk_rising_edge)
			begin
				Log_X_Pos <= Log_X_Pos_in;
			end
	 
	 end
	 
	 always_ff @ (posedge Clk) begin
		if(Reset || (~TurtleEnabled))
			is_turtle_up <= 2'b11;
		else if(frame_clk_rising_edge)
		begin
			case(SecondCounter)
				8'h00:
				begin
					SecondCounter <=8'h3b;
					if(is_turtle_up != 2'b00)
						is_turtle_up <= is_turtle_up + 2'b11;
					else
						is_turtle_up <= 2'b11;
				end
				default: SecondCounter <= SecondCounter + 8'hff; //-1
			endcase
		end
	 end
	 
	 
	 always_comb
	 begin
		if(LogDirection)
		begin
			Log_Motion = LogSpeed;
		end
		else
		begin
			Log_Motion = ((~LogSpeed) + 1'b1);
		end
	 
	 
		Log_X_Pos_in = Log_X_Pos;
		if(frame_clk_rising_edge)
		begin
			if(~LogDirection)
			begin
				if((Log_X_Pos + Log_Size_X) <= Log_X_Min)
					Log_X_Pos_in = Log_X_Max + 1'b1;
				else
					Log_X_Pos_in = Log_X_Pos + Log_Motion;
			end
			else
			begin
				if(Log_X_Pos > Log_X_Max)
					Log_X_Pos_in = Log_X_Min + (~Log_Size_X + 1'b1);
				else
					Log_X_Pos_in = Log_X_Pos + Log_Motion;
			end
		end
	 end


	 
	 int DistX, DistY, SizeX, SizeY;
    assign DistX = DrawX - Log_X_Pos;
    assign DistY = DrawY - Log_Y_Pos;
    assign SizeX = Log_Size_X;
	 assign SizeY = Log_Size_Y;
    always_comb begin
        if ( (DistX < SizeX)&&(DistY < SizeY)&&(DistX >= 0)&&(DistY >= 0) ) 
            is_log = 1'b1;
        else
            is_log = 1'b0;
    end
	 
	 logic we = 1'b0;
	 logic [4:0] data_In;
	 logic [18:0] write_address, read_address;
	 always_comb
	 begin
		if(is_log)
		begin
			read_address = (112*DistY) + DistX;
		end
		else
			read_address = 19'b0;
			
			
		if(is_turtle_up == 2'b0)
			log_data_out = 5'b0;
		else
			log_data_out = log_data_out_temp;
	 end
	 frameRAMLog log_ram(.*, .data_Out(log_data_out_temp));
	 
endmodule
