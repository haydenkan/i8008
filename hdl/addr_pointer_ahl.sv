`include "common.svh"

module addr_pointer_ahl(
    input wire [2:0] state,
    input wire [1:0] cycle,
    output reg [2:0] addr
);
    always @ ( * ) begin
        if ( cycle == `CYCLE_PCC ) begin
            addr <= `REG_A;
        end else begin
            case ( state )
                `STATE_T1 : addr <= `REG_H;
                `STATE_T2 : addr <= `REG_L;
                default  : addr <= `REG_A;
            endcase
        end
    end
endmodule // addr_pointer_ahl

