// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : Mem1r1w

`timescale 1ns/1ps

module Mem1r1w (
  input               wVi,
  input      [4:0]    wAddri,
  input      [31:0]   wDatai,
  input               rVi,
  input      [4:0]    rAddri,
  output     [31:0]   rDatao,
  input               clk,
  input               reset
);

  wire       [31:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [31:0] mem [0:31];

  assign _zz_mem_port0 = mem[rAddri];
  always @(posedge clk) begin
    if(wVi) begin
      mem[wAddri] <= wDatai;
    end
  end

  assign rDatao = _zz_mem_port0;

endmodule
