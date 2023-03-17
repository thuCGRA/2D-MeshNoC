// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : meshEndpoint

`timescale 1ns/1ps

module meshEndpoint (
  input               linkIn_fwdlink_fwdPacket_v,
  input               linkIn_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   linkIn_fwdlink_fwdPacket_data,
  input               linkIn_revlink_revPacket_v,
  input               linkIn_revlink_revPacket_readyAndRev,
  input      [46:0]   linkIn_revlink_revPacket_data,
  output              linkOut_fwdlink_fwdPacket_v,
  output              linkOut_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   linkOut_fwdlink_fwdPacket_data,
  output              linkOut_revlink_revPacket_v,
  output              linkOut_revlink_revPacket_readyAndRev,
  output     [46:0]   linkOut_revlink_revPacket_data,
  output     [77:0]   fifoDataOut,
  output              fifoDataValidOut,
  input               fifoDataYumIn,
  output              fifoDataFull,
  input      [77:0]   outPacketIn,
  input               outPacketValidIn,
  output              outPacketReadyOut,
  output     [46:0]   returnedPacketOut,
  output              returnedCreditOut,
  input               returnedYumIn,
  output              returnedFifoFull,
  input      [46:0]   returningPacketIn,
  input               returningPacketValidIn,
  output              returningPacketReadyOut,
  input               clk,
  input               resetn
);

  wire                myFifoPacketIn_readyOut;
  wire       [77:0]   myFifoPacketIn_dataOut;
  wire                myFifoPacketIn_validOut;
  wire                streamFifo_2_readyOut;
  wire       [46:0]   streamFifo_2_dataOut;
  wire                streamFifo_2_validOut;
  wire                linkInCast_fwdlink_fwdPacket_v;
  wire                linkInCast_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkInCast_fwdlink_fwdPacket_data;
  wire                linkInCast_revlink_revPacket_v;
  wire                linkInCast_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkInCast_revlink_revPacket_data;
  wire                linkOutCast_fwdlink_fwdPacket_v;
  wire                linkOutCast_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkOutCast_fwdlink_fwdPacket_data;
  wire                linkOutCast_revlink_revPacket_v;
  wire                linkOutCast_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkOutCast_revlink_revPacket_data;
  wire       [46:0]   returnedPacket;
  wire                returnedCredit;
  wire                returnedFifoReady;

  streamFifo myFifoPacketIn (
    .dataIn   (linkInCast_fwdlink_fwdPacket_data[77:0]), //i
    .validIn  (linkInCast_fwdlink_fwdPacket_v         ), //i
    .readyOut (myFifoPacketIn_readyOut                ), //o
    .dataOut  (myFifoPacketIn_dataOut[77:0]           ), //o
    .validOut (myFifoPacketIn_validOut                ), //o
    .yumiIn   (fifoDataYumIn                          ), //i
    .clk      (clk                                    ), //i
    .resetn   (resetn                                 )  //i
  );
  streamFifo_1 streamFifo_2 (
    .dataIn   (linkInCast_revlink_revPacket_data[46:0]), //i
    .validIn  (linkInCast_revlink_revPacket_v         ), //i
    .readyOut (streamFifo_2_readyOut                  ), //o
    .dataOut  (streamFifo_2_dataOut[46:0]             ), //o
    .validOut (streamFifo_2_validOut                  ), //o
    .yumiIn   (returnedYumIn                          ), //i
    .clk      (clk                                    ), //i
    .resetn   (resetn                                 )  //i
  );
  assign linkInCast_fwdlink_fwdPacket_v = linkIn_fwdlink_fwdPacket_v;
  assign linkInCast_fwdlink_fwdPacket_readyAndRev = linkIn_fwdlink_fwdPacket_readyAndRev;
  assign linkInCast_fwdlink_fwdPacket_data = linkIn_fwdlink_fwdPacket_data;
  assign linkInCast_revlink_revPacket_v = linkIn_revlink_revPacket_v;
  assign linkInCast_revlink_revPacket_readyAndRev = linkIn_revlink_revPacket_readyAndRev;
  assign linkInCast_revlink_revPacket_data = linkIn_revlink_revPacket_data;
  assign linkOut_fwdlink_fwdPacket_v = linkOutCast_fwdlink_fwdPacket_v;
  assign linkOut_fwdlink_fwdPacket_readyAndRev = linkOutCast_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_fwdlink_fwdPacket_data = linkOutCast_fwdlink_fwdPacket_data;
  assign linkOut_revlink_revPacket_v = linkOutCast_revlink_revPacket_v;
  assign linkOut_revlink_revPacket_readyAndRev = linkOutCast_revlink_revPacket_readyAndRev;
  assign linkOut_revlink_revPacket_data = linkOutCast_revlink_revPacket_data;
  assign linkOutCast_fwdlink_fwdPacket_readyAndRev = myFifoPacketIn_readyOut;
  assign fifoDataOut = myFifoPacketIn_dataOut;
  assign fifoDataValidOut = myFifoPacketIn_validOut;
  assign linkOutCast_fwdlink_fwdPacket_data = outPacketIn;
  assign linkOutCast_fwdlink_fwdPacket_v = outPacketValidIn;
  assign outPacketReadyOut = linkInCast_fwdlink_fwdPacket_readyAndRev;
  assign fifoDataFull = (! linkOutCast_fwdlink_fwdPacket_readyAndRev);
  assign linkOutCast_revlink_revPacket_data = returningPacketIn;
  assign linkOutCast_revlink_revPacket_v = returningPacketValidIn;
  assign returningPacketReadyOut = linkInCast_revlink_revPacket_readyAndRev;
  assign returnedFifoReady = streamFifo_2_readyOut;
  assign returnedPacket = streamFifo_2_dataOut;
  assign returnedCredit = streamFifo_2_validOut;
  assign returnedFifoFull = (! returnedFifoReady);
  assign linkOutCast_revlink_revPacket_readyAndRev = returnedFifoReady;
  assign returnedCreditOut = returnedCredit;
  assign returnedPacketOut = returnedPacket;

endmodule

module streamFifo_1 (
  input      [46:0]   dataIn,
  input               validIn,
  output              readyOut,
  output     [46:0]   dataOut,
  output              validOut,
  input               yumiIn,
  input               clk,
  input               resetn
);

  wire                fifo2_myMem1r1w_rVi;
  wire       [46:0]   fifo2_myMem1r1w_rDatao;
  reg        [0:0]    fifo2_ptrRead;
  wire                fifo2_deq;
  reg        [0:0]    fifo2_ptrWrite;
  wire                fifo2_enq;
  reg                 fifo2_empty;
  reg                 fifo2_full;

  Mem1r1w_1 fifo2_myMem1r1w (
    .wVi    (fifo2_enq                   ), //i
    .wAddri (fifo2_ptrWrite              ), //i
    .wDatai (dataIn[46:0]                ), //i
    .rVi    (fifo2_myMem1r1w_rVi         ), //i
    .rAddri (fifo2_ptrRead               ), //i
    .rDatao (fifo2_myMem1r1w_rDatao[46:0]), //o
    .clk    (clk                         ), //i
    .resetn (resetn                      )  //i
  );
  assign fifo2_deq = yumiIn;
  assign fifo2_enq = ((! fifo2_full) && validIn);
  assign validOut = (! fifo2_empty);
  assign readyOut = (! fifo2_full);
  assign fifo2_myMem1r1w_rVi = (! fifo2_empty);
  assign dataOut = fifo2_myMem1r1w_rDatao;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      fifo2_ptrRead <= 1'b0;
      fifo2_ptrWrite <= 1'b0;
      fifo2_empty <= 1'b1;
      fifo2_full <= 1'b0;
    end else begin
      if(fifo2_enq) begin
        fifo2_ptrWrite <= (~ fifo2_ptrWrite);
      end
      if(fifo2_deq) begin
        fifo2_ptrRead <= fifo2_ptrRead;
      end
      fifo2_empty <= ((fifo2_empty && (! fifo2_enq)) || (((! fifo2_full) && fifo2_deq) && (! fifo2_enq)));
      fifo2_full <= ((((! fifo2_empty) && fifo2_enq) && (! fifo2_deq)) || (fifo2_full && (! fifo2_deq)));
    end
  end


endmodule

module streamFifo (
  input      [77:0]   dataIn,
  input               validIn,
  output              readyOut,
  output     [77:0]   dataOut,
  output              validOut,
  input               yumiIn,
  input               clk,
  input               resetn
);

  wire       [1:0]    fifolarger2_myFifoTracker_ptrReadOut;
  wire       [1:0]    fifolarger2_myFifoTracker_ptrWriteOut;
  wire                fifolarger2_myFifoTracker_fullOut;
  wire                fifolarger2_myFifoTracker_emptyOut;
  wire       [77:0]   fifolarger2_myMem1r1w_rDatao;
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
    .wDatai (dataIn[77:0]                      ), //i
    .rVi    (fifolarger2_validOutTemp          ), //i
    .rAddri (fifolarger2_ptrRead[1:0]          ), //i
    .rDatao (fifolarger2_myMem1r1w_rDatao[77:0]), //o
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

module Mem1r1w_1 (
  input               wVi,
  input      [0:0]    wAddri,
  input      [46:0]   wDatai,
  input               rVi,
  input      [0:0]    rAddri,
  output     [46:0]   rDatao,
  input               clk,
  input               resetn
);

  wire       [46:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [46:0] mem [0:1];

  assign _zz_mem_port0 = mem[rAddri];
  always @(posedge clk) begin
    if(wVi) begin
      mem[wAddri] <= wDatai;
    end
  end

  assign rDatao = _zz_mem_port0;

endmodule

module Mem1r1w (
  input               wVi,
  input      [1:0]    wAddri,
  input      [77:0]   wDatai,
  input               rVi,
  input      [1:0]    rAddri,
  output     [77:0]   rDatao,
  input               clk,
  input               resetn
);

  wire       [77:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [77:0] mem [0:3];

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
  wire                when_nocDefines_l437;
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
  assign when_nocDefines_l437 = (deqIn || enqIn);
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
      if(when_nocDefines_l437) begin
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
