module  Frog ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk_rising_edge,          // The clock indicating a new frame (~60Hz)
									  is_dead,
					input [1:0]	  is_turtle_up [4:0], 
					input [4:0]	  FrogFinished, OnFinish, LogDirection, TurtleEnabled,
					input [7:0]	  keycode,
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
					input [9:0]	  LogSpeed [4:0],
					input [4:0][3:0] isLog,
               output logic  is_frog, is_dead_delayed, ReachedFinish,
					output logic [4:0] frog_data_out
              );
    
    parameter [9:0] Frog_X_Center = 10'd320;  
    parameter [9:0] Frog_Y_Center = 10'd412;  
    parameter [9:0] Frog_X_Min = 10'd124;     
    parameter [9:0] Frog_X_Max = 10'd544;//639 max
    parameter [9:0] Frog_Y_Min = 10'd75;     
    parameter [9:0] Frog_Y_Max = 10'd440;//479 max was 380
    parameter [9:0] Frog_X_Step = 10'd28;    //will be 28x28 
    parameter [9:0] Frog_Y_Step = 10'd28;     
    parameter [9:0] Frog_Size = 10'd28;       
    
    logic [9:0] Frog_X_Pos = 10'd320;
	 logic [9:0] Frog_Y_Pos = 10'd300;
    logic [9:0] Frog_X_Pos_in = 10'd320;
	 logic [9:0] Frog_Y_Pos_in = 10'd240;
	 logic [7:0] LastKeycode = 8'b0;
	 logic NewKeycode = 1'b1;
	 //logic is_dead_delayed = 1'b0;
	 logic is_on_log = 1'b0;
	 logic [4:0] is_on_finish = 5'b0;	 
    
    // Update registers
    always_ff @ (posedge Clk)
    begin
        if (Reset || (ReachedFinish && frame_clk_rising_edge) || (is_dead_delayed && frame_clk_rising_edge))
        begin
            Frog_X_Pos <= Frog_X_Center;
            Frog_Y_Pos <= Frog_Y_Center;
				NewKeycode <= 1'b0;
				is_dead_delayed <= 1'b0;
				ReachedFinish <= 1'b0;
        end
        else
        begin
				if(((~is_dead_delayed) && (is_dead)) || (Frog_X_Pos < Frog_X_Min) || ((Frog_X_Pos + Frog_Size) > Frog_X_Max))
				begin
					is_dead_delayed <= 1'b1; //hit by car or out of bounds
				end
				else if((DrawX == 630) && (DrawY == 470)) //near bottom corner
				begin
					if(Frog_Y_Pos < 10'd244)
					begin
						if((~is_on_log) && (is_on_finish == 5'b00000))
							is_dead_delayed <= 1'b1; //if in river area but not on log
						else if(is_on_finish != 5'b00000)
						begin
							ReachedFinish <= 1'b1;
						end
					end
				end
				
				if((~is_on_log) && (((isLog[0] != 5'b00000)||(isLog[1] != 5'b00000)||(isLog[2] != 5'b00000)||(isLog[3] != 5'b00000)||(isLog[4] != 5'b00000)) && (is_frog))) 
				begin//loads if is on log
					if((DrawY >= 216) && (DrawY < 244) && TurtleEnabled[0]) //handling turtle cases
					begin
						if(is_turtle_up[0] == 2'b00)
							is_on_log <= 1'b0;
						else
							is_on_log <= 1'b1;
					end
					else if ((DrawY >= 188) && (DrawY < 216) && TurtleEnabled[1])
					begin
						if(is_turtle_up[1] == 2'b00)
							is_on_log <= 1'b0;
						else
							is_on_log <= 1'b1;
					end
					else if ((DrawY >= 160) && (DrawY < 188) && TurtleEnabled[2])
					begin
						if(is_turtle_up[2] == 2'b00)
							is_on_log <= 1'b0;
						else
							is_on_log <= 1'b1;
					end
					else if ((DrawY >= 132) && (DrawY < 160) && TurtleEnabled[3])
					begin
						if(is_turtle_up[3] == 2'b00)
							is_on_log <= 1'b0;
						else
							is_on_log <= 1'b1;
					end
					else if ((DrawY >= 104) && (DrawY < 132) && TurtleEnabled[4])
					begin
						if(is_turtle_up[4] == 2'b00)
							is_on_log <= 1'b0;
						else
							is_on_log <= 1'b1;
					end
					else //if it's a log and not a turtle
						is_on_log <= 1'b1;
				end
				
				if((is_on_finish == 5'b00000) && (OnFinish != 5'b00000)) //loads if is on finish
				begin
					if((~FrogFinished[0]) && (OnFinish[0])) //if that finish slot hasnt been filled
						is_on_finish <= OnFinish; 				 //go on it
					else if((~FrogFinished[1]) && (OnFinish[1]))
						is_on_finish <= OnFinish;
					else if((~FrogFinished[2]) && (OnFinish[2]))
						is_on_finish <= OnFinish;
					else if((~FrogFinished[3]) && (OnFinish[3]))
						is_on_finish <= OnFinish;
					else if((~FrogFinished[4]) && (OnFinish[4]))
						is_on_finish <= OnFinish;
				end
				
				if(LastKeycode != keycode) //checks if new keycode
				begin
					LastKeycode <= keycode;
					NewKeycode <= 1'b1;
				end
				
				if (frame_clk_rising_edge)
				begin
					if((~is_on_log)|| ((NewKeycode) && (keycode != 8'h00))) //moves if pressed move
					begin
						Frog_X_Pos <= Frog_X_Pos_in;
						Frog_Y_Pos <= Frog_Y_Pos_in;
					end
					else
					begin
						if(Frog_Y_Pos == 10'd216) //on a log
						begin
							if(LogDirection[0])
							begin
								Frog_X_Pos <= Frog_X_Pos_in + LogSpeed[0];
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
							else
							begin
								Frog_X_Pos <= Frog_X_Pos_in + (~LogSpeed[0] + 1'b1);
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
						end
						else if(Frog_Y_Pos == 10'd188)
						begin
							if(LogDirection[1])
							begin
								Frog_X_Pos <= Frog_X_Pos_in + LogSpeed[1];
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
							else
							begin
								Frog_X_Pos <= Frog_X_Pos_in + (~LogSpeed[1] + 1'b1);
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
						end
						else if(Frog_Y_Pos == 10'd160)
						begin
						if(LogDirection[2])
							begin
								Frog_X_Pos <= Frog_X_Pos_in + LogSpeed[2];
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
							else
							begin
								Frog_X_Pos <= Frog_X_Pos_in + (~LogSpeed[2] + 1'b1);
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
						end
						else if(Frog_Y_Pos == 10'd132)
						begin
						if(LogDirection[3])
							begin
								Frog_X_Pos <= Frog_X_Pos_in + LogSpeed[3];
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
							else
							begin
								Frog_X_Pos <= Frog_X_Pos_in + (~LogSpeed[3] + 1'b1);
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
						end
						else if(Frog_Y_Pos == 10'd104)
						begin
						if(LogDirection[4])
							begin
								Frog_X_Pos <= Frog_X_Pos_in + LogSpeed[4];
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
							else
							begin
								Frog_X_Pos <= Frog_X_Pos_in + (~LogSpeed[4] + 1'b1);
								Frog_Y_Pos <= Frog_Y_Pos_in;
							end
						end
					end
				   
					//reset values
					NewKeycode <= 1'b0;
					is_on_log <= 1'b0;
					is_on_finish <= 5'b00000;
				end
        end
    end
    
    always_comb
    begin
        // By default, keep motion and position unchanged
        Frog_X_Pos_in = Frog_X_Pos;
        Frog_Y_Pos_in = Frog_Y_Pos;
        
        // Update position and motion only at rising edge of frame clock
        if (frame_clk_rising_edge)
        begin
				if(NewKeycode == 1'b1) //CONTROLS BREAK IF MIN AT 0 SO DONT HAVE EDGE OF GAME AT EDGE OF SCREEN
				begin
					if (keycode == 8'h1a) //w
					begin
						 if(Frog_Y_Min < (Frog_Y_Pos + (~(Frog_Y_Step) + 1'b1)))
						 begin
								Frog_Y_Pos_in = Frog_Y_Pos + (~(Frog_Y_Step) + 1'b1); // 2's complement. 
						 end
						 else
						 begin
								Frog_Y_Pos_in = Frog_Y_Min + 1'b1; //if at edge
						 end
					end
					else if (keycode == 8'h04) //a
					begin
						 if(Frog_X_Min < (Frog_X_Pos + (~(Frog_X_Step) + 1'b1)))
						 begin
								Frog_X_Pos_in = Frog_X_Pos + (~(Frog_X_Step) + 1'b1);  // 2's complement. 
						 end
						 else
						 begin
								Frog_X_Pos_in = Frog_X_Min + 1'b1; //if at edge
						 end
					end
					else if (keycode == 8'h16) //s
					begin
						 if(Frog_Y_Max >= (Frog_Y_Pos + Frog_Y_Step + Frog_Size))
						 begin
								Frog_Y_Pos_in = Frog_Y_Pos + Frog_Y_Step;
						 end
						 else
						 begin
								Frog_Y_Pos_in = Frog_Y_Max + (~Frog_Size + 1'b1); //if at edge
						 end
					end
					else if (keycode == 8'h07) //d
					begin
						 if(Frog_X_Max >= (Frog_X_Pos + Frog_X_Step + Frog_Size))
						 begin
								Frog_X_Pos_in = Frog_X_Pos + Frog_X_Step;
						 end
						 else
						 begin
								Frog_X_Pos_in = Frog_X_Max + (~Frog_Size + 1'b1); //if at edge
						 end
					end
				end
        end
    end
    
    // Compute whether the pixel corresponds to frog or background
    int DistX, DistY, Size;
    assign DistX = DrawX - Frog_X_Pos;
    assign DistY = DrawY - Frog_Y_Pos;
    assign Size = Frog_Size;
    always_comb begin
        if ( (DistX < Size)&&(DistY < Size)&&(DistX >= 0)&&(DistY >= 0) ) //square of size Frog_Size
            is_frog = 1'b1;
        else
            is_frog = 1'b0;

    end
	 
	 
	 logic we = 1'b0;
	 logic [4:0] data_In;
	 logic [18:0] write_address, read_address;
	 always_comb
	 begin
		if(is_frog)
		begin
			read_address = (10'd28*DistY) + DistX;
		end
		else
			read_address = 19'b0;
	 end
	 frameRAMFrog frog_ram(.*, .data_Out(frog_data_out));
    
endmodule
