module FinishLine(input 				Clk,                // 50 MHz clock
												Reset,              // Active-high reset signal
												frame_clk_rising_edge,        // The clock indicating a new frame (~60Hz)
						input [9:0]   		DrawX, DrawY,       // Current pixel coordinates
						input 				is_frog,
						input					ResetGame,				//reset the game or not
						output logic		GoNextLevel,			//increase the level
					output logic [4:0] 	isFinish, FrogFinished, OnFinish 
					); //isFinish = if current pixel is a finish, FrogFinished = completed finish lines
						//OnFinish = if the frog is on a finish square
					
	parameter [9:0] Finish_X_Center1 = 10'd152;
	parameter [9:0] Finish_X_Center2 = 10'd236;
	parameter [9:0] Finish_X_Center3 = 10'd320;
	parameter [9:0] Finish_X_Center4 = 10'd404;
	parameter [9:0] Finish_X_Center5 = 10'd488;
	parameter [9:0] Finish_Y_Center = 10'd76;
	parameter [9:0] Finish_Size = 10'd28;

	logic [4:0] FrogFinishedTemp = 5'b0;

					
	always_ff @ (posedge Clk)
	begin
		if(Reset || ResetGame)
		begin
			FrogFinished <= 5'b0;
			FrogFinishedTemp <= 5'b0;
			GoNextLevel <= 1'b0;
		end
		else if(frame_clk_rising_edge)
		begin
			if(FrogFinishedTemp != 5'b11111)
			begin
				FrogFinished <= FrogFinishedTemp;
				GoNextLevel <= 1'b0;
			end
			else
			begin
				FrogFinishedTemp <= 5'b00000;
				FrogFinished <= 5'b00000;
				GoNextLevel <= 1'b1;
			end
		end
		else
		begin
			if(OnFinish[0]) //updating which finish spots have been touched
				FrogFinishedTemp[0] <= 1'b1;
			else if(OnFinish[1])
				FrogFinishedTemp[1] <= 1'b1;
			else if(OnFinish[2])
				FrogFinishedTemp[2] <= 1'b1;
			else if(OnFinish[3])
				FrogFinishedTemp[3] <= 1'b1;
			else if(OnFinish[4])
				FrogFinishedTemp[4] <= 1'b1;
			else
				FrogFinishedTemp <= FrogFinishedTemp;
		end
		
		
	end

	int DistX1, DistX2, DistX3, DistX4, DistX5, DistY, Size;
   assign DistX1 = DrawX - Finish_X_Center1;
	assign DistX2 = DrawX - Finish_X_Center2;
	assign DistX3 = DrawX - Finish_X_Center3;
	assign DistX4 = DrawX - Finish_X_Center4;
	assign DistX5 = DrawX - Finish_X_Center5;
	assign DistY = DrawY - Finish_Y_Center;
	assign Size = Finish_Size;
	
	always_comb //determines whether the pixel is a finish spot & if the frog is on it
	begin
		if((DistY >= 0) && (DistY < Size))
		begin
			if((DistX1 >= 0) && (DistX1 < Size))
			begin
				isFinish[0] = 1'b1;
				if (is_frog)
					OnFinish[0] = 1'b1;
				else
					OnFinish[0] = 1'b0;
			end
			else
			begin
				isFinish[0] = 1'b0;
				OnFinish[0] = 1'b0;
			end
				
			if((DistX2 >= 0) && (DistX2 < Size))
			begin
				isFinish[1] = 1'b1;
				if (is_frog)
					OnFinish[1] = 1'b1;
				else
					OnFinish[1] = 1'b0;
			end
			else
			begin
				isFinish[1] = 1'b0;
				OnFinish[1] = 1'b0;
			end
				
			if((DistX3 >= 0) && (DistX3 < Size))
			begin
				isFinish[2] = 1'b1;
				if (is_frog)
					OnFinish[2] = 1'b1;
				else
					OnFinish[2] = 1'b0;
			end
			else
			begin
				isFinish[2] = 1'b0;
				OnFinish[2] = 1'b0;
			end
				
			if((DistX4 >= 0) && (DistX4 < Size))
			begin
				isFinish[3] = 1'b1;
				if (is_frog)
					OnFinish[3] = 1'b1;
				else
					OnFinish[3] = 1'b0;
			end
			else
			begin
				isFinish[3] = 1'b0;
				OnFinish[3] = 1'b0;
			end
				
			if((DistX5 >= 0) && (DistX5 < Size))
			begin
				isFinish[4] = 1'b1;
				if (is_frog)
					OnFinish[4] = 1'b1;
				else
					OnFinish[4] = 1'b0;
			end
			else
			begin
				isFinish[4] = 1'b0;
				OnFinish[4] = 1'b0;
			end
		end
		else
		begin
			isFinish = 5'b00000;
			OnFinish = 5'b00000;
		end
	
	end




endmodule 