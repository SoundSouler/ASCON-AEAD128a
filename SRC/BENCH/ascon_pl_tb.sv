
module ascon_pl_tb;

    // Input and output signals
    logic [319:0] S_i;
    logic [319:0] S_o;

    // Instantiate the DUT (Device Under Test)
    ascon_pl uut (
        .S_i(S_i),
        .S_o(S_o)
    );

    // Test procedure
    initial begin
        $display("Starting ASCON_PL Testbench");

        // Test 1: All zeros
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Test 1 - All Zeros: S_o = %h", S_o);

        // Test 2: All ones
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Test 2 - All Ones: S_o = %h", S_o);

        // Test 3: Alternating bits
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Test 3 - Alternating Bits: S_o = %h", S_o);

        // Test 4: Random pattern
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Test 4 - Random Pattern: S_o = %h", S_o);

        // Test 5: Edge case - Single bit set
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Test 5 - Single Bit Set: S_o = %h", S_o);

        $display("ASCON_PL Testbench Completed");
        $finish;
    end

endmodule
