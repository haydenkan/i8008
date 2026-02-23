`include "common.svh"

module sp_addr_sss_ddd(
    input wire [2:0] state,
    input wire [7:0] data,
    output reg [2:0] out
);
    wire sss;
    wire ddd;
    assign sss = data[2:0];
    assign ddd = data[5:3];

    always @ ( * ) begin
        case ( state )
            `STATE_T4 : out <= sss;
            `STATE_T5 : out <= ddd;
            default : out <= `REG_M;
        endcase
    end

endmodule // sp_addr_sss_ddd
