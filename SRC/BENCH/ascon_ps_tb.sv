module ascon_ps_tb;

    // Testbench signals
    reg  [319:0] S_i;
    wire [319:0] S_o;

    // Instantiate the ASCON permutation S-box module
    ascon_ps uut (
        .S_i(S_i),
        .S_o(S_o)
    );

    // Test procedure
    initial begin
        $display("Starting ASCON PS Testbench");

        // Test case 1: All zeros
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Input: %h, Output: %h", S_i, S_o);

        // Test case 2: All ones
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Input: %h, Output: %h", S_i, S_o);

        // Test case 3: Alternating pattern
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Input: %h, Output: %h", S_i, S_o);

        // Test case 4: Incrementing values
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Input: %h, Output: %h", S_i, S_o);

        // Test case 5: Random input
        S_i = 320'hfeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeeffeedfacecafebeef;
        #10;
        $display("Input: %h, Output: %h", S_i, S_o);

        $display("Testbench completed.");
        $finish;
    end

endmodule
