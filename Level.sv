module Level(input [7:0] Level,
				 output logic [4:0] CarDirection,
				 output logic [1:0] CarNumber  [4:0], //0 represents 1 car and so forth
				 output logic [9:0] CarSpeed 	 [4:0],
				 output logic [9:0] CarOffset1 [4:0],
				 output logic [9:0] CarOffset2 [4:0],
				 output logic [9:0] CarOffset3 [4:0],
				 output logic [9:0] CarOffset4 [4:0],
				 
				 output logic [4:0] TurtleEnabled,
				 output logic [4:0] LogDirection,
				 output logic [1:0] LogNumber  [4:0], //0 represents 1 car and so forth
				 output logic [9:0] LogSpeed 	 [4:0],
				 output logic [9:0] LogSize 	 [4:0],
				 output logic [9:0] LogOffset1 [4:0],
				 output logic [9:0] LogOffset2 [4:0],
				 output logic [9:0] LogOffset3 [4:0],
				 output logic [9:0] LogOffset4 [4:0]
				 ); //will have level controls to make levels different

				 
				 

	always_comb
	begin
		case(Level)
			8'h01: //LVL 1
			begin
			//Cars
			CarDirection = 5'b10101;
			CarNumber[0] = 2'b01;
			CarNumber[1] = 2'b01;
			CarNumber[2] = 2'b10;
			CarNumber[3] = 2'b01;
			CarNumber[4] = 2'b01;
			CarSpeed[0] = 10'b0000000001;
			CarSpeed[1] = 10'b0000000001;
			CarSpeed[2] = 10'b0000000001;
			CarSpeed[3] = 10'b0000000001;
			CarSpeed[4] = 10'b0000000001;
			CarOffset1[0] = 10'd100;
			CarOffset2[0] = 10'd250;
			CarOffset3[0] = 10'd0;
			CarOffset4[0] = 10'd0;
			CarOffset1[1] = 10'd50;
			CarOffset2[1] = 10'd200;
			CarOffset3[1] = 10'd0;
			CarOffset4[1] = 10'd0;
			CarOffset1[2] = 10'd30;
			CarOffset2[2] = 10'd150;
			CarOffset3[2] = 10'd260;
			CarOffset4[2] = 10'd0;
			CarOffset1[3] = 10'd130;
			CarOffset2[3] = 10'd260;
			CarOffset3[3] = 10'd0;
			CarOffset4[3] = 10'd0;
			CarOffset1[4] = 10'd80;
			CarOffset2[4] = 10'd160;
			CarOffset3[4] = 10'd0;
			CarOffset4[4] = 10'd0;
			//Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs
			TurtleEnabled = 5'b00000;
			LogDirection = 5'b10010;
			LogNumber[0] = 2'b01;
			LogNumber[1] = 2'b01;
			LogNumber[2] = 2'b10;
			LogNumber[3] = 2'b01;
			LogNumber[4] = 2'b01;
			LogSpeed[0] = 10'b0000000001;
			LogSpeed[1] = 10'b0000000001;
			LogSpeed[2] = 10'b0000000010;
			LogSpeed[3] = 10'b0000000001;
			LogSpeed[4] = 10'b0000000001;
			LogSize[0] = 10'd84;
			LogSize[1] = 10'd84;
			LogSize[2] = 10'd84;
			LogSize[3] = 10'd112;
			LogSize[4] = 10'd112;
			LogOffset1[0] = 10'd100;
			LogOffset2[0] = 10'd300;
			LogOffset3[0] = 10'd0;
			LogOffset4[0] = 10'd0;
			LogOffset1[1] = 10'd50;
			LogOffset2[1] = 10'd200;
			LogOffset3[1] = 10'd0;
			LogOffset4[1] = 10'd0;
			LogOffset1[2] = 10'd20;
			LogOffset2[2] = 10'd150;
			LogOffset3[2] = 10'd340;
			LogOffset4[2] = 10'd0;
			LogOffset1[3] = 10'd100;
			LogOffset2[3] = 10'd350;
			LogOffset3[3] = 10'd0;
			LogOffset4[3] = 10'd0;
			LogOffset1[4] = 10'd150;
			LogOffset2[4] = 10'd350;
			LogOffset3[4] = 10'd0;
			LogOffset4[4] = 10'd0;
			
			end
			8'h02: //LVL 2
			begin
			//Cars
			CarDirection = 5'b10100;
			CarNumber[0] = 2'b01;
			CarNumber[1] = 2'b11;
			CarNumber[2] = 2'b10;
			CarNumber[3] = 2'b01;
			CarNumber[4] = 2'b01;
			CarSpeed[0] = 10'b0000000001;
			CarSpeed[1] = 10'b0000000010;
			CarSpeed[2] = 10'b0000000001;
			CarSpeed[3] = 10'b0000000001;
			CarSpeed[4] = 10'b0000000001;
			CarOffset1[0] = 10'd100;
			CarOffset2[0] = 10'd250;
			CarOffset3[0] = 10'd0;
			CarOffset4[0] = 10'd0;
			CarOffset1[1] = 10'd50;
			CarOffset2[1] = 10'd120;
			CarOffset3[1] = 10'd190;
			CarOffset4[1] = 10'd260;
			CarOffset1[2] = 10'd30;
			CarOffset2[2] = 10'd150;
			CarOffset3[2] = 10'd260;
			CarOffset4[2] = 10'd0;
			CarOffset1[3] = 10'd130;
			CarOffset2[3] = 10'd260;
			CarOffset3[3] = 10'd0;
			CarOffset4[3] = 10'd0;
			CarOffset1[4] = 10'd80;
			CarOffset2[4] = 10'd160;
			CarOffset3[4] = 10'd0;
			CarOffset4[4] = 10'd0;
			//Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs 
			TurtleEnabled = 5'b00010;
			LogDirection = 5'b10011;
			LogNumber[0] = 2'b01;
			LogNumber[1] = 2'b01;
			LogNumber[2] = 2'b10;
			LogNumber[3] = 2'b01;
			LogNumber[4] = 2'b01;
			LogSpeed[0] = 10'b0000000001;
			LogSpeed[1] = 10'b0000000001;
			LogSpeed[2] = 10'b0000000011;
			LogSpeed[3] = 10'b0000000001;
			LogSpeed[4] = 10'b0000000001;
			LogSize[0] = 10'd84;
			LogSize[1] = 10'd84;
			LogSize[2] = 10'd84;
			LogSize[3] = 10'd112;
			LogSize[4] = 10'd84;
			LogOffset1[0] = 10'd100;
			LogOffset2[0] = 10'd250;
			LogOffset3[0] = 10'd0;
			LogOffset4[0] = 10'd0;
			LogOffset1[1] = 10'd50;
			LogOffset2[1] = 10'd200;
			LogOffset3[1] = 10'd0;
			LogOffset4[1] = 10'd0;
			LogOffset1[2] = 10'd20;
			LogOffset2[2] = 10'd150;
			LogOffset3[2] = 10'd340;
			LogOffset4[2] = 10'd0;
			LogOffset1[3] = 10'd100;
			LogOffset2[3] = 10'd350;
			LogOffset3[3] = 10'd0;
			LogOffset4[3] = 10'd0;
			LogOffset1[4] = 10'd150;
			LogOffset2[4] = 10'd350;
			LogOffset3[4] = 10'd0;
			LogOffset4[4] = 10'd0;
			end
			8'h03: //LVL 3
			begin
			//Cars
			CarDirection = 5'b10101;
			CarNumber[0] = 2'b01;
			CarNumber[1] = 2'b01;
			CarNumber[2] = 2'b10;
			CarNumber[3] = 2'b01;
			CarNumber[4] = 2'b01;
			CarSpeed[0] = 10'b0000000001;
			CarSpeed[1] = 10'b0000000001;
			CarSpeed[2] = 10'b0000000001;
			CarSpeed[3] = 10'b0000000001;
			CarSpeed[4] = 10'b0000000001;
			CarOffset1[0] = 10'd100;
			CarOffset2[0] = 10'd250;
			CarOffset3[0] = 10'd0;
			CarOffset4[0] = 10'd0;
			CarOffset1[1] = 10'd50;
			CarOffset2[1] = 10'd200;
			CarOffset3[1] = 10'd0;
			CarOffset4[1] = 10'd0;
			CarOffset1[2] = 10'd30;
			CarOffset2[2] = 10'd150;
			CarOffset3[2] = 10'd260;
			CarOffset4[2] = 10'd0;
			CarOffset1[3] = 10'd130;
			CarOffset2[3] = 10'd260;
			CarOffset3[3] = 10'd0;
			CarOffset4[3] = 10'd0;
			CarOffset1[4] = 10'd80;
			CarOffset2[4] = 10'd160;
			CarOffset3[4] = 10'd0;
			CarOffset4[4] = 10'd0;
			//Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs 
			TurtleEnabled = 5'b00010;
			LogDirection = 5'b10010;
			LogNumber[0] = 2'b01;
			LogNumber[1] = 2'b01;
			LogNumber[2] = 2'b10;
			LogNumber[3] = 2'b01;
			LogNumber[4] = 2'b01;
			LogSpeed[0] = 10'b0000000001;
			LogSpeed[1] = 10'b0000000001;
			LogSpeed[2] = 10'b0000000011;
			LogSpeed[3] = 10'b0000000001;
			LogSpeed[4] = 10'b0000000001;
			LogSize[0] = 10'd84;
			LogSize[1] = 10'd84;
			LogSize[2] = 10'd84;
			LogSize[3] = 10'd112;
			LogSize[4] = 10'd84;
			LogOffset1[0] = 10'd100;
			LogOffset2[0] = 10'd250;
			LogOffset3[0] = 10'd0;
			LogOffset4[0] = 10'd0;
			LogOffset1[1] = 10'd50;
			LogOffset2[1] = 10'd200;
			LogOffset3[1] = 10'd0;
			LogOffset4[1] = 10'd0;
			LogOffset1[2] = 10'd20;
			LogOffset2[2] = 10'd150;
			LogOffset3[2] = 10'd340;
			LogOffset4[2] = 10'd0;
			LogOffset1[3] = 10'd100;
			LogOffset2[3] = 10'd350;
			LogOffset3[3] = 10'd0;
			LogOffset4[3] = 10'd0;
			LogOffset1[4] = 10'd150;
			LogOffset2[4] = 10'd350;
			LogOffset3[4] = 10'd0;
			LogOffset4[4] = 10'd0;
			end
			default: //default in case
			begin
			CarDirection = 5'b10101;
			CarNumber[0] = 2'b01;
			CarNumber[1] = 2'b01;
			CarNumber[2] = 2'b10;
			CarNumber[3] = 2'b01;
			CarNumber[4] = 2'b01;
			CarSpeed[0] = 10'b0000000001;
			CarSpeed[1] = 10'b0000000001;
			CarSpeed[2] = 10'b0000000001;
			CarSpeed[3] = 10'b0000000001;
			CarSpeed[4] = 10'b0000000001;
			CarOffset1[0] = 10'd100;
			CarOffset2[0] = 10'd250;
			CarOffset3[0] = 10'd0;
			CarOffset4[0] = 10'd0;
			CarOffset1[1] = 10'd50;
			CarOffset2[1] = 10'd200;
			CarOffset3[1] = 10'd0;
			CarOffset4[1] = 10'd0;
			CarOffset1[2] = 10'd30;
			CarOffset2[2] = 10'd150;
			CarOffset3[2] = 10'd260;
			CarOffset4[2] = 10'd0;
			CarOffset1[3] = 10'd130;
			CarOffset2[3] = 10'd260;
			CarOffset3[3] = 10'd0;
			CarOffset4[3] = 10'd0;
			CarOffset1[4] = 10'd80;
			CarOffset2[4] = 10'd160;
			CarOffset3[4] = 10'd0;
			CarOffset4[4] = 10'd0;
			//Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs Logs 
			TurtleEnabled = 5'b00010;
			LogDirection = 5'b10010;
			LogNumber[0] = 2'b01;
			LogNumber[1] = 2'b01;
			LogNumber[2] = 2'b10;
			LogNumber[3] = 2'b01;
			LogNumber[4] = 2'b01;
			LogSpeed[0] = 10'b0000000001;
			LogSpeed[1] = 10'b0000000001;
			LogSpeed[2] = 10'b0000000011;
			LogSpeed[3] = 10'b0000000001;
			LogSpeed[4] = 10'b0000000001;
			LogSize[0] = 10'd84;
			LogSize[1] = 10'd84;
			LogSize[2] = 10'd84;
			LogSize[3] = 10'd112;
			LogSize[4] = 10'd84;
			LogOffset1[0] = 10'd100;
			LogOffset2[0] = 10'd250;
			LogOffset3[0] = 10'd0;
			LogOffset4[0] = 10'd0;
			LogOffset1[1] = 10'd50;
			LogOffset2[1] = 10'd200;
			LogOffset3[1] = 10'd0;
			LogOffset4[1] = 10'd0;
			LogOffset1[2] = 10'd20;
			LogOffset2[2] = 10'd150;
			LogOffset3[2] = 10'd340;
			LogOffset4[2] = 10'd0;
			LogOffset1[3] = 10'd100;
			LogOffset2[3] = 10'd350;
			LogOffset3[3] = 10'd0;
			LogOffset4[3] = 10'd0;
			LogOffset1[4] = 10'd150;
			LogOffset2[4] = 10'd350;
			LogOffset3[4] = 10'd0;
			LogOffset4[4] = 10'd0;
			end
		endcase
	end



endmodule 