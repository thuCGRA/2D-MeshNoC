// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : meshLinkTieoff

`timescale 1ns/1ps

module meshLinkTieoff (
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
  output     [46:0]   linkOut_revlink_revPacket_data
);

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
  wire       [0:0]    tempReturnPktType;
  wire       [31:0]   tempReturnData;
  wire       [1:0]    tempReturnSrcXCord;
  wire       [1:0]    tempReturnSrcYCord;
  wire       [9:0]    tempReturnLoadId;

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
  assign tempReturnPktType = 1'b0;
  assign tempReturnData = 32'h0;
  assign tempReturnSrcXCord = linkInCast_fwdlink_fwdPacket_data[71 : 70];
  assign tempReturnSrcYCord = linkInCast_fwdlink_fwdPacket_data[73 : 72];
  assign tempReturnLoadId = 10'h0;
  assign linkOutCast_fwdlink_fwdPacket_v = 1'b0;
  assign linkOutCast_fwdlink_fwdPacket_data = 78'h0;
  assign linkOutCast_fwdlink_fwdPacket_readyAndRev = linkInCast_revlink_revPacket_readyAndRev;
  assign linkOutCast_revlink_revPacket_v = linkInCast_fwdlink_fwdPacket_v;
  assign linkOutCast_revlink_revPacket_data = {{{{tempReturnLoadId,tempReturnSrcYCord},tempReturnSrcXCord},tempReturnData},tempReturnPktType};
  assign linkOutCast_revlink_revPacket_readyAndRev = 1'b1;

endmodule
