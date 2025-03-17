`timescale 1ns/1ps

module ascon_pc(
    input  logic [3:0] round_i,  // 4-bit round input (0 to 11)
    input  logic [319:0] S_i,    // 320-bit input state (5 x 64-bit words)
    output logic [319:0] S_o     // 320-bit output state
);

    // Import the round constants from the package
    import ascon_pack::*;

    // Pass-through for all bits except S[2], which gets XORed with the round constant
    always_comb begin
        S_o[319:256] = S_i[319:256]; // S[0] (64 bits)
        S_o[255:192] = S_i[255:192]; // S[1] (64 bits)
        S_o[191:128] = S_i[191:128] ^ {56'b0, round_constant[round_i]}; // S[2] (64 bits) XOR with round constant
        S_o[127:64]  = S_i[127:64];  // S[3] (64 bits)
        S_o[63:0]    = S_i[63:0];    // S[4] (64 bits)
    end

endmodule