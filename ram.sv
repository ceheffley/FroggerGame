/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  frameRAMFrog
(
		input [4:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [4:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [4:0] mem [0:783];

initial
begin
	 $readmemh("sprite_bytes/frogger.txt", mem);
end

assign data_Out = mem[read_address];

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
end

endmodule


//car
module  frameRAMCar
(
		input [4:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [4:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [4:0] mem [0:1567];

initial
begin
	 $readmemh("sprite_bytes/car.txt", mem);
end

assign data_Out = mem[read_address];

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
end

endmodule



//log
module  frameRAMLog
(
		input [4:0] data_In,
		input [18:0] write_address, read_address,
		input we, Clk,

		output logic [4:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [4:0] mem [0:3136];

initial
begin
	 $readmemh("sprite_bytes/log.txt", mem);
end

assign data_Out = mem[read_address];

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
end

endmodule
