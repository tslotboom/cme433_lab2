module ripple_carry_adder_32_bit(
			A,
			B,
			Cin,
			S_reg,
			Cout_reg,
			clk);
	input clk;
    input [31:0] A, B;
    input Cin;
    wire [32:0] C;
    wire [31:0] S;
    wire Cout;

	reg [31:0] A_reg, B_reg;
	reg Cin_reg;
	output reg [31:0] S_reg;
	output reg Cout_reg;

	// registers
    always @ (posedge clk) begin
        A_reg <= A;
        B_reg <= B;
        Cin_reg <= Cin;
        S_reg <= S;
        Cout_reg <= Cout;
    end

    assign C[0] = Cin_reg;

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin : nate
            ripple_carry_adder_1_bit r0 (A_reg[i], B_reg[i], C[i], S[i], C[i+1]);
			end
    endgenerate

    assign Cout = C[32];
endmodule
