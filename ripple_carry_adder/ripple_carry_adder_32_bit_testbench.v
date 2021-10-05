`timescale 1 ns / 1 ps
module ripple_carry_adder_32_bit_testbench;
    reg clk = 1'b1;
    reg slow_clk = 1'b1;
    always begin
        #1;
        clk = ~clk;
    end
    always begin
        #10;
        slow_clk = ~slow_clk;
    end

    // inputs
    reg [31:0] A = 32'b0;
    reg [31:0] B = 32'b0;
    reg Cin = 1'b1;
    wire [31:0] S;
    wire Cout;

    // outputs
    reg expected_Cout;
    reg Cout_check;
    reg [31:0] expected_S;
    reg S_check;

    // module instantiation
    ripple_carry_adder_32_bit adder(A, B, Cin, S, Cout, clk);

    // checking if outputs are correct
    always @ (posedge slow_clk)
        begin
            @(posedge clk)
            @(posedge clk)
            #1
            expected_S = A + B + Cin;
            expected_Cout = ((expected_S < A) || (expected_S < B));
            // reduction OR of XNOR checks if all bits match -
            // XNOR = 1 if bits match, reduction AND evaluates to 1 only if all
            // bits are zero.
            S_check = &(S ~^ expected_S);
            // XNOR evaluates to 1 if both bits are equal
            Cout_check = Cout ~^ expected_Cout;
        end


    // test cases
    always @ (posedge slow_clk) begin
        A <= $random;
        B <= $random;
        Cin <= $random % 2;
    end
    initial #200000 $stop;
endmodule
