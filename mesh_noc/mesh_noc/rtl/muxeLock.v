// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : muxeLock

`timescale 1ns/1ps

module muxeLock (
  input               validIn,
  output              yumiOut,
  input      [31:0]   dataIn,
  input      [3:0]    maskIn,
  input      [31:0]   addrIn,
  input               weIn,
  input               swapAqIn,
  input               swapRlIn,
  input      [1:0]    xCordinateIn,
  input      [1:0]    yCordinateIn,
  output              combvalidOut,
  input               combyumiIn,
  output     [31:0]   combdataOut,
  output     [3:0]    combmaskOut,
  output     [31:0]   combaddrOut,
  output              combweOut,
  output     [1:0]    combxCordinateOut,
  output     [1:0]    combyCordinateOut,
  input      [31:0]   returningDataIn,
  input               returningValidIn,
  output     [31:0]   combReturningDataOut,
  output              combReturningValidOut,
  input               clk,
  input               resetn
);

  wire       [0:0]    myCounterUpDown_upIn;
  wire       [0:0]    myCounterUpDown_downIn;
  wire       [6:0]    myCounterUpDown_countOut;
  wire       [31:0]   _zz_combReturningDataOut;
  wire       [0:0]    _zz_combReturningDataOut_1;
  reg        [31:0]   swapAddr;
  reg        [1:0]    swapXCordinate;
  reg        [1:0]    swapYCordinate;
  reg                 swapLock;
  wire                nodeIsIdle;
  wire                swapAqYumi;
  wire                swapAqSuccess;
  wire                swapAqFail;
  wire                swapMatch;
  wire                swapRlYumi;
  reg                 swapResultValid;
  reg                 swapAqResult;
  wire                lockSucessEncode;
  wire                lockFailEncode;
  wire       [6:0]    requestNumInNode;

  assign _zz_combReturningDataOut_1 = swapAqResult;
  assign _zz_combReturningDataOut = {31'd0, _zz_combReturningDataOut_1};
  counterUpDown myCounterUpDown (
    .upIn     (myCounterUpDown_upIn         ), //i
    .downIn   (myCounterUpDown_downIn       ), //i
    .countOut (myCounterUpDown_countOut[6:0]), //o
    .clk      (clk                          ), //i
    .resetn   (resetn                       )  //i
  );
  assign swapAqYumi = ((validIn && swapAqIn) && nodeIsIdle);
  assign swapAqSuccess = (swapAqYumi && (! swapLock));
  assign swapAqFail = (swapAqYumi && swapLock);
  assign swapMatch = (((swapAddr == addrIn) && (swapXCordinate == xCordinateIn)) && (swapYCordinate == yCordinateIn));
  assign swapRlYumi = ((validIn && swapRlIn) && nodeIsIdle);
  assign yumiOut = ((swapRlYumi || swapRlYumi) || combyumiIn);
  assign combvalidOut = (validIn && (! (swapAqIn || swapRlIn)));
  assign combdataOut = dataIn;
  assign combmaskOut = maskIn;
  assign combaddrOut = addrIn;
  assign combxCordinateOut = xCordinateIn;
  assign combyCordinateOut = yCordinateIn;
  assign combweOut = weIn;
  assign lockSucessEncode = 1'b0;
  assign lockFailEncode = 1'b1;
  assign combReturningValidOut = (swapResultValid || returningValidIn);
  assign combReturningDataOut = (swapResultValid ? _zz_combReturningDataOut : returningDataIn);
  assign myCounterUpDown_downIn = combyumiIn;
  assign myCounterUpDown_upIn = returningValidIn;
  assign requestNumInNode = myCounterUpDown_countOut;
  assign nodeIsIdle = (requestNumInNode == 7'h64);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      swapLock <= 1'b0;
      swapResultValid <= 1'b0;
      swapAqResult <= 1'b0;
    end else begin
      if(swapAqSuccess) begin
        swapLock <= 1'b1;
      end else begin
        if(swapAqYumi) begin
          swapLock <= 1'b0;
        end
      end
      swapResultValid <= (swapAqYumi || swapRlYumi);
      swapAqResult <= (swapAqSuccess ? lockSucessEncode : lockFailEncode);
    end
  end

  always @(posedge clk) begin
    if(swapAqSuccess) begin
      swapAddr <= addrIn;
      swapXCordinate <= xCordinateIn;
      swapYCordinate <= yCordinateIn;
    end else begin
      if(swapAqYumi) begin
        swapAddr <= 32'h0;
        swapXCordinate <= 2'b00;
        swapYCordinate <= 2'b00;
      end
    end
  end


endmodule

module counterUpDown (
  input      [0:0]    upIn,
  input      [0:0]    downIn,
  output     [6:0]    countOut,
  input               clk,
  input               resetn
);

  wire       [6:0]    _zz_countTemp;
  wire       [6:0]    _zz_countTemp_1;
  wire       [6:0]    _zz_countTemp_2;
  reg        [6:0]    countTemp;

  assign _zz_countTemp = (countTemp - _zz_countTemp_1);
  assign _zz_countTemp_1 = {6'd0, downIn};
  assign _zz_countTemp_2 = {6'd0, upIn};
  assign countOut = countTemp;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      countTemp <= 7'h64;
    end else begin
      countTemp <= (_zz_countTemp + _zz_countTemp_2);
    end
  end


endmodule
