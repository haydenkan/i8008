`include "common.svh"

module sp_addr_decoder(
    input wire  [2:0] addr,
    input wire        rd,
    input wire        wr,
    output wire [6:0] rd_sel,
    output wire [6:0] wr_sel
);
    assign rd_sel[0] = rd && (addr == `REG_A);
    assign rd_sel[1] = rd && (addr == `REG_B);
    assign rd_sel[2] = rd && (addr == `REG_C);
    assign rd_sel[3] = rd && (addr == `REG_D);
    assign rd_sel[4] = rd && (addr == `REG_E);
    assign rd_sel[5] = rd && (addr == `REG_H);
    assign rd_sel[6] = rd && (addr == `REG_L);

    assign wr_sel[0] = wr && (addr == `REG_A);
    assign wr_sel[1] = wr && (addr == `REG_B);
    assign wr_sel[2] = wr && (addr == `REG_C);
    assign wr_sel[3] = wr && (addr == `REG_D);
    assign wr_sel[4] = wr && (addr == `REG_E);
    assign wr_sel[5] = wr && (addr == `REG_H);
    assign wr_sel[6] = wr && (addr == `REG_L);
endmodule // sp_addr_decoder
