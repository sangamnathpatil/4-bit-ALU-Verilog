`timescale 1ns/1ps

module alu_4bit_tb;

reg [3:0] A;
reg [3:0] B;
reg [2:0] S;

wire [3:0] Y;
wire       carry;
wire       borrow;
wire       zero;

alu_4bit uut(
    .A(A),
    .B(B),
    .S(S),
    .Y(Y),
    .carry(carry),
    .borrow(borrow),
    .zero(zero)
);

initial begin

    $dumpfile("alu_4bit.vcd");
    $dumpvars(0, alu_4bit_tb);

    $monitor("Time=%0t  A=%b  B=%b  S=%b  Y=%b  carry=%b  borrow=%b  zero=%b",
              $time, A, B, S, Y, carry, borrow, zero );

    //ADD///////////////////////////
    A = 4'b0011;
    B = 4'b0001;
    S = 3'b000;
    #10;

    //ADD WITH CARRY////////////////
    A = 4'b1100;
    B = 4'b1001;
    S = 3'b000;
    #10;

    //SUB//////////////////////////
    A = 4'b1100;
    B = 4'b1001;
    S = 3'b001;
    #10;

    //SUB WITH BORROW//////////////
    A = 4'b1001;
    B = 4'b1100;
    S = 3'b001;
    #10;   

    //FOR ZERO RESULT//////////////
    A = 4'b1010;
    B = 4'b1010;
    S = 3'b001;
    #10;

    //AND//////////////////////////
    A = 4'b1010;
    B = 4'b0101;
    S = 3'b010;
    #10;

    //OR//////////////////////////
    A = 4'b1010;
    B = 4'b0101;
    S = 3'b011;
    #10;

    //XOR/////////////////////////
    A = 4'b1010;
    B = 4'b0101;
    S = 3'b100;
    #10;

    //XNOR///////////////////////
    A = 4'b1010;
    B = 4'b0101;
    S = 3'b101;
    #10;

    //LEFT SHIFT/////////////////
    A = 4'b1011;
    B = 4'b0011;
    S = 3'b110;
    #10;

    //RIGHT SHIFT///////////////
    A = 4'b1011;
    B = 4'b0011;
    S = 3'b111;
    #10;

    $finish;

end

endmodule



    
