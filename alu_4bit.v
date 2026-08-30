module alu_4bit (
    input [3:0] A,
    input [3:0] B,
    input [2:0] S,

    output reg [3:0] Y,
    output reg       carry,
    output reg       borrow,
    output           zero
);

    reg [4:0] temp;

    always@(*) begin

        //default values
        Y = 4'b0000;
        carry = 1'b0;
        borrow = 1'b0;
        temp = 5'b00000;

        case (S)

        3'b000: begin
            //ADD//////////////////////////////////////
            temp = A + B;
            Y = temp[3:0];
            carry = temp[4];
        end

        3'b001: begin
            //SUB////////////////////////////////////////
            Y = A - B;

            if(A<B)
            borrow = 1'b1;
        end

        3'b010: begin
            //AND///////////////////////////////////////
            Y = A & B;
        end

        3'b011: begin
            //OR////////////////////////////////////////
            Y = A | B;
        end

        3'b100: begin
            //XOR////////////////////////////////////////
            Y = A ^ B;
        end

        3'b101: begin
            //XNOR///////////////////////////////////////
            Y = ~(A ^ B);
        end

        3'b110: begin
            //LEFT SHIFT////////////////////////////////
            Y = A << 1;
        end

        3'b111: begin
            //RIGHT SHIFT//////////////////////////////
            Y = A >> 1;
        end

        default:begin
        Y = 4'b0000;
        carry = 1'b0;
        borrow = 1'b0;

        end

        endcase

    end

    //ZERO FLAG/////////////////////////////

    assign zero = (Y == 4'b0000);

endmodule


