`include "common.svh"

module scratch_pad(
    input wire [6:0] rs, /**< Register select */
    input wire       we, /**< Write enable */
    input wire [7:0] in, /**< Input data */
    output reg [7:0] out /**< Output data */
);
    reg [7:0] registers[0:6]; /**< 7 x 8b internal registers */

    always @ ( * ) begin
        if ( we ) begin
            case ( rs )
                7'b0000001 : registers[0] = in;
                7'b0000010 : registers[1] = in;
                7'b0000100 : registers[2] = in;
                7'b0001000 : registers[3] = in;
                7'b0010000 : registers[4] = in;
                7'b0100000 : registers[5] = in;
                7'b1000000 : registers[6] = in;
                default    : ;
            endcase
        end
        case ( rs )
            7'b0000001 : out = registers[0];
            7'b0000010 : out = registers[1];
            7'b0000100 : out = registers[2];
            7'b0001000 : out = registers[3];
            7'b0010000 : out = registers[4];
            7'b0100000 : out = registers[5];
            7'b1000000 : out = registers[6];
            default    : ;
        endcase
    end


endmodule // scratch_pad
