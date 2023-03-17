// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : rrArbiter

`timescale 1ns/1ps

module rrArbiter (
  input               grantsEnIn,
  input      [2:0]    reqsIn,
  output     [2:0]    grantsOut,
  output     [2:0]    selOneHotOut,
  input               yumIn,
  output     [1:0]    oneHotIndex,
  output              validOut,
  input               clk,
  input               resetn
);

  wire       [2:0]    reqsMask;
  reg        [2:0]    maskHigerReq;
  reg        [2:0]    unmaskHigerReq;
  wire       [2:0]    maskSelOneHot;
  wire       [2:0]    unMaskSelOneHot;
  wire                noReqMask;
  reg        [2:0]    pointerReg;
  wire       [2:0]    _zz_pointerReg;
  wire                when_nocDefines_l392;
  wire                when_nocDefines_l395;
  reg        [2:0]    _zz_selOneHotOut;
  reg        [2:0]    _zz_grantsOut;
  reg        [1:0]    oneHotIndex_0;
  reg        [1:0]    oneHotIndex_1;
  reg        [1:0]    oneHotIndex_2;
  wire                when_nocDefines_l419;
  wire                when_nocDefines_l419_1;
  wire                when_nocDefines_l419_2;

  assign _zz_pointerReg[2 : 0] = 3'b111;
  assign when_nocDefines_l392 = (|reqsMask);
  assign when_nocDefines_l395 = (|reqsIn);
  assign reqsMask = (reqsIn & pointerReg);
  always @(*) begin
    maskHigerReq[2 : 1] = (maskHigerReq[1 : 0] | reqsMask[1 : 0]);
    maskHigerReq[0] = 1'b0;
  end

  assign maskSelOneHot = (reqsMask & (~ maskHigerReq));
  always @(*) begin
    unmaskHigerReq[2 : 1] = (unmaskHigerReq[1 : 0] | reqsIn[1 : 0]);
    unmaskHigerReq[0] = 1'b0;
  end

  assign unMaskSelOneHot = (reqsIn & (~ unmaskHigerReq));
  assign noReqMask = (! (|reqsMask));
  always @(*) begin
    _zz_selOneHotOut[2] = noReqMask;
    _zz_selOneHotOut[1] = noReqMask;
    _zz_selOneHotOut[0] = noReqMask;
  end

  assign selOneHotOut = ((_zz_selOneHotOut & unMaskSelOneHot) | maskSelOneHot);
  always @(*) begin
    _zz_grantsOut[2] = grantsEnIn;
    _zz_grantsOut[1] = grantsEnIn;
    _zz_grantsOut[0] = grantsEnIn;
  end

  assign grantsOut = (_zz_grantsOut & selOneHotOut);
  assign validOut = ((|reqsIn) && yumIn);
  assign when_nocDefines_l419 = selOneHotOut[0];
  always @(*) begin
    if(when_nocDefines_l419) begin
      oneHotIndex_0 = 2'b00;
    end else begin
      oneHotIndex_0 = 2'b00;
    end
  end

  assign when_nocDefines_l419_1 = selOneHotOut[1];
  always @(*) begin
    if(when_nocDefines_l419_1) begin
      oneHotIndex_1 = 2'b01;
    end else begin
      oneHotIndex_1 = 2'b00;
    end
  end

  assign when_nocDefines_l419_2 = selOneHotOut[2];
  always @(*) begin
    if(when_nocDefines_l419_2) begin
      oneHotIndex_2 = 2'b10;
    end else begin
      oneHotIndex_2 = 2'b00;
    end
  end

  assign oneHotIndex = ((oneHotIndex_0 | oneHotIndex_1) | oneHotIndex_2);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pointerReg <= _zz_pointerReg;
    end else begin
      if(when_nocDefines_l392) begin
        pointerReg <= maskHigerReq;
      end else begin
        if(when_nocDefines_l395) begin
          pointerReg <= unmaskHigerReq;
        end else begin
          pointerReg <= pointerReg;
        end
      end
    end
  end


endmodule
