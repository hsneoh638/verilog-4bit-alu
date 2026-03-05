module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] op,
    output reg [3:0] y,
    output reg       carry,
    output reg       zero
);
    reg [4:0] tmp;

    always @(*) begin
        carry = 1'b0;
        tmp   = 5'd0;

        case (op)
            3'b000: begin // ADD
                tmp   = a + b;
                y     = tmp[3:0];
                carry = tmp[4];
            end
            3'b001: begin // SUB
                tmp   = {1'b0,a} - {1'b0,b};
                y     = tmp[3:0];
                carry = tmp[4]; // borrow flag style (depends how you interpret)
            end
            3'b010: y = a & b; // AND
            3'b011: y = a | b; // OR
            3'b100: y = a ^ b; // XOR
            3'b101: y = ~a;    // NOT A
            3'b110: y = (a << 1);
            3'b111: y = (a >> 1);
            default: y = 4'b0000;
        endcase

        zero = (y == 4'b0000);
    end
endmodule
