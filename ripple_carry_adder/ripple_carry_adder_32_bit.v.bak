module ripple_carry_adder_32_bit(A, B, Cin, S, Cout);
    input [31:0] A, B;
    input Cin;
    wire [32:0] C;
    output [31:0] S;
    output Cout;

    assign C[0] = Cin;

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin
            ripple_carry_adder_1_bit r0 (A[i], B[i], C[i], S[i], C[i+1]);
        end
    endgenerate

    assign Cout = C[32];
endmodule
