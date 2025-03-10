module Dualport_SRAM(clk, cs, write, read, address, data_in, data_out);
input clk, cs, write, read;
input [3:0]data_in;input [7:0]address;
output reg [3:0]data_out;
reg [3:0]memory[255:0];

always @ (posedge clk)
begin
    if(~cs)
        data_out<= 4'b0000;
    else begin
        if(write)
            memory[address] <= data_in;
        if (read)
            data_out <= memory[address];
    end
end
endmodule