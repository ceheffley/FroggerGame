module font_controller(input [1:0] GameState,
							  input [7:0] font_out,
							  input [9:0] DrawX, DrawY,
							  input shortint unsigned ScoreInt, LivesInt, LevelInt,
							  output is_font,
							  output [10:0] font_addr);
		//384y, 180x
	
	shortint unsigned DrawXInt, DrawYInt, DistX, DistY;
	logic [10:0] ScoreDigit0, ScoreDigit1, ScoreDigit2, ScoreDigit3, LivesDigit1, LivesDigit0, LevelDigit1, LevelDigit0;
	assign DrawXInt = DrawX;
	assign DrawYInt = DrawY;
	assign DistX = (DrawXInt % 10);
	assign DistY = ((DrawYInt - 4) % 20);
	
	//assigning characters
	always_comb
	begin
		if(GameState == 2'b00)
		begin
			if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 140) && (DrawXInt < 148))
				font_addr = 11'h460 + DistY; //F
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 150) && (DrawXInt < 158))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 160) && (DrawXInt < 168))
				font_addr = 11'h6f0 + DistY; //o
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 170) && (DrawXInt < 178))
				font_addr = 11'h670 + DistY; //g
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 180) && (DrawXInt < 188))
				font_addr = 11'h670 + DistY; //g
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 190) && (DrawXInt < 198))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 200) && (DrawXInt < 208))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 210) && (DrawXInt < 218))
				font_addr = 11'h2d0 + DistY; //-
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 220) && (DrawXInt < 228))
				font_addr = 11'h500 + DistY; //P
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 230) && (DrawXInt < 238))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 240) && (DrawXInt < 248))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 250) && (DrawXInt < 258))
				font_addr = 11'h730 + DistY; //s
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 260) && (DrawXInt < 268))
				font_addr = 11'h730 + DistY; //s
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 280) && (DrawXInt < 288))
				font_addr = 11'h450 + DistY; //E
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 290) && (DrawXInt < 298))
				font_addr = 11'h6e0 + DistY; //n
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 300) && (DrawXInt < 308))
				font_addr = 11'h740 + DistY; //t
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 310) && (DrawXInt < 318))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 320) && (DrawXInt < 328))
				font_addr = 11'h720 + DistY; //r
			else
				font_addr = 11'h000;
		end
		else if(GameState == 2'b01)
		begin
			if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 180) && (DrawXInt < 188))
			begin//Score: <ScoreInt>//Score: <ScoreInt>//Score: <ScoreInt>//Score: <ScoreInt>
				font_addr = 11'h530 + DistY; //S
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 190) && (DrawXInt < 198))
			begin
				font_addr = 11'h630 + DistY; //c
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 200) && (DrawXInt < 208))
			begin
				font_addr = 11'h6f0 + DistY;//o
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 210) && (DrawXInt < 218))
			begin
				font_addr = 11'h720 + DistY;//r
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 220) && (DrawXInt < 228))
			begin
				font_addr = 11'h650 + DistY;//e
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 230) && (DrawXInt < 238))
			begin
				font_addr = 11'h3a0 + DistY;//:
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 240) && (DrawXInt < 248))
			begin
				font_addr = ScoreDigit3 + DistY;//scoreint 3
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 250) && (DrawXInt < 258))
			begin
				font_addr = ScoreDigit2 + DistY;//scoreint 2
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 260) && (DrawXInt < 268))
			begin
				font_addr = ScoreDigit1 + DistY;//scoreint 1
			end
			else if((DrawYInt >= 464) && (DrawYInt < 480) && (DrawXInt >= 270) && (DrawXInt < 278))
			begin
				font_addr = ScoreDigit0 + DistY;//scoreint 0
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 290) && (DrawXInt < 298))
			begin//Lives: <LivesInt>Lives: <LivesInt>Lives: <LivesInt>Lives: <LivesInt>Lives: <LivesInt>
				font_addr = 11'h4c0 + DistY;//L
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 300) && (DrawXInt < 308))
			begin
				font_addr = 11'h690 + DistY;//i
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 310) && (DrawXInt < 318))
			begin
				font_addr = 11'h760 + DistY;//v
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 320) && (DrawXInt < 328))
			begin
				font_addr = 11'h650 + DistY;//e
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 330) && (DrawXInt < 338))
			begin
				font_addr = 11'h730 + DistY;//s
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 340) && (DrawXInt < 348))
			begin
				font_addr = 11'h3a0 + DistY;//:
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 350) && (DrawXInt < 358))
			begin
				font_addr = LivesDigit1 + DistY;//livesint 1
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 360) && (DrawXInt < 368))
			begin
				font_addr = LivesDigit0 + DistY;//livesint 0
			end
			else if ((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 180) && (DrawXInt < 188))
			begin//Level:<levelint>Level:<levelint>Level:<levelint>Level:<levelint>Level:<levelint>
				font_addr = 11'h4c0 + DistY; //L
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 190) && (DrawXInt < 198))
			begin
				font_addr = 11'h650 + DistY; //e
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 200) && (DrawXInt < 208))
			begin
				font_addr = 11'h760 + DistY;//v
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 210) && (DrawXInt < 218))
			begin
				font_addr = 11'h650 + DistY;//e
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 220) && (DrawXInt < 228))
			begin
				font_addr = 11'h6c0 + DistY;//l
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 230) && (DrawXInt < 238))
			begin
				font_addr = 11'h3a0 + DistY;//:
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 240) && (DrawXInt < 248))
			begin
				font_addr = LevelDigit1 + DistY;//levelint 1
			end
			else if((DrawYInt >= 444) && (DrawYInt < 460) && (DrawXInt >= 250) && (DrawXInt < 258))
			begin
				font_addr = LevelDigit0 + DistY;//levelint 0
			end
			else
			begin
				font_addr = 11'h0;
			end
		end
		else
		begin
			if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 140) && (DrawXInt < 148))
				font_addr = 11'h470 + DistY; //G
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 150) && (DrawXInt < 158))
				font_addr = 11'h610 + DistY; //a
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 160) && (DrawXInt < 168))
				font_addr = 11'h6d0 + DistY; //m
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 170) && (DrawXInt < 178))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 190) && (DrawXInt < 198))
				font_addr = 11'h4f0 + DistY; //O
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 200) && (DrawXInt < 208))
				font_addr = 11'h760 + DistY; //v
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 210) && (DrawXInt < 218))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 220) && (DrawXInt < 228))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 230) && (DrawXInt < 238))
				font_addr = 11'h2d0 + DistY; //-
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 250) && (DrawXInt < 258))
				font_addr = 11'h530 + DistY; //S
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 260) && (DrawXInt < 268))
				font_addr = 11'h630 + DistY; //c
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 270) && (DrawXInt < 278))
				font_addr = 11'h6f0 + DistY; //o
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 280) && (DrawXInt < 288))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 290) && (DrawXInt < 298))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 300) && (DrawXInt < 308))
				font_addr = 11'h3a0 + DistY; //:
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 310) && (DrawXInt < 318))
				font_addr = ScoreDigit3 + DistY; //score3
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 320) && (DrawXInt < 328))
				font_addr = ScoreDigit2 + DistY; //score2
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 330) && (DrawXInt < 338))
				font_addr = ScoreDigit1 + DistY; //score1
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 340) && (DrawXInt < 348))
				font_addr = ScoreDigit0 + DistY; //score0
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 360) && (DrawXInt < 368))
				font_addr = 11'h2d0 + DistY; //-
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 370) && (DrawXInt < 378))
				font_addr = 11'h450 + DistY; //E
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 380) && (DrawXInt < 388))
				font_addr = 11'h6e0 + DistY; //n
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 390) && (DrawXInt < 398))
				font_addr = 11'h740 + DistY; //t
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 400) && (DrawXInt < 408))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 410) && (DrawXInt < 418))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 430) && (DrawXInt < 438))
				font_addr = 11'h540 + DistY; //T
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 440) && (DrawXInt < 448))
				font_addr = 11'h6f0 + DistY; //o
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 460) && (DrawXInt < 468))
				font_addr = 11'h520 + DistY; //R
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 470) && (DrawXInt < 478))
				font_addr = 11'h650 + DistY; //e
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 480) && (DrawXInt < 488))
				font_addr = 11'h730 + DistY; //s
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 490) && (DrawXInt < 498))
				font_addr = 11'h740 + DistY; //t
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 500) && (DrawXInt < 508))
				font_addr = 11'h610 + DistY; //a
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 510) && (DrawXInt < 518))
				font_addr = 11'h720 + DistY; //r
			else if((DrawYInt >= 244) && (DrawYInt < 260) && (DrawXInt >= 520) && (DrawXInt < 528))
				font_addr = 11'h740 + DistY; //t
			else
				font_addr = 11'h000;
		end
	end

	always_comb
	begin
		ScoreDigit0 = {((ScoreInt % 10) + 8'h30), 4'b0};
		ScoreDigit1 = {(((ScoreInt / 10) % 10) + 8'h30), 4'b0};
		ScoreDigit2 = {(((ScoreInt / 100) % 10) + 8'h30), 4'b0};
		ScoreDigit3 = {(((ScoreInt / 1000) % 10) + 8'h30), 4'b0};
		
		LivesDigit0 = {((LivesInt % 10) + 8'h30), 4'b0};
		LivesDigit1 = {(((LivesInt / 10) % 10) + 8'h30), 4'b0};
		
		LevelDigit0 = {((LevelInt % 10) + 8'h30), 4'b0};
		LevelDigit1 = {(((LevelInt / 10) % 10) + 8'h30), 4'b0};
	end
	
	//if font_out is telling pixel to be draw, set is_font = 1
	always_comb
	begin
		if((DistY < 16) && (DistX >= 0))
		begin
			if(font_out[7 - DistX] == 1'b1)
				is_font = 1'b1;
			else
				is_font = 1'b0;
		end
		else
		begin
			is_font = 1'b0;
		end
	end





endmodule 