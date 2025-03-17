module ascon_p #(
    parameter int NUM_ROUNDS = 12  // Number of rounds (8 or 12)
) (
    input  logic [319:0] S_i,   // 320-bit input state
    output logic [319:0] S_o    // 320-bit output state
);

    logic [319:0] state_pc, state_ps, state_pl;  // Intermediate states

    // Instantiate the permutation modules
    ascon_pc pc_inst (
        .round_i(0),      // Placeholder, will be driven dynamically
        .S_i(state_pc),
        .S_o(state_ps)
    );

    ascon_ps ps_inst (
        .S_i(state_ps),
        .S_o(state_pl)
    );

    ascon_pl pl_inst (
        .S_i(state_pl),
        .S_o(state_pc)
    );

    always_comb begin
        state_pc = S_i;  // Initialize state

        for (int i = 0; i < NUM_ROUNDS; i++) begin
            // Dynamically update the round constant
            pc_inst.round_i = i;

            // Trigger the permutation chain
            state_pc = state_pc;
        end

        S_o = state_pc;  // Final state after all rounds
    end

endmodule
