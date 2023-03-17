// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : streamFifo

`timescale 1ns/1ps

module streamFifo (
  input      [31:0]   dataIn,
  input               validIn,
  output              readyOut,
  output     [31:0]   dataOut,
  output              validOut,
  input               yumiIn,
  input               clk,
  input               resetn
);

  wire       [1:0]    fifolarger2_myFifoTracker_ptrReadOut;
  wire       [1:0]    fifolarger2_myFifoTracker_ptrWriteOut;
  wire                fifolarger2_myFifoTracker_fullOut;
  wire                fifolarger2_myFifoTracker_emptyOut;
  wire       [31:0]   fifolarger2_myMem1r1w_rDatao;
  wire                fifolarger2_deq;
  wire                fifolarger2_validOutTemp;
  wire                fifolarger2_enq;
  wire                fifolarger2_readyOutTemp;
  wire       [1:0]    fifolarger2_ptrRead;
  wire       [1:0]    fifolarger2_ptrWrite;
  wire                fifolarger2_empty;
  wire                fifolarger2_full;

  fifoTracker fifolarger2_myFifoTracker (
    .enqIn       (fifolarger2_enq                           ), //i
    .deqIn       (fifolarger2_deq                           ), //i
    .ptrReadOut  (fifolarger2_myFifoTracker_ptrReadOut[1:0] ), //o
    .ptrWriteOut (fifolarger2_myFifoTracker_ptrWriteOut[1:0]), //o
    .fullOut     (fifolarger2_myFifoTracker_fullOut         ), //o
    .emptyOut    (fifolarger2_myFifoTracker_emptyOut        ), //o
    .clk         (clk                                       ), //i
    .resetn      (resetn                                    )  //i
  );
  Mem1r1w fifolarger2_myMem1r1w (
    .wVi    (fifolarger2_enq                   ), //i
    .wAddri (fifolarger2_ptrWrite[1:0]         ), //i
    .wDatai (dataIn[31:0]                      ), //i
    .rVi    (fifolarger2_validOutTemp          ), //i
    .rAddri (fifolarger2_ptrRead[1:0]          ), //i
    .rDatao (fifolarger2_myMem1r1w_rDatao[31:0]), //o
    .clk    (clk                               ), //i
    .resetn (resetn                            )  //i
  );
  assign fifolarger2_deq = yumiIn;
  assign fifolarger2_enq = (validIn && fifolarger2_readyOutTemp);
  assign fifolarger2_readyOutTemp = (! fifolarger2_full);
  assign readyOut = fifolarger2_readyOutTemp;
  assign fifolarger2_validOutTemp = (! fifolarger2_empty);
  assign validOut = fifolarger2_validOutTemp;
  assign fifolarger2_full = fifolarger2_myFifoTracker_fullOut;
  assign fifolarger2_empty = fifolarger2_myFifoTracker_emptyOut;
  assign fifolarger2_ptrRead = fifolarger2_myFifoTracker_ptrReadOut;
  assign fifolarger2_ptrWrite = fifolarger2_myFifoTracker_ptrWriteOut;
  assign dataOut = fifolarger2_myMem1r1w_rDatao;

endmodule

module Mem1r1w (
  input               wVi,
  input      [1:0]    wAddri,
  input      [31:0]   wDatai,
  input               rVi,
  input      [1:0]    rAddri,
  output     [31:0]   rDatao,
  input               clk,
  input               resetn
);

  wire       [31:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [31:0] mem [0:3];

  assign _zz_mem_port0 = mem[rAddri];
  always @(posedge clk) begin
    if(wVi) begin
      mem[wAddri] <= wDatai;
    end
  end

  assign rDatao = _zz_mem_port0;

endmodule

module fifoTracker (
  input               enqIn,
  input               deqIn,
  output     [1:0]    ptrReadOut,
  output     [1:0]    ptrWriteOut,
  output              fullOut,
  output              emptyOut,
  input               clk,
  input               resetn
);

  wire       [0:0]    myReadPtr_addIn;
  wire       [0:0]    myWritePtr_addIn;
  wire       [1:0]    myReadPtr_ptr;
  wire       [1:0]    myWritePtr_ptr;
  wire       [1:0]    ptrRead;
  wire       [1:0]    ptrWrite;
  reg                 enq;
  reg                 deq;
  wire                when_nocDefines_l243;
  wire                equalPtr;

  circlarPtr myReadPtr (
    .addIn  (myReadPtr_addIn   ), //i
    .ptr    (myReadPtr_ptr[1:0]), //o
    .clk    (clk               ), //i
    .resetn (resetn            )  //i
  );
  circlarPtr myWritePtr (
    .addIn  (myWritePtr_addIn   ), //i
    .ptr    (myWritePtr_ptr[1:0]), //o
    .clk    (clk                ), //i
    .resetn (resetn             )  //i
  );
  assign myReadPtr_addIn = deqIn;
  assign ptrRead = myReadPtr_ptr;
  assign myWritePtr_addIn = enqIn;
  assign ptrWrite = myWritePtr_ptr;
  assign when_nocDefines_l243 = (deqIn || enqIn);
  assign equalPtr = (ptrWrite == ptrRead);
  assign emptyOut = (equalPtr && deq);
  assign fullOut = (equalPtr && enq);
  assign ptrReadOut = ptrRead;
  assign ptrWriteOut = ptrWrite;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      enq <= 1'b0;
      deq <= 1'b1;
    end else begin
      if(when_nocDefines_l243) begin
        enq <= enqIn;
        deq <= deqIn;
      end
    end
  end


endmodule

//circlarPtr replaced by circlarPtr

module circlarPtr (
  input      [0:0]    addIn,
  output     [1:0]    ptr,
  input               clk,
  input               resetn
);

  wire       [1:0]    _zz_ptrNext;
  reg        [1:0]    ptrRight;
  wire       [1:0]    ptrNext;
  wire       [2:0]    ptrWrap;

  assign _zz_ptrNext = (ptrRight + 2'b01);
  assign ptr = ptrRight;
  assign ptrNext = (addIn[0] ? _zz_ptrNext : ptrRight);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      ptrRight <= 2'b00;
    end else begin
      ptrRight <= ptrNext;
    end
  end


endmodule
