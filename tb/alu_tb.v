`timescale 1ns/1ps

module alu_tb;

reg [3:0] a;
reg [3:0] b;
reg [2:0] op;

wire [3:0] y;
wire carry;
wire zero;

alu uut (
    .a(a),
    .b(b),
    .op(op),
    .y(y),
    .carry(carry),
    .zero(zero)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    a = 4'b0011; 
    b = 4'b0101; 
    op = 3'b000; // ADD
    #10;

    op = 3'b001; // SUB
    #10;

    op = 3'b010; // AND
    #10;

    op = 3'b011; // OR
    #10;

    op = 3'b100; // XOR
    #10;

    op = 3'b101; // NOT
    #10;

    $finish;

end

endmodule
