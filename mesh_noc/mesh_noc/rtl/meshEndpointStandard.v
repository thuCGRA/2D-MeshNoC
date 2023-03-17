// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : meshEndpointStandard

`timescale 1ns/1ps

module meshEndpointStandard (
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
  output              validOut,
  input               yumiIn,
  output     [31:0]   dataOut,
  output     [3:0]    maskOut,
  output     [31:0]   addrOut,
  output              weOut,
  output     [1:0]    xCordinateOut,
  output     [1:0]    yCordinateOut,
  input      [31:0]   returningDataIn,
  input               returningValidIn,
  input      [1:0]    outOp,
  input      [3:0]    outOpEx,
  input      [31:0]   outAddr,
  input      [31:0]   outPayLoadDataIn,
  input      [1:0]    outSrcXCord,
  input      [1:0]    outSrcYCord,
  input      [1:0]    outMyXCord,
  input      [1:0]    outMyYCord,
  input               outPacketValidIn,
  output              outPacketReadyOut,
  output     [31:0]   returnedDataOut,
  output     [9:0]    returnedLoadIdOut,
  output              returnedValidOut,
  input               returnedYumIn,
  output              returnedFifoFullout,
  output     [4:0]    creditOut,
  input      [1:0]    myXCordinate,
  input      [1:0]    myYCordinate,
  input               clk,
  input               resetn
);

  wire       [14:0]   myreturnCreditFifo_dataIn;
  wire                myHold1Cycle_holdIn;
  wire       [0:0]    mycounterUpDown_upIn;
  wire       [0:0]    mycounterUpDown_downIn;
  wire                myEndpoint_linkOut_fwdlink_fwdPacket_v;
  wire                myEndpoint_linkOut_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   myEndpoint_linkOut_fwdlink_fwdPacket_data;
  wire                myEndpoint_linkOut_revlink_revPacket_v;
  wire                myEndpoint_linkOut_revlink_revPacket_readyAndRev;
  wire       [46:0]   myEndpoint_linkOut_revlink_revPacket_data;
  wire       [77:0]   myEndpoint_fifoDataOut;
  wire                myEndpoint_fifoDataValidOut;
  wire                myEndpoint_fifoDataFull;
  wire                myEndpoint_outPacketReadyOut;
  wire       [46:0]   myEndpoint_returnedPacketOut;
  wire                myEndpoint_returnedCreditOut;
  wire                myEndpoint_returnedFifoFull;
  wire                myEndpoint_returningPacketReadyOut;
  wire                myMuxeLock_yumiOut;
  wire                myMuxeLock_combvalidOut;
  wire       [31:0]   myMuxeLock_combdataOut;
  wire       [3:0]    myMuxeLock_combmaskOut;
  wire       [31:0]   myMuxeLock_combaddrOut;
  wire                myMuxeLock_combweOut;
  wire       [1:0]    myMuxeLock_combxCordinateOut;
  wire       [1:0]    myMuxeLock_combyCordinateOut;
  wire       [31:0]   myMuxeLock_combReturningDataOut;
  wire                myMuxeLock_combReturningValidOut;
  wire                myreturnCreditFifo_readyOut;
  wire       [14:0]   myreturnCreditFifo_dataOut;
  wire                myreturnCreditFifo_validOut;
  wire                myHold1Cycle_validOut;
  wire       [31:0]   myHold1Cycle_dataOut;
  wire       [4:0]    mycounterUpDown_countOut;
  wire       [1:0]    tempPacketData_op;
  wire       [3:0]    tempPacketData_opEx;
  wire       [31:0]   tempPacketData_addr;
  wire       [31:0]   tempPacketData_payload_data;
  wire       [31:0]   tempPacketData_payload_loadInfo;
  wire       [9:0]    tempPacketData_payload_loadId;
  wire       [21:0]   tempPacketData_payload_loadInfoPadding;
  wire       [1:0]    tempPacketData_srcXCord;
  wire       [1:0]    tempPacketData_srcYCord;
  wire       [1:0]    tempPacketData_myXCord;
  wire       [1:0]    tempPacketData_myYCord;
  wire                tempPacketDataValid;
  wire                tempPacketYumi;
  wire                tempPacketFifoFull;
  wire       [0:0]    tempReturnedPacket_pktTyple;
  wire       [31:0]   tempReturnedPacket_data;
  wire       [9:0]    tempReturnedPacket_loadId;
  wire       [1:0]    tempReturnedPacket_xCord;
  wire       [1:0]    tempReturnedPacket_yCord;
  wire                tempReturnedYumi;
  wire                tempReturnedCredit;
  wire       [46:0]   tempReturningPacket;
  wire                tempReturningPacketValid;
  wire                tempReturningPacketReady;
  wire       [77:0]   tempoutPacketIn;
  wire                returnedCredit;
  wire                tempvalidIn;
  wire                tempyumiOut;
  wire       [31:0]   tempdataIn;
  wire       [3:0]    tempmaskIn;
  wire       [31:0]   tempaddrIn;
  wire                tempweIn;
  wire                tempswapAqIn;
  wire                tempswapRlIn;
  wire                tempRemoteLoad;
  wire                tempRemoteStroe;
  wire       [1:0]    tempxCordinateIn;
  wire       [1:0]    tempyCordinateIn;
  wire       [31:0]   tempcombReturningDataOut;
  wire                tempcombReturneingValidOut;
  wire       [0:0]    rcFifoli_packetType;
  wire       [1:0]    rcFifoli_xCordinate;
  wire       [1:0]    rcFifoli_yCordinate;
  wire       [9:0]    rcFifoli_loadId;
  wire       [0:0]    rcFifolo_packetType;
  wire       [1:0]    rcFifolo_xCordinate;
  wire       [1:0]    rcFifolo_yCordinate;
  wire       [9:0]    rcFifolo_loadId;
  wire                rcFifoReadyOut;
  wire                rcFifoValidOut;
  wire                rcFifoYumiIn;
  wire                returningDataRequest;
  wire       [31:0]   holdReturningData;
  wire                holdReturningDataValid;
  wire       [0:0]    returningPacketCase_pktTyple;
  wire       [31:0]   returningPacketCase_data;
  wire       [9:0]    returningPacketCase_loadId;
  wire       [1:0]    returningPacketCase_xCord;
  wire       [1:0]    returningPacketCase_yCord;
  wire                launchOut;

  meshEndpoint myEndpoint (
    .linkIn_fwdlink_fwdPacket_v            (linkIn_fwdlink_fwdPacket_v                      ), //i
    .linkIn_fwdlink_fwdPacket_readyAndRev  (linkIn_fwdlink_fwdPacket_readyAndRev            ), //i
    .linkIn_fwdlink_fwdPacket_data         (linkIn_fwdlink_fwdPacket_data[77:0]             ), //i
    .linkIn_revlink_revPacket_v            (linkIn_revlink_revPacket_v                      ), //i
    .linkIn_revlink_revPacket_readyAndRev  (linkIn_revlink_revPacket_readyAndRev            ), //i
    .linkIn_revlink_revPacket_data         (linkIn_revlink_revPacket_data[46:0]             ), //i
    .linkOut_fwdlink_fwdPacket_v           (myEndpoint_linkOut_fwdlink_fwdPacket_v          ), //o
    .linkOut_fwdlink_fwdPacket_readyAndRev (myEndpoint_linkOut_fwdlink_fwdPacket_readyAndRev), //o
    .linkOut_fwdlink_fwdPacket_data        (myEndpoint_linkOut_fwdlink_fwdPacket_data[77:0] ), //o
    .linkOut_revlink_revPacket_v           (myEndpoint_linkOut_revlink_revPacket_v          ), //o
    .linkOut_revlink_revPacket_readyAndRev (myEndpoint_linkOut_revlink_revPacket_readyAndRev), //o
    .linkOut_revlink_revPacket_data        (myEndpoint_linkOut_revlink_revPacket_data[46:0] ), //o
    .fifoDataOut                           (myEndpoint_fifoDataOut[77:0]                    ), //o
    .fifoDataValidOut                      (myEndpoint_fifoDataValidOut                     ), //o
    .fifoDataYumIn                         (tempPacketYumi                                  ), //i
    .fifoDataFull                          (myEndpoint_fifoDataFull                         ), //o
    .outPacketIn                           (tempoutPacketIn[77:0]                           ), //i
    .outPacketValidIn                      (outPacketValidIn                                ), //i
    .outPacketReadyOut                     (myEndpoint_outPacketReadyOut                    ), //o
    .returnedPacketOut                     (myEndpoint_returnedPacketOut[46:0]              ), //o
    .returnedCreditOut                     (myEndpoint_returnedCreditOut                    ), //o
    .returnedYumIn                         (tempReturnedYumi                                ), //i
    .returnedFifoFull                      (myEndpoint_returnedFifoFull                     ), //o
    .returningPacketIn                     (tempReturningPacket[46:0]                       ), //i
    .returningPacketValidIn                (tempReturningPacketValid                        ), //i
    .returningPacketReadyOut               (myEndpoint_returningPacketReadyOut              ), //o
    .clk                                   (clk                                             ), //i
    .resetn                                (resetn                                          )  //i
  );
  muxeLock myMuxeLock (
    .validIn               (tempvalidIn                          ), //i
    .yumiOut               (myMuxeLock_yumiOut                   ), //o
    .dataIn                (tempdataIn[31:0]                     ), //i
    .maskIn                (tempmaskIn[3:0]                      ), //i
    .addrIn                (tempaddrIn[31:0]                     ), //i
    .weIn                  (tempweIn                             ), //i
    .swapAqIn              (tempswapAqIn                         ), //i
    .swapRlIn              (tempswapRlIn                         ), //i
    .xCordinateIn          (tempxCordinateIn[1:0]                ), //i
    .yCordinateIn          (tempyCordinateIn[1:0]                ), //i
    .combvalidOut          (myMuxeLock_combvalidOut              ), //o
    .combyumiIn            (yumiIn                               ), //i
    .combdataOut           (myMuxeLock_combdataOut[31:0]         ), //o
    .combmaskOut           (myMuxeLock_combmaskOut[3:0]          ), //o
    .combaddrOut           (myMuxeLock_combaddrOut[31:0]         ), //o
    .combweOut             (myMuxeLock_combweOut                 ), //o
    .combxCordinateOut     (myMuxeLock_combxCordinateOut[1:0]    ), //o
    .combyCordinateOut     (myMuxeLock_combyCordinateOut[1:0]    ), //o
    .returningDataIn       (returningDataIn[31:0]                ), //i
    .returningValidIn      (returningValidIn                     ), //i
    .combReturningDataOut  (myMuxeLock_combReturningDataOut[31:0]), //o
    .combReturningValidOut (myMuxeLock_combReturningValidOut     ), //o
    .clk                   (clk                                  ), //i
    .resetn                (resetn                               )  //i
  );
  streamFifo_2 myreturnCreditFifo (
    .dataIn   (myreturnCreditFifo_dataIn[14:0] ), //i
    .validIn  (tempPacketYumi                  ), //i
    .readyOut (myreturnCreditFifo_readyOut     ), //o
    .dataOut  (myreturnCreditFifo_dataOut[14:0]), //o
    .validOut (myreturnCreditFifo_validOut     ), //o
    .yumiIn   (rcFifoYumiIn                    ), //i
    .clk      (clk                             ), //i
    .resetn   (resetn                          )  //i
  );
  holdDataCycle myHold1Cycle (
    .validIn  (tempcombReturneingValidOut    ), //i
    .dataIn   (tempcombReturningDataOut[31:0]), //i
    .holdIn   (myHold1Cycle_holdIn           ), //i
    .validOut (myHold1Cycle_validOut         ), //o
    .dataOut  (myHold1Cycle_dataOut[31:0]    ), //o
    .clk      (clk                           ), //i
    .resetn   (resetn                        )  //i
  );
  counterUpDown mycounterUpDown (
    .upIn     (mycounterUpDown_upIn         ), //i
    .downIn   (mycounterUpDown_downIn       ), //i
    .countOut (mycounterUpDown_countOut[4:0]), //o
    .clk      (clk                          ), //i
    .resetn   (resetn                       )  //i
  );
  assign tempPacketData_payload_loadInfo = tempPacketData_payload_data;
  assign tempPacketData_payload_loadId = tempPacketData_payload_loadInfo[9 : 0];
  assign tempPacketData_payload_loadInfoPadding = tempPacketData_payload_loadInfo[31 : 10];
  assign tempoutPacketIn = {{{{{{{outMyYCord,outMyXCord},outSrcYCord},outSrcXCord},outPayLoadDataIn},outAddr},outOpEx},outOp};
  assign returnedCredit = (tempReturnedCredit && tempReturnedYumi);
  assign linkOut_fwdlink_fwdPacket_v = myEndpoint_linkOut_fwdlink_fwdPacket_v;
  assign linkOut_fwdlink_fwdPacket_readyAndRev = myEndpoint_linkOut_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_fwdlink_fwdPacket_data = myEndpoint_linkOut_fwdlink_fwdPacket_data;
  assign linkOut_revlink_revPacket_v = myEndpoint_linkOut_revlink_revPacket_v;
  assign linkOut_revlink_revPacket_readyAndRev = myEndpoint_linkOut_revlink_revPacket_readyAndRev;
  assign linkOut_revlink_revPacket_data = myEndpoint_linkOut_revlink_revPacket_data;
  assign tempPacketData_op = myEndpoint_fifoDataOut[1 : 0];
  assign tempPacketData_opEx = myEndpoint_fifoDataOut[5 : 2];
  assign tempPacketData_addr = myEndpoint_fifoDataOut[37 : 6];
  assign tempPacketData_payload_data = myEndpoint_fifoDataOut[69 : 38];
  assign tempPacketData_srcXCord = myEndpoint_fifoDataOut[71 : 70];
  assign tempPacketData_srcYCord = myEndpoint_fifoDataOut[73 : 72];
  assign tempPacketData_myXCord = myEndpoint_fifoDataOut[75 : 74];
  assign tempPacketData_myYCord = myEndpoint_fifoDataOut[77 : 76];
  assign tempPacketDataValid = myEndpoint_fifoDataValidOut;
  assign tempPacketFifoFull = myEndpoint_fifoDataFull;
  assign outPacketReadyOut = myEndpoint_outPacketReadyOut;
  assign tempReturnedPacket_pktTyple = myEndpoint_returnedPacketOut[0 : 0];
  assign tempReturnedPacket_data = myEndpoint_returnedPacketOut[32 : 1];
  assign tempReturnedPacket_xCord = myEndpoint_returnedPacketOut[34 : 33];
  assign tempReturnedPacket_yCord = myEndpoint_returnedPacketOut[36 : 35];
  assign tempReturnedPacket_loadId = myEndpoint_returnedPacketOut[46 : 37];
  assign tempReturnedCredit = myEndpoint_returnedCreditOut;
  assign returnedFifoFullout = myEndpoint_returnedFifoFull;
  assign tempReturningPacketReady = myEndpoint_returningPacketReadyOut;
  assign tempdataIn = tempPacketData_payload_data;
  assign tempaddrIn = tempPacketData_addr;
  assign tempmaskIn = tempPacketData_opEx;
  assign tempswapAqIn = (tempPacketDataValid && (tempPacketData_op == 2'b10));
  assign tempswapRlIn = (tempPacketDataValid && (tempPacketData_op == 2'b11));
  assign tempRemoteStroe = (tempPacketDataValid && (tempPacketData_op == 2'b01));
  assign tempRemoteLoad = (tempPacketDataValid && (tempPacketData_op == 2'b00));
  assign tempweIn = tempRemoteStroe;
  assign tempxCordinateIn = tempPacketData_srcXCord;
  assign tempyCordinateIn = tempPacketData_srcYCord;
  assign tempyumiOut = myMuxeLock_yumiOut;
  assign validOut = myMuxeLock_combvalidOut;
  assign dataOut = myMuxeLock_combdataOut;
  assign maskOut = myMuxeLock_combmaskOut;
  assign addrOut = myMuxeLock_combaddrOut;
  assign weOut = myMuxeLock_combweOut;
  assign xCordinateOut = myMuxeLock_combxCordinateOut;
  assign yCordinateOut = myMuxeLock_combyCordinateOut;
  assign tempcombReturningDataOut = myMuxeLock_combReturningDataOut;
  assign tempcombReturneingValidOut = myMuxeLock_combReturningValidOut;
  assign tempPacketYumi = (tempyumiOut && (rcFifoReadyOut && tempReturningPacketReady));
  assign tempvalidIn = (tempPacketDataValid && (rcFifoReadyOut && tempReturningPacketReady));
  assign returningDataRequest = (tempRemoteStroe || tempRemoteLoad);
  assign rcFifoli_packetType = (returningDataRequest ? 1'b1 : 1'b0);
  assign rcFifoli_xCordinate = tempPacketData_srcXCord;
  assign rcFifoli_yCordinate = tempPacketData_srcYCord;
  assign rcFifoli_loadId = tempPacketData_payload_loadId;
  assign myreturnCreditFifo_dataIn = {{{rcFifoli_loadId,rcFifoli_yCordinate},rcFifoli_xCordinate},rcFifoli_packetType};
  assign rcFifoReadyOut = myreturnCreditFifo_readyOut;
  assign rcFifoValidOut = tempPacketYumi;
  assign rcFifolo_packetType = myreturnCreditFifo_dataOut[0 : 0];
  assign rcFifolo_xCordinate = myreturnCreditFifo_dataOut[2 : 1];
  assign rcFifolo_yCordinate = myreturnCreditFifo_dataOut[4 : 3];
  assign rcFifolo_loadId = myreturnCreditFifo_dataOut[14 : 5];
  assign myHold1Cycle_holdIn = (holdReturningDataValid && (! tempReturningPacketReady));
  assign holdReturningDataValid = myHold1Cycle_validOut;
  assign holdReturningData = myHold1Cycle_dataOut;
  assign rcFifoYumiIn = ((rcFifoValidOut && tempReturningPacketReady) && holdReturningDataValid);
  assign tempReturningPacketValid = (rcFifoValidOut && holdReturningDataValid);
  assign returningPacketCase_pktTyple = rcFifolo_packetType;
  assign returningPacketCase_data = holdReturningData;
  assign returningPacketCase_xCord = rcFifolo_xCordinate;
  assign returningPacketCase_yCord = rcFifolo_yCordinate;
  assign returningPacketCase_loadId = rcFifolo_loadId;
  assign tempReturningPacket = {{{{returningPacketCase_loadId,returningPacketCase_yCord},returningPacketCase_xCord},returningPacketCase_data},returningPacketCase_pktTyple};
  assign launchOut = (outPacketValidIn && outPacketReadyOut);
  assign mycounterUpDown_downIn = launchOut;
  assign mycounterUpDown_upIn = returnedCredit;
  assign creditOut = mycounterUpDown_countOut;
  assign returnedDataOut = tempReturnedPacket_data;
  assign returnedLoadIdOut = tempReturnedPacket_loadId;
  assign returnedValidOut = (tempReturnedCredit && (tempReturnedPacket_pktTyple == 1'b1));
  assign tempReturnedYumi = (returnedYumIn || (tempReturnedCredit && (! (tempReturnedPacket_pktTyple == 1'b1))));

endmodule

//counterUpDown replaced by counterUpDown

module holdDataCycle (
  input               validIn,
  input      [31:0]   dataIn,
  input               holdIn,
  output              validOut,
  output     [31:0]   dataOut,
  input               clk,
  input               resetn
);

  reg                 holdReg_0;
  reg                 validReg_0;
  reg        [31:0]   dataReg_0;
  wire                validTemp_0;
  wire       [31:0]   dataTemp_0;
  reg        [0:0]    counterHoldCycle;

  assign dataTemp_0 = (holdReg_0 ? dataReg_0 : dataIn);
  assign validTemp_0 = (holdReg_0 ? validReg_0 : validIn);
  assign dataOut = dataTemp_0;
  assign validOut = validTemp_0;
  always @(posedge clk) begin
    holdReg_0 <= holdIn;
    dataReg_0 <= dataIn;
    validReg_0 <= validIn;
  end


endmodule

module streamFifo_2 (
  input      [14:0]   dataIn,
  input               validIn,
  output              readyOut,
  output     [14:0]   dataOut,
  output              validOut,
  input               yumiIn,
  input               clk,
  input               resetn
);

  wire                fifo2_myMem1r1w_rVi;
  wire       [14:0]   fifo2_myMem1r1w_rDatao;
  reg        [0:0]    fifo2_ptrRead;
  wire                fifo2_deq;
  reg        [0:0]    fifo2_ptrWrite;
  wire                fifo2_enq;
  reg                 fifo2_empty;
  reg                 fifo2_full;

  Mem1r1w_2 fifo2_myMem1r1w (
    .wVi    (fifo2_enq                   ), //i
    .wAddri (fifo2_ptrWrite              ), //i
    .wDatai (dataIn[14:0]                ), //i
    .rVi    (fifo2_myMem1r1w_rVi         ), //i
    .rAddri (fifo2_ptrRead               ), //i
    .rDatao (fifo2_myMem1r1w_rDatao[14:0]), //o
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
  wire       [4:0]    myCounterUpDown_countOut;
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
  wire       [4:0]    requestNumInNode;

  assign _zz_combReturningDataOut_1 = swapAqResult;
  assign _zz_combReturningDataOut = {31'd0, _zz_combReturningDataOut_1};
  counterUpDown myCounterUpDown (
    .upIn     (myCounterUpDown_upIn         ), //i
    .downIn   (myCounterUpDown_downIn       ), //i
    .countOut (myCounterUpDown_countOut[4:0]), //o
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
  assign nodeIsIdle = (requestNumInNode == 5'h10);
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
  wire                streamFifo_3_readyOut;
  wire       [46:0]   streamFifo_3_dataOut;
  wire                streamFifo_3_validOut;
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
  streamFifo_1 streamFifo_3 (
    .dataIn   (linkInCast_revlink_revPacket_data[46:0]), //i
    .validIn  (linkInCast_revlink_revPacket_v         ), //i
    .readyOut (streamFifo_3_readyOut                  ), //o
    .dataOut  (streamFifo_3_dataOut[46:0]             ), //o
    .validOut (streamFifo_3_validOut                  ), //o
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
  assign returnedFifoReady = streamFifo_3_readyOut;
  assign returnedPacket = streamFifo_3_dataOut;
  assign returnedCredit = streamFifo_3_validOut;
  assign returnedFifoFull = (! returnedFifoReady);
  assign linkOutCast_revlink_revPacket_readyAndRev = returnedFifoReady;
  assign returnedCreditOut = returnedCredit;
  assign returnedPacketOut = returnedPacket;

endmodule

module Mem1r1w_2 (
  input               wVi,
  input      [0:0]    wAddri,
  input      [14:0]   wDatai,
  input               rVi,
  input      [0:0]    rAddri,
  output     [14:0]   rDatao,
  input               clk,
  input               resetn
);

  wire       [14:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [14:0] mem [0:1];

  assign _zz_mem_port0 = mem[rAddri];
  always @(posedge clk) begin
    if(wVi) begin
      mem[wAddri] <= wDatai;
    end
  end

  assign rDatao = _zz_mem_port0;

endmodule

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
      countTemp <= 5'h10;
    end else begin
      countTemp <= (_zz_countTemp + _zz_countTemp_2);
    end
  end


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
  wire                when_nocDefines_l439;
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
  assign when_nocDefines_l439 = (deqIn || enqIn);
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
      if(when_nocDefines_l439) begin
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
