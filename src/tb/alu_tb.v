`timescale 1ns/1ps

module alu_tb;
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [2:0] op;
    wire [3:0] y;
    wire       carry;
    wire       zero;

    alu dut (
        .a(a), .b(b), .op(op),
        .y(y), .carry(carry), .zero(zero)
    );

    // dump waveform
    initial begin
        $dumpfile("sim/alu.vcd");
        $dumpvars(0, alu_tb);
    end

    task run_case(input [3:0] aa, input [3:0] bb, input [2:0] oop);
    begin
        a = aa; b = bb; op = oop;
        #10;
    end
    endtask

    initial begin
        // init
        a = 0; b = 0; op = 0;
        #5;

        // ADD
        run_case(4'd3, 4'd5, 3'b000);
        run_case(4'd15,4'd1, 3'b000);

        // SUB
        run_case(4'd9, 4'd2, 3'b001);
        run_case(4'd2, 4'd9, 3'b001);

        // AND/OR/XOR
        run_case(4'hA, 4'hC, 3'b010);
        run_case(4'hA, 4'hC, 3'b011);
        run_case(4'hA, 4'hC, 3'b100);

        // NOT / shift
        run_case(4'h3, 4'h0, 3'b101);
        run_case(4'h3, 4'h0, 3'b110);
        run_case(4'h8, 4'h0, 3'b111);

        #20;
        $finish;
    end
endmodule
