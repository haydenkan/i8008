`include "common.svh"

module sp_addr_mux(
    input wire       clk1,
    input wire       clk2,
    input wire       sync,
    input wire [3:0] sss_ddd,
    input wire [3:0] ahl,
    input wire [7:0] opcode,
    input wire [2:0] state,
    input wire [1:0] cycle,
    output reg [3:0] addr
);
    /** Whether or not the ALU will be required (with exception of INr and DCr) */
    wire alu = ~opcode[6] & ( opcode[7] | ( opcode[2] ^ opcode[1] ) ); /**< Select reg A in T5 */
    /** Logic inferred from datasheet */
    wire sss_ddd_sel = ( state[2] & state[0] ) & ( state[1] | ~alu ); /**< T4 or (T5 and not ALU) */
    always @ ( * ) begin
        if ( sss_ddd_sel ) begin
            addr <= sss_ddd;
        end else begin
            addr <= ahl;
        end
    end

endmodule // sp_addr_mux
