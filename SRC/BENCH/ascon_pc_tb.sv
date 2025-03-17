module ascon_pc_tb;
    timeunit 1ns;
    timeprecision 1ps;
    // Inputs to the DUT
    reg [3:0] round_i;          // 4-bit round input (0 to 11)
    reg [319:0] S_i;            // 320-bit input state

    // Outputs from the DUT
    wire [319:0] S_o;           // 320-bit output state

    // Instantiate the DUT
    ascon_pc uut (
        .round_i(round_i),
        .S_i(S_i),
        .S_o(S_o)
    );

    // Testbench signal initialization
    initial begin
        // Display the output format for easier analysis
        $display("Round | S_i[319:256] | S_i[255:192] | S_i[191:128] | S_i[127:64] | S_i[63:0] | S_o[191:128]");
        // Initialize inputs
        round_i = 4'b0000;
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        // Test 12 rounds
        for (round_i = 0; round_i < 12; round_i = round_i + 1) begin
            #10;  // Wait for 10 time units
            $display(" round: %d | %h | %h | %h | %h | %h | %h |", round_i, S_i[319:256], S_i[255:192], S_i[191:128], S_o[191:128],S_i[127:64], S_i[63:0]);
        end
        
        // End of simulation
        $finish;
    end

endmodule
