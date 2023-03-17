// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : counterUpDown

`timescale 1ns/1ps

module counterUpDown (
  input      [0:0]    upIn,
  input      [0:0]    downIn,
  output     [4:0]    countOut,
  input               clk,
  input               resetn
);

  wire       [4:0]    _zz_countTemp;
  wire       [4:0]    _zz_countTemp_1;
  wire       [4:0]    _zz_countTemp_2;
  reg        [4:0]    countTemp;

  assign _zz_countTemp = (countTemp - _zz_countTemp_1);
  assign _zz_countTemp_1 = {4'd0, downIn};
  assign _zz_countTemp_2 = {4'd0, upIn};
  assign countOut = countTemp;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      countTemp <= 5'h02;
    end else begin
      countTemp <= (_zz_countTemp + _zz_countTemp_2);
    end
  end


endmodule
