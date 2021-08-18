module Timer(input Clk, Reset, frame_clk_rising_edge, is_dead_delayed, TimerReset,
				 input [1:0] GameState,
				 input [9:0] DrawX, DrawY,
				 output logic [1:0] is_timer,
				 output logic [7:0] TimeLeft);
				 
	parameter [9:0] Timer_X_Pos = 10'd420;
	parameter [9:0] Timer_Y_Pos = 10'd450;
	parameter [9:0] Timer_X_Size = 10'd60;
	parameter [9:0] Timer_Y_Size = 10'd10;
	
	
	
	logic [7:0] MaxTime = 8'h1e; //1e = 30 seconds
	logic [7:0] SecondCounter = 8'h3b; //takes 60 frame_clks to decrease timer

	always_ff @ (posedge Clk)
	begin
		if(Reset || is_dead_delayed || TimerReset || ((GameState == 2'b00) || (GameState == 2'b10)))
		begin
			TimeLeft <= MaxTime;
			SecondCounter <= 8'h3b;
		end
		else if(frame_clk_rising_edge)
		begin
			if(SecondCounter != 8'h00)
			begin
				SecondCounter <= SecondCounter + 8'hff; //-1
			end
			else
			begin
				TimeLeft <= TimeLeft + 8'hff; //-1
				SecondCounter <= 8'h3b;
			end
		end
	end


    int DistX, DistY, SizeX, SizeY, TimeLeftInt, MaxTimeInt;
    assign DistX = DrawX - Timer_X_Pos; 
    assign DistY = DrawY - Timer_Y_Pos; 
    assign SizeX = Timer_X_Size;
	 assign SizeY = Timer_Y_Size;
	 assign TimeLeftInt = TimeLeft;
	 assign MaxTimeInt = MaxTime;
    always_comb begin
        if ( (DistX < SizeX)&&(DistY < SizeY)&&(DistX >= 0)&&(DistY >= 0)&&(GameState == 2'b01) )
		  begin
            is_timer[0] = 1'b1;
				if((MaxTimeInt - TimeLeftInt) > (DistX/2))
				begin
					is_timer[1] = 1'b0;
				end
				else
					is_timer[1] = 1'b1;
		  end
        else
            is_timer = 2'b0;

    end



endmodule 