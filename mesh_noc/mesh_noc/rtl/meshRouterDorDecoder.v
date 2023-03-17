// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : meshRouterDorDecoder

`timescale 1ns/1ps

module meshRouterDorDecoder (
  input               validIn_0,
  input               validIn_1,
  input               validIn_2,
  input               validIn_3,
  input               validIn_4,
  input      [1:0]    xDirIn_0,
  input      [1:0]    xDirIn_1,
  input      [1:0]    xDirIn_2,
  input      [1:0]    xDirIn_3,
  input      [1:0]    xDirIn_4,
  input      [1:0]    yDirIn_0,
  input      [1:0]    yDirIn_1,
  input      [1:0]    yDirIn_2,
  input      [1:0]    yDirIn_3,
  input      [1:0]    yDirIn_4,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  output reg [4:0]    reqOut_0,
  output reg [4:0]    reqOut_1,
  output reg [4:0]    reqOut_2,
  output reg [4:0]    reqOut_3,
  output reg [4:0]    reqOut_4
);

  wire                xeq_0;
  wire                xeq_1;
  wire                xeq_2;
  wire                xeq_3;
  wire                xeq_4;
  wire                yeq_0;
  wire                yeq_1;
  wire                yeq_2;
  wire                yeq_3;
  wire                yeq_4;
  wire                xgt_0;
  wire                xgt_1;
  wire                xgt_2;
  wire                xgt_3;
  wire                xgt_4;
  wire                ygt_0;
  wire                ygt_1;
  wire                ygt_2;
  wire                ygt_3;
  wire                ygt_4;
  wire                xlt_0;
  wire                xlt_1;
  wire                xlt_2;
  wire                xlt_3;
  wire                xlt_4;
  wire                ylt_0;
  wire                ylt_1;
  wire                ylt_2;
  wire                ylt_3;
  wire                ylt_4;
  wire       [4:0]    _zz_validStud_0;
  wire                validStud_0;
  wire                validStud_1;
  wire                validStud_2;
  wire                validStud_3;
  wire                validStud_4;

  assign _zz_validStud_0 = 5'h0;
  assign validStud_0 = (validIn_0 && _zz_validStud_0[0]);
  assign validStud_1 = (validIn_1 && _zz_validStud_0[1]);
  assign validStud_2 = (validIn_2 && _zz_validStud_0[2]);
  assign validStud_3 = (validIn_3 && _zz_validStud_0[3]);
  assign validStud_4 = (validIn_4 && _zz_validStud_0[4]);
  assign xeq_0 = (xDirIn_0 == myXCordIn);
  assign yeq_0 = (yDirIn_0 == myYCordIn);
  assign xgt_0 = (myXCordIn < xDirIn_0);
  assign ygt_0 = (myYCordIn < yDirIn_0);
  assign xlt_0 = ((! xgt_0) && (! xeq_0));
  assign ylt_0 = ((! ygt_0) && (! yeq_0));
  assign xeq_1 = (xDirIn_1 == myXCordIn);
  assign yeq_1 = (yDirIn_1 == myYCordIn);
  assign xgt_1 = (myXCordIn < xDirIn_1);
  assign ygt_1 = (myYCordIn < yDirIn_1);
  assign xlt_1 = ((! xgt_1) && (! xeq_1));
  assign ylt_1 = ((! ygt_1) && (! yeq_1));
  assign xeq_2 = (xDirIn_2 == myXCordIn);
  assign yeq_2 = (yDirIn_2 == myYCordIn);
  assign xgt_2 = (myXCordIn < xDirIn_2);
  assign ygt_2 = (myYCordIn < yDirIn_2);
  assign xlt_2 = ((! xgt_2) && (! xeq_2));
  assign ylt_2 = ((! ygt_2) && (! yeq_2));
  assign xeq_3 = (xDirIn_3 == myXCordIn);
  assign yeq_3 = (yDirIn_3 == myYCordIn);
  assign xgt_3 = (myXCordIn < xDirIn_3);
  assign ygt_3 = (myYCordIn < yDirIn_3);
  assign xlt_3 = ((! xgt_3) && (! xeq_3));
  assign ylt_3 = ((! ygt_3) && (! yeq_3));
  assign xeq_4 = (xDirIn_4 == myXCordIn);
  assign yeq_4 = (yDirIn_4 == myYCordIn);
  assign xgt_4 = (myXCordIn < xDirIn_4);
  assign ygt_4 = (myYCordIn < yDirIn_4);
  assign xlt_4 = ((! xgt_4) && (! xeq_4));
  assign ylt_4 = ((! ygt_4) && (! yeq_4));
  always @(*) begin
    reqOut_1[3] = ((validStud_1 && xeq_1) && ylt_1);
    reqOut_1[4] = ((validStud_1 && xeq_1) && ygt_1);
    reqOut_1[1] = 1'b0;
    reqOut_1[2] = (validStud_1 && xgt_1);
    reqOut_1[0] = ((validStud_1 && xeq_1) && yeq_1);
  end

  always @(*) begin
    reqOut_2[3] = ((validStud_2 && xeq_2) && ylt_2);
    reqOut_2[4] = ((validStud_2 && xeq_2) && ygt_2);
    reqOut_2[1] = (validStud_2 && xlt_2);
    reqOut_2[2] = 1'b0;
    reqOut_2[0] = ((validStud_2 && xeq_2) && yeq_2);
  end

  always @(*) begin
    reqOut_3[1] = 1'b0;
    reqOut_3[2] = 1'b0;
    reqOut_3[3] = 1'b0;
    reqOut_3[4] = ((validStud_3 && xeq_3) && ygt_3);
    reqOut_3[0] = ((validStud_3 && xeq_3) && yeq_3);
  end

  always @(*) begin
    reqOut_4[1] = 1'b0;
    reqOut_4[2] = 1'b0;
    reqOut_4[3] = ((validStud_4 && xeq_4) && ylt_4);
    reqOut_4[4] = 1'b0;
    reqOut_4[0] = ((validStud_4 && xeq_4) && yeq_4);
  end

  always @(*) begin
    reqOut_0[2] = (validStud_0 && xgt_0);
    reqOut_0[1] = (validStud_0 && xlt_0);
    reqOut_0[0] = 1'b0;
    reqOut_0[3] = ((validStud_0 && xeq_0) && ylt_0);
    reqOut_0[4] = ((validStud_0 && xeq_0) && ygt_0);
  end


endmodule
