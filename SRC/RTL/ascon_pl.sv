module ascon_pl (
    input  logic [319:0] S_i,  // 320-bit input state (5 registers x 64 bits)
    output logic [319:0] S_o   // 320-bit output state
);
    logic [63:0] x0, x1, x2, x3, x4;

    // Function to perform right rotation
    function logic [63:0] ror(input logic [63:0] val, input int rot_amount);
        ror = (val >> rot_amount) | (val << (64 - rot_amount));
    endfunction

    // Split the input state into 64-bit words
    assign x0 = S_i[319:256];
    assign x1 = S_i[255:192];
    assign x2 = S_i[191:128];
    assign x3 = S_i[127:64];
    assign x4 = S_i[63:0];

    // Apply linear diffusion functions with right rotations
    assign S_o[319:256] = x0 ^ ror(x0, 19) ^ ror(x0, 28);
    assign S_o[255:192] = x1 ^ ror(x1, 61) ^ ror(x1, 39);
    assign S_o[191:128] = x2 ^ ror(x2, 1)  ^ ror(x2, 6);
    assign S_o[127:64]  = x3 ^ ror(x3, 10) ^ ror(x3, 17);
    assign S_o[63:0]    = x4 ^ ror(x4, 7)  ^ ror(x4, 41);

endmodule
