
module tb_dual_port_ram;

    reg clk;
    reg we_a, we_b;
    reg [3:0] addr_a, addr_b;
    reg [7:0] data_in_a, data_in_b;
    wire [7:0] data_out_a, data_out_b;

    // Instantiate Dual Port RAM
    dual_port_ram uut (
        .clk(clk),
        .we_a(we_a),
        .we_b(we_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initialize inputs
        we_a = 0;
        we_b = 0;
        addr_a = 0;
        addr_b = 0;
        data_in_a = 0;
        data_in_b = 0;

        // Write operation
        #10;
        we_a = 1;
        we_b = 1;
        addr_a = 4'd1;
        addr_b = 4'd2;
        data_in_a = 8'hAA;
        data_in_b = 8'hBB;

        #10;

        // Read operation
        we_a = 0;
        we_b = 0;
        addr_a = 4'd1;
        addr_b = 4'd2;

        #10;

        // Display output
        $display("Port A Output = %h", data_out_a);
        $display("Port B Output = %h", data_out_b);

        // Another write operation
        we_a = 1;
        addr_a = 4'd3;
        data_in_a = 8'h55;

        #10;

        // Read again
        we_a = 0;
        addr_a = 4'd3;

        #10;

        $display("Port A Output = %h", data_out_a);

        $finish;
    end

endmodule
