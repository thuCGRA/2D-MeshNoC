// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : muxOneHot

`timescale 1ns/1ps

module muxOneHot (
  input      [31:0]   dataIn_0,
  input      [31:0]   dataIn_1,
  input      [31:0]   dataIn_2,
  input      [2:0]    selOneHot,
  output     [31:0]   dataOut
);

  wire       [31:0]   dataMask_0;
  wire       [31:0]   dataMask_1;
  wire       [31:0]   dataMask_2;
  wire                _zz_dataMask_0;
  reg        [31:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [31:0]   _zz_dataMask_1_1;
  wire                _zz_dataMask_2;
  reg        [31:0]   _zz_dataMask_2_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[31] = _zz_dataMask_0;
    _zz_dataMask_0_1[30] = _zz_dataMask_0;
    _zz_dataMask_0_1[29] = _zz_dataMask_0;
    _zz_dataMask_0_1[28] = _zz_dataMask_0;
    _zz_dataMask_0_1[27] = _zz_dataMask_0;
    _zz_dataMask_0_1[26] = _zz_dataMask_0;
    _zz_dataMask_0_1[25] = _zz_dataMask_0;
    _zz_dataMask_0_1[24] = _zz_dataMask_0;
    _zz_dataMask_0_1[23] = _zz_dataMask_0;
    _zz_dataMask_0_1[22] = _zz_dataMask_0;
    _zz_dataMask_0_1[21] = _zz_dataMask_0;
    _zz_dataMask_0_1[20] = _zz_dataMask_0;
    _zz_dataMask_0_1[19] = _zz_dataMask_0;
    _zz_dataMask_0_1[18] = _zz_dataMask_0;
    _zz_dataMask_0_1[17] = _zz_dataMask_0;
    _zz_dataMask_0_1[16] = _zz_dataMask_0;
    _zz_dataMask_0_1[15] = _zz_dataMask_0;
    _zz_dataMask_0_1[14] = _zz_dataMask_0;
    _zz_dataMask_0_1[13] = _zz_dataMask_0;
    _zz_dataMask_0_1[12] = _zz_dataMask_0;
    _zz_dataMask_0_1[11] = _zz_dataMask_0;
    _zz_dataMask_0_1[10] = _zz_dataMask_0;
    _zz_dataMask_0_1[9] = _zz_dataMask_0;
    _zz_dataMask_0_1[8] = _zz_dataMask_0;
    _zz_dataMask_0_1[7] = _zz_dataMask_0;
    _zz_dataMask_0_1[6] = _zz_dataMask_0;
    _zz_dataMask_0_1[5] = _zz_dataMask_0;
    _zz_dataMask_0_1[4] = _zz_dataMask_0;
    _zz_dataMask_0_1[3] = _zz_dataMask_0;
    _zz_dataMask_0_1[2] = _zz_dataMask_0;
    _zz_dataMask_0_1[1] = _zz_dataMask_0;
    _zz_dataMask_0_1[0] = _zz_dataMask_0;
  end

  assign dataMask_0 = (_zz_dataMask_0_1 & dataIn_0);
  assign _zz_dataMask_1 = selOneHot[1];
  always @(*) begin
    _zz_dataMask_1_1[31] = _zz_dataMask_1;
    _zz_dataMask_1_1[30] = _zz_dataMask_1;
    _zz_dataMask_1_1[29] = _zz_dataMask_1;
    _zz_dataMask_1_1[28] = _zz_dataMask_1;
    _zz_dataMask_1_1[27] = _zz_dataMask_1;
    _zz_dataMask_1_1[26] = _zz_dataMask_1;
    _zz_dataMask_1_1[25] = _zz_dataMask_1;
    _zz_dataMask_1_1[24] = _zz_dataMask_1;
    _zz_dataMask_1_1[23] = _zz_dataMask_1;
    _zz_dataMask_1_1[22] = _zz_dataMask_1;
    _zz_dataMask_1_1[21] = _zz_dataMask_1;
    _zz_dataMask_1_1[20] = _zz_dataMask_1;
    _zz_dataMask_1_1[19] = _zz_dataMask_1;
    _zz_dataMask_1_1[18] = _zz_dataMask_1;
    _zz_dataMask_1_1[17] = _zz_dataMask_1;
    _zz_dataMask_1_1[16] = _zz_dataMask_1;
    _zz_dataMask_1_1[15] = _zz_dataMask_1;
    _zz_dataMask_1_1[14] = _zz_dataMask_1;
    _zz_dataMask_1_1[13] = _zz_dataMask_1;
    _zz_dataMask_1_1[12] = _zz_dataMask_1;
    _zz_dataMask_1_1[11] = _zz_dataMask_1;
    _zz_dataMask_1_1[10] = _zz_dataMask_1;
    _zz_dataMask_1_1[9] = _zz_dataMask_1;
    _zz_dataMask_1_1[8] = _zz_dataMask_1;
    _zz_dataMask_1_1[7] = _zz_dataMask_1;
    _zz_dataMask_1_1[6] = _zz_dataMask_1;
    _zz_dataMask_1_1[5] = _zz_dataMask_1;
    _zz_dataMask_1_1[4] = _zz_dataMask_1;
    _zz_dataMask_1_1[3] = _zz_dataMask_1;
    _zz_dataMask_1_1[2] = _zz_dataMask_1;
    _zz_dataMask_1_1[1] = _zz_dataMask_1;
    _zz_dataMask_1_1[0] = _zz_dataMask_1;
  end

  assign dataMask_1 = (_zz_dataMask_1_1 & dataIn_1);
  assign _zz_dataMask_2 = selOneHot[2];
  always @(*) begin
    _zz_dataMask_2_1[31] = _zz_dataMask_2;
    _zz_dataMask_2_1[30] = _zz_dataMask_2;
    _zz_dataMask_2_1[29] = _zz_dataMask_2;
    _zz_dataMask_2_1[28] = _zz_dataMask_2;
    _zz_dataMask_2_1[27] = _zz_dataMask_2;
    _zz_dataMask_2_1[26] = _zz_dataMask_2;
    _zz_dataMask_2_1[25] = _zz_dataMask_2;
    _zz_dataMask_2_1[24] = _zz_dataMask_2;
    _zz_dataMask_2_1[23] = _zz_dataMask_2;
    _zz_dataMask_2_1[22] = _zz_dataMask_2;
    _zz_dataMask_2_1[21] = _zz_dataMask_2;
    _zz_dataMask_2_1[20] = _zz_dataMask_2;
    _zz_dataMask_2_1[19] = _zz_dataMask_2;
    _zz_dataMask_2_1[18] = _zz_dataMask_2;
    _zz_dataMask_2_1[17] = _zz_dataMask_2;
    _zz_dataMask_2_1[16] = _zz_dataMask_2;
    _zz_dataMask_2_1[15] = _zz_dataMask_2;
    _zz_dataMask_2_1[14] = _zz_dataMask_2;
    _zz_dataMask_2_1[13] = _zz_dataMask_2;
    _zz_dataMask_2_1[12] = _zz_dataMask_2;
    _zz_dataMask_2_1[11] = _zz_dataMask_2;
    _zz_dataMask_2_1[10] = _zz_dataMask_2;
    _zz_dataMask_2_1[9] = _zz_dataMask_2;
    _zz_dataMask_2_1[8] = _zz_dataMask_2;
    _zz_dataMask_2_1[7] = _zz_dataMask_2;
    _zz_dataMask_2_1[6] = _zz_dataMask_2;
    _zz_dataMask_2_1[5] = _zz_dataMask_2;
    _zz_dataMask_2_1[4] = _zz_dataMask_2;
    _zz_dataMask_2_1[3] = _zz_dataMask_2;
    _zz_dataMask_2_1[2] = _zz_dataMask_2;
    _zz_dataMask_2_1[1] = _zz_dataMask_2;
    _zz_dataMask_2_1[0] = _zz_dataMask_2;
  end

  assign dataMask_2 = (_zz_dataMask_2_1 & dataIn_2);
  assign dataOut = ((dataMask_0 | dataMask_1) | dataMask_2);

endmodule
