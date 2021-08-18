module Game(input Clk, Reset_h, 
				input [7:0] keycode,
				input [9:0] DrawX, DrawY,
				output logic is_frog,
				output logic [1:0] is_timer, GameState,
				output logic [1:0] is_turtle_up [4:0],
				output logic [4:0] isFinish, FrogFinished, TurtleEnabled, frog_data_out,
				output logic [7:0] Level, Lives,
				output logic [15:0] Score,
				output logic [4:0][3:0] isCar, isLog,
				output logic [4:0][3:0][4:0] car_data_out, log_data_out);

				


	logic is_dead, frame_clk;
	logic [4:0] OnFinish;
	logic GoNextLevel, ResetGame, TimerReset;
	logic is_dead_delayed, ReachedFinish;
	logic [7:0] TimeLeft, frog_keycode;
	//logic [1:0] GameState;
	
	logic [4:0] CarDirection;
	logic [1:0] CarNumber  [4:0]; //0 represents 1 car and so forth
	logic [9:0]	CarSpeed   [4:0];
	logic [9:0] CarOffset1 [4:0];
	logic [9:0] CarOffset2 [4:0];
	logic [9:0] CarOffset3 [4:0];
	logic [9:0] CarOffset4 [4:0];

	logic [4:0] LogDirection;
	logic [1:0] LogNumber  [4:0]; //0 represents 1 car and so forth
	logic [9:0]	LogSpeed   [4:0];
	logic [9:0] LogSize    [4:0];
	logic [9:0] LogOffset1 [4:0];
	logic [9:0] LogOffset2 [4:0];
	logic [9:0] LogOffset3 [4:0];
	logic [9:0] LogOffset4 [4:0];
	
	always_comb
	 begin
		if((DrawX == 0)&&(DrawY == 0))
			frame_clk = 1'b1;
		else
			frame_clk = 1'b0;
	 end
	
	 // Detect rising edge of frame_clk
    logic frame_clk_delayed, frame_clk_rising_edge;
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk)  //keeps track of lives/level
	 begin
		if(Reset_h)
		begin
			Level <= 8'h01;
			Lives <= 8'h03;
			TimerReset <= 1'b0;
			ResetGame <= 1'b1;
			Score <= 16'b0;
			GameState <= 2'b00;
		end
		else if (frame_clk_rising_edge)
		begin
			if(GameState == 2'b00)
			begin
				ResetGame <= 1'b0;
				TimerReset <= 1'b1;
				if(keycode == 8'h28)//need enter value
					GameState <= 2'b01;
			end
			else if(GameState == 2'b01) 
			begin
				ResetGame <= 1'b0;
				TimerReset <= 1'b0;
				if(ReachedFinish) //increase score by how much time is left
				begin
					Score <= Score + TimeLeft;
					TimerReset <= 1'b1;
				end
				if(is_dead_delayed)
				begin
					Lives <= Lives + 8'hff; //-1
				end
				else if (GoNextLevel)
				begin
					Level <= Level + 8'h01;
				end
				else if (Lives == 8'h00)
				begin
					GameState <= 2'b10;
				end
			end
			else if(GameState == 2'b10)
			begin
				TimerReset <= 1'b1;
				if(keycode == 8'h28) //enter
				begin
					Score <= 8'h00;
					Lives <= 8'h03;
					Level <= 8'h01;
					ResetGame <= 1'b1;
					GameState <= 2'b01;
				end
			end
		end
	 
	 end
	
	 Timer timer_instance(.*, .Reset(ResetGame)); 

	 Level level_instance(.*);
	 
	 always_comb
	 begin
		if(GameState == 2'b01)
			frog_keycode = keycode;
		else
			frog_keycode = 8'h00;
	 end
    Frog frog_instance(.*, .Reset(ResetGame), .keycode(frog_keycode));
	 

	 CarRow carRow_instance1(.*, .Reset(ResetGame), .RowNumber(3'b000), .is_car_row(isCar[0]), .car_data_out(car_data_out[0]), .CarSpeed(CarSpeed[0]), .CarDirection(CarDirection[0]), .CarNumber(CarNumber[0]), .Offset1(CarOffset1[0]), .Offset2(CarOffset2[0]), .Offset3(CarOffset3[0]), .Offset4(CarOffset4[0]));
	 CarRow carRow_instance2(.*, .Reset(ResetGame), .RowNumber(3'b001), .is_car_row(isCar[1]), .car_data_out(car_data_out[1]), .CarSpeed(CarSpeed[1]), .CarDirection(CarDirection[1]), .CarNumber(CarNumber[1]), .Offset1(CarOffset1[1]), .Offset2(CarOffset2[1]), .Offset3(CarOffset3[1]), .Offset4(CarOffset4[1]));
	 CarRow carRow_instance3(.*, .Reset(ResetGame), .RowNumber(3'b010), .is_car_row(isCar[2]), .car_data_out(car_data_out[2]), .CarSpeed(CarSpeed[2]), .CarDirection(CarDirection[2]), .CarNumber(CarNumber[2]), .Offset1(CarOffset1[2]), .Offset2(CarOffset2[2]), .Offset3(CarOffset3[2]), .Offset4(CarOffset4[2]));
	 CarRow carRow_instance4(.*, .Reset(ResetGame), .RowNumber(3'b011), .is_car_row(isCar[3]), .car_data_out(car_data_out[3]), .CarSpeed(CarSpeed[3]), .CarDirection(CarDirection[3]), .CarNumber(CarNumber[3]), .Offset1(CarOffset1[3]), .Offset2(CarOffset2[3]), .Offset3(CarOffset3[3]), .Offset4(CarOffset4[3]));
	 CarRow carRow_instance5(.*, .Reset(ResetGame), .RowNumber(3'b100), .is_car_row(isCar[4]), .car_data_out(car_data_out[4]), .CarSpeed(CarSpeed[4]), .CarDirection(CarDirection[4]), .CarNumber(CarNumber[4]), .Offset1(CarOffset1[4]), .Offset2(CarOffset2[4]), .Offset3(CarOffset3[4]), .Offset4(CarOffset4[4]));
	 
	 LogRow logRow_instance1(.*, .Reset(ResetGame), .RowNumber(3'b000), .is_log_row(isLog[0]), .log_data_out(log_data_out[0]), .is_turtle_out(is_turtle_up[0]), .TurtleEnabled(TurtleEnabled[0]), .LogSpeed(LogSpeed[0]), .LogDirection(LogDirection[0]), .LogNumber(LogNumber[0]), .Log_Size_X(LogSize[0]), .Offset1(LogOffset1[0]), .Offset2(LogOffset2[0]), .Offset3(LogOffset3[0]), .Offset4(LogOffset4[0]));
	 LogRow logRow_instance2(.*, .Reset(ResetGame), .RowNumber(3'b001), .is_log_row(isLog[1]), .log_data_out(log_data_out[1]), .is_turtle_out(is_turtle_up[1]), .TurtleEnabled(TurtleEnabled[1]), .LogSpeed(LogSpeed[1]), .LogDirection(LogDirection[1]), .LogNumber(LogNumber[1]), .Log_Size_X(LogSize[1]), .Offset1(LogOffset1[1]), .Offset2(LogOffset2[1]), .Offset3(LogOffset3[1]), .Offset4(LogOffset4[1]));
	 LogRow logRow_instance3(.*, .Reset(ResetGame), .RowNumber(3'b010), .is_log_row(isLog[2]), .log_data_out(log_data_out[2]), .is_turtle_out(is_turtle_up[2]), .TurtleEnabled(TurtleEnabled[2]), .LogSpeed(LogSpeed[2]), .LogDirection(LogDirection[2]), .LogNumber(LogNumber[2]), .Log_Size_X(LogSize[2]), .Offset1(LogOffset1[2]), .Offset2(LogOffset2[2]), .Offset3(LogOffset3[2]), .Offset4(LogOffset4[2]));
	 LogRow logRow_instance4(.*, .Reset(ResetGame), .RowNumber(3'b011), .is_log_row(isLog[3]), .log_data_out(log_data_out[3]), .is_turtle_out(is_turtle_up[3]), .TurtleEnabled(TurtleEnabled[3]), .LogSpeed(LogSpeed[3]), .LogDirection(LogDirection[3]), .LogNumber(LogNumber[3]), .Log_Size_X(LogSize[3]), .Offset1(LogOffset1[3]), .Offset2(LogOffset2[3]), .Offset3(LogOffset3[3]), .Offset4(LogOffset4[3]));
	 LogRow logRow_instance5(.*, .Reset(ResetGame), .RowNumber(3'b100), .is_log_row(isLog[4]), .log_data_out(log_data_out[4]), .is_turtle_out(is_turtle_up[4]), .TurtleEnabled(TurtleEnabled[4]), .LogSpeed(LogSpeed[4]), .LogDirection(LogDirection[4]), .LogNumber(LogNumber[4]), .Log_Size_X(LogSize[4]), .Offset1(LogOffset1[4]), .Offset2(LogOffset2[4]), .Offset3(LogOffset3[4]), .Offset4(LogOffset4[4]));
	 
	 FinishLine finish_instance(.*, .Reset(ResetGame));
	 
	 HitDetection hit_instance(.*);



endmodule 