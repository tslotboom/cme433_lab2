module ripple_carry_adder_1_bit(A, B, Cin, S, Cout);
    input A, B, Cin;
    wire A_B_XOR, A_B_AND, A_B_XOR_Cin_AND;
    output S, Cout;

    assign A_B_XOR = A ^ B;
    assign A_B_AND = A & B;
    assign A_B_XOR_Cin_AND = A_B_XOR & Cin;
    assign S = A_B_XOR ^ Cin;
    assign Cout = A_B_AND | A_B_XOR_Cin_AND;
endmodule
