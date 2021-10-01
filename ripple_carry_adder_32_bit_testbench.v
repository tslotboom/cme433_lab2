`timescale 1 ns / 1 ps
module ripple_carry_adder_32_bit_testbench;
    reg clk = 1'b1;
    always begin
        #1;
        clk = ~clk;
    end

    // inputs
    reg [31:0] A = 32'b0;
    reg [31:0] A_reg = 32'b0;
    reg [31:0] B = 32'b0;
    reg [31:0] B_reg = 32'b0;
    reg Cin = 1'b1;
    reg Cin_reg = 1'b1;
    wire [31:0] S;
    reg [31:0] S_reg;
    wire Cout;
    reg Cout_reg;

    // outputs
    reg expected_Cout;
    reg Cout_check;
    reg [31:0] expected_S;
    reg S_check;

    // module instantiation
    ripple_carry_adder_32_bit adder(A, B, Cin, S, Cout);

    // checking if outputs are correct
    always @ *
        begin
            expected_S <= A_reg + B_reg + Cin_reg;
            expected_Cout <= ((expected_S < A_reg) || (expected_S < B_reg));
            // reduction OR of XNOR checks if all bits match -
            // XNOR = 1 if bits match, reduction AND evaluates to 1 only if all
            // bits are zero.
            S_check <= &(S_reg ~^ expected_S);
            // XNOR evaluates to 1 if both bits are equal
            Cout_check <= Cout_reg ~^ expected_Cout;
        end

    // registers
    always @ (posedge clk) begin
        A_reg <= A;
        B_reg <= B;
        Cin_reg <= Cin;
        S_reg <= S;
        Cout_reg <= Cout;
    end

    // test cases
    always begin
        #10;
        A <= 32'hABCD;
        #10;
        Cin <= 1'b1;
        #10;
        A <= 32'h1111_1111;
        B <= 32'h23D0_68A9;
        #10;
        A <= 32'hADF1_3453;
        B <= 32'h2312_AAAA;
        #10;
        Cin <= 1'b0;
        A <= 32'h0543_F4F5;
        B <= 32'h0222_0432;
        #10;
        // test carry out
        A <= 32'hFFFF_FFFF;
        B <= 32'h0000_0000;
        Cin <= 1'b1;
        #10
        A <= 32'hFFFF_FF01;
        B <= 32'h0000_00FF;
        Cin <= 1'b1;
    end
    initial #100 $stop;
endmodule
