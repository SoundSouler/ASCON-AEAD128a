module ascon_ps (
    input  [319:0] S_i,  // 320-bit state (5 registers x 64 bits)
    output [319:0] S_o  // 320-bit output state
);

    // S-box LUT as defined by Table 5
    function [4:0] sbox;
        input [4:0] x;
        case (x)
            5'h00: sbox = 5'h04;
            5'h01: sbox = 5'h0b;
            5'h02: sbox = 5'h1f;
            5'h03: sbox = 5'h14;
            5'h04: sbox = 5'h1a;
            5'h05: sbox = 5'h15;
            5'h06: sbox = 5'h09;
            5'h07: sbox = 5'h02;
            5'h08: sbox = 5'h1b;
            5'h09: sbox = 5'h05;
            5'h0a: sbox = 5'h08;
            5'h0b: sbox = 5'h0c;
            5'h0c: sbox = 5'h1d;
            5'h0d: sbox = 5'h03;
            5'h0e: sbox = 5'h06;
            5'h0f: sbox = 5'h1c;
            5'h10: sbox = 5'h1e;
            5'h11: sbox = 5'h13;
            5'h12: sbox = 5'h07;
            5'h13: sbox = 5'h0e;
            5'h14: sbox = 5'h00;
            5'h15: sbox = 5'h0d;
            5'h16: sbox = 5'h11;
            5'h17: sbox = 5'h18;
            5'h18: sbox = 5'h10;
            5'h19: sbox = 5'h0c;
            5'h1a: sbox = 5'h01;
            5'h1b: sbox = 5'h19;
            5'h1c: sbox = 5'h16;
            5'h1d: sbox = 5'h0a;
            5'h1e: sbox = 5'h0f;
            5'h1f: sbox = 5'h17;
            default: sbox = 5'h00;
        endcase
    endfunction

    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1) begin : sbox_application
            assign S_o[5*i +: 5] = sbox(S_i[5*i +: 5]);
        end
    endgenerate

endmodule
