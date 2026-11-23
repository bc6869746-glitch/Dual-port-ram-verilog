
module dual_port_ram (
    input clk,
    input we_a,
    input we_b,
    input [3:0] addr_a,
    input [3:0] addr_b,
    input [7:0] data_in_a,
    input [7:0] data_in_b,
    output reg [7:0] data_out_a,
    output reg [7:0] data_out_b
);

    reg [7:0] memory [15:0];

    always @(posedge clk)
    begin
        if (we_a)
            memory[addr_a] <= data_in_a;
        else
            data_out_a <= memory[addr_a];

        if (we_b)
            memory[addr_b] <= data_in_b;
        else
            data_out_b <= memory[addr_b];
    end

endmodule
