// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : meshNode

`timescale 1ns/1ps

module meshNode (
  input               linkIn_0_fwdlink_fwdPacket_v,
  input               linkIn_0_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   linkIn_0_fwdlink_fwdPacket_data,
  input               linkIn_0_revlink_revPacket_v,
  input               linkIn_0_revlink_revPacket_readyAndRev,
  input      [46:0]   linkIn_0_revlink_revPacket_data,
  input               linkIn_1_fwdlink_fwdPacket_v,
  input               linkIn_1_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   linkIn_1_fwdlink_fwdPacket_data,
  input               linkIn_1_revlink_revPacket_v,
  input               linkIn_1_revlink_revPacket_readyAndRev,
  input      [46:0]   linkIn_1_revlink_revPacket_data,
  input               linkIn_2_fwdlink_fwdPacket_v,
  input               linkIn_2_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   linkIn_2_fwdlink_fwdPacket_data,
  input               linkIn_2_revlink_revPacket_v,
  input               linkIn_2_revlink_revPacket_readyAndRev,
  input      [46:0]   linkIn_2_revlink_revPacket_data,
  input               linkIn_3_fwdlink_fwdPacket_v,
  input               linkIn_3_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   linkIn_3_fwdlink_fwdPacket_data,
  input               linkIn_3_revlink_revPacket_v,
  input               linkIn_3_revlink_revPacket_readyAndRev,
  input      [46:0]   linkIn_3_revlink_revPacket_data,
  output              linkOut_0_fwdlink_fwdPacket_v,
  output              linkOut_0_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   linkOut_0_fwdlink_fwdPacket_data,
  output              linkOut_0_revlink_revPacket_v,
  output              linkOut_0_revlink_revPacket_readyAndRev,
  output     [46:0]   linkOut_0_revlink_revPacket_data,
  output              linkOut_1_fwdlink_fwdPacket_v,
  output              linkOut_1_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   linkOut_1_fwdlink_fwdPacket_data,
  output              linkOut_1_revlink_revPacket_v,
  output              linkOut_1_revlink_revPacket_readyAndRev,
  output     [46:0]   linkOut_1_revlink_revPacket_data,
  output              linkOut_2_fwdlink_fwdPacket_v,
  output              linkOut_2_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   linkOut_2_fwdlink_fwdPacket_data,
  output              linkOut_2_revlink_revPacket_v,
  output              linkOut_2_revlink_revPacket_readyAndRev,
  output     [46:0]   linkOut_2_revlink_revPacket_data,
  output              linkOut_3_fwdlink_fwdPacket_v,
  output              linkOut_3_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   linkOut_3_fwdlink_fwdPacket_data,
  output              linkOut_3_revlink_revPacket_v,
  output              linkOut_3_revlink_revPacket_readyAndRev,
  output     [46:0]   linkOut_3_revlink_revPacket_data,
  input               procLinkIn_fwdlink_fwdPacket_v,
  input               procLinkIn_fwdlink_fwdPacket_readyAndRev,
  input      [77:0]   procLinkIn_fwdlink_fwdPacket_data,
  input               procLinkIn_revlink_revPacket_v,
  input               procLinkIn_revlink_revPacket_readyAndRev,
  input      [46:0]   procLinkIn_revlink_revPacket_data,
  output              procLinkOut_fwdlink_fwdPacket_v,
  output              procLinkOut_fwdlink_fwdPacket_readyAndRev,
  output     [77:0]   procLinkOut_fwdlink_fwdPacket_data,
  output              procLinkOut_revlink_revPacket_v,
  output              procLinkOut_revlink_revPacket_readyAndRev,
  output     [46:0]   procLinkOut_revlink_revPacket_data,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  input               clk,
  input               resetn
);

  wire                bufferMeshRouter_2_linkOut_0_v;
  wire                bufferMeshRouter_2_linkOut_0_readyAndRev;
  wire       [77:0]   bufferMeshRouter_2_linkOut_0_data;
  wire                bufferMeshRouter_2_linkOut_1_v;
  wire                bufferMeshRouter_2_linkOut_1_readyAndRev;
  wire       [77:0]   bufferMeshRouter_2_linkOut_1_data;
  wire                bufferMeshRouter_2_linkOut_2_v;
  wire                bufferMeshRouter_2_linkOut_2_readyAndRev;
  wire       [77:0]   bufferMeshRouter_2_linkOut_2_data;
  wire                bufferMeshRouter_2_linkOut_3_v;
  wire                bufferMeshRouter_2_linkOut_3_readyAndRev;
  wire       [77:0]   bufferMeshRouter_2_linkOut_3_data;
  wire                bufferMeshRouter_2_linkOut_4_v;
  wire                bufferMeshRouter_2_linkOut_4_readyAndRev;
  wire       [77:0]   bufferMeshRouter_2_linkOut_4_data;
  wire                bufferMeshRouter_3_linkOut_0_v;
  wire                bufferMeshRouter_3_linkOut_0_readyAndRev;
  wire       [46:0]   bufferMeshRouter_3_linkOut_0_data;
  wire                bufferMeshRouter_3_linkOut_1_v;
  wire                bufferMeshRouter_3_linkOut_1_readyAndRev;
  wire       [46:0]   bufferMeshRouter_3_linkOut_1_data;
  wire                bufferMeshRouter_3_linkOut_2_v;
  wire                bufferMeshRouter_3_linkOut_2_readyAndRev;
  wire       [46:0]   bufferMeshRouter_3_linkOut_2_data;
  wire                bufferMeshRouter_3_linkOut_3_v;
  wire                bufferMeshRouter_3_linkOut_3_readyAndRev;
  wire       [46:0]   bufferMeshRouter_3_linkOut_3_data;
  wire                bufferMeshRouter_3_linkOut_4_v;
  wire                bufferMeshRouter_3_linkOut_4_readyAndRev;
  wire       [46:0]   bufferMeshRouter_3_linkOut_4_data;
  wire                linkInCast_0_fwdlink_fwdPacket_v;
  wire                linkInCast_0_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkInCast_0_fwdlink_fwdPacket_data;
  wire                linkInCast_0_revlink_revPacket_v;
  wire                linkInCast_0_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkInCast_0_revlink_revPacket_data;
  wire                linkInCast_1_fwdlink_fwdPacket_v;
  wire                linkInCast_1_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkInCast_1_fwdlink_fwdPacket_data;
  wire                linkInCast_1_revlink_revPacket_v;
  wire                linkInCast_1_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkInCast_1_revlink_revPacket_data;
  wire                linkInCast_2_fwdlink_fwdPacket_v;
  wire                linkInCast_2_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkInCast_2_fwdlink_fwdPacket_data;
  wire                linkInCast_2_revlink_revPacket_v;
  wire                linkInCast_2_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkInCast_2_revlink_revPacket_data;
  wire                linkInCast_3_fwdlink_fwdPacket_v;
  wire                linkInCast_3_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkInCast_3_fwdlink_fwdPacket_data;
  wire                linkInCast_3_revlink_revPacket_v;
  wire                linkInCast_3_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkInCast_3_revlink_revPacket_data;
  wire                linkOutCast_0_fwdlink_fwdPacket_v;
  wire                linkOutCast_0_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkOutCast_0_fwdlink_fwdPacket_data;
  wire                linkOutCast_0_revlink_revPacket_v;
  wire                linkOutCast_0_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkOutCast_0_revlink_revPacket_data;
  wire                linkOutCast_1_fwdlink_fwdPacket_v;
  wire                linkOutCast_1_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkOutCast_1_fwdlink_fwdPacket_data;
  wire                linkOutCast_1_revlink_revPacket_v;
  wire                linkOutCast_1_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkOutCast_1_revlink_revPacket_data;
  wire                linkOutCast_2_fwdlink_fwdPacket_v;
  wire                linkOutCast_2_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkOutCast_2_fwdlink_fwdPacket_data;
  wire                linkOutCast_2_revlink_revPacket_v;
  wire                linkOutCast_2_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkOutCast_2_revlink_revPacket_data;
  wire                linkOutCast_3_fwdlink_fwdPacket_v;
  wire                linkOutCast_3_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   linkOutCast_3_fwdlink_fwdPacket_data;
  wire                linkOutCast_3_revlink_revPacket_v;
  wire                linkOutCast_3_revlink_revPacket_readyAndRev;
  wire       [46:0]   linkOutCast_3_revlink_revPacket_data;
  wire                linkFwdIn_0_fwdPacket_v;
  wire                linkFwdIn_0_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdIn_0_fwdPacket_data;
  wire                linkFwdIn_1_fwdPacket_v;
  wire                linkFwdIn_1_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdIn_1_fwdPacket_data;
  wire                linkFwdIn_2_fwdPacket_v;
  wire                linkFwdIn_2_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdIn_2_fwdPacket_data;
  wire                linkFwdIn_3_fwdPacket_v;
  wire                linkFwdIn_3_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdIn_3_fwdPacket_data;
  wire                linkFwdIn_4_fwdPacket_v;
  wire                linkFwdIn_4_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdIn_4_fwdPacket_data;
  wire                linkFwdOut_0_fwdPacket_v;
  wire                linkFwdOut_0_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdOut_0_fwdPacket_data;
  wire                linkFwdOut_1_fwdPacket_v;
  wire                linkFwdOut_1_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdOut_1_fwdPacket_data;
  wire                linkFwdOut_2_fwdPacket_v;
  wire                linkFwdOut_2_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdOut_2_fwdPacket_data;
  wire                linkFwdOut_3_fwdPacket_v;
  wire                linkFwdOut_3_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdOut_3_fwdPacket_data;
  wire                linkFwdOut_4_fwdPacket_v;
  wire                linkFwdOut_4_fwdPacket_readyAndRev;
  wire       [77:0]   linkFwdOut_4_fwdPacket_data;
  wire                linkRevIn_0_revPacket_v;
  wire                linkRevIn_0_revPacket_readyAndRev;
  wire       [46:0]   linkRevIn_0_revPacket_data;
  wire                linkRevIn_1_revPacket_v;
  wire                linkRevIn_1_revPacket_readyAndRev;
  wire       [46:0]   linkRevIn_1_revPacket_data;
  wire                linkRevIn_2_revPacket_v;
  wire                linkRevIn_2_revPacket_readyAndRev;
  wire       [46:0]   linkRevIn_2_revPacket_data;
  wire                linkRevIn_3_revPacket_v;
  wire                linkRevIn_3_revPacket_readyAndRev;
  wire       [46:0]   linkRevIn_3_revPacket_data;
  wire                linkRevIn_4_revPacket_v;
  wire                linkRevIn_4_revPacket_readyAndRev;
  wire       [46:0]   linkRevIn_4_revPacket_data;
  wire                linkRevOut_0_revPacket_v;
  wire                linkRevOut_0_revPacket_readyAndRev;
  wire       [46:0]   linkRevOut_0_revPacket_data;
  wire                linkRevOut_1_revPacket_v;
  wire                linkRevOut_1_revPacket_readyAndRev;
  wire       [46:0]   linkRevOut_1_revPacket_data;
  wire                linkRevOut_2_revPacket_v;
  wire                linkRevOut_2_revPacket_readyAndRev;
  wire       [46:0]   linkRevOut_2_revPacket_data;
  wire                linkRevOut_3_revPacket_v;
  wire                linkRevOut_3_revPacket_readyAndRev;
  wire       [46:0]   linkRevOut_3_revPacket_data;
  wire                linkRevOut_4_revPacket_v;
  wire                linkRevOut_4_revPacket_readyAndRev;
  wire       [46:0]   linkRevOut_4_revPacket_data;
  wire                procLinkLocalIn_fwdlink_fwdPacket_v;
  wire                procLinkLocalIn_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   procLinkLocalIn_fwdlink_fwdPacket_data;
  wire                procLinkLocalIn_revlink_revPacket_v;
  wire                procLinkLocalIn_revlink_revPacket_readyAndRev;
  wire       [46:0]   procLinkLocalIn_revlink_revPacket_data;
  wire                procLinkLocalOut_fwdlink_fwdPacket_v;
  wire                procLinkLocalOut_fwdlink_fwdPacket_readyAndRev;
  wire       [77:0]   procLinkLocalOut_fwdlink_fwdPacket_data;
  wire                procLinkLocalOut_revlink_revPacket_v;
  wire                procLinkLocalOut_revlink_revPacket_readyAndRev;
  wire       [46:0]   procLinkLocalOut_revlink_revPacket_data;

  bufferMeshRouter bufferMeshRouter_2 (
    .linkIn_0_v            (linkFwdIn_0_fwdPacket_v                 ), //i
    .linkIn_0_readyAndRev  (linkFwdIn_0_fwdPacket_readyAndRev       ), //i
    .linkIn_0_data         (linkFwdIn_0_fwdPacket_data[77:0]        ), //i
    .linkIn_1_v            (linkFwdIn_1_fwdPacket_v                 ), //i
    .linkIn_1_readyAndRev  (linkFwdIn_1_fwdPacket_readyAndRev       ), //i
    .linkIn_1_data         (linkFwdIn_1_fwdPacket_data[77:0]        ), //i
    .linkIn_2_v            (linkFwdIn_2_fwdPacket_v                 ), //i
    .linkIn_2_readyAndRev  (linkFwdIn_2_fwdPacket_readyAndRev       ), //i
    .linkIn_2_data         (linkFwdIn_2_fwdPacket_data[77:0]        ), //i
    .linkIn_3_v            (linkFwdIn_3_fwdPacket_v                 ), //i
    .linkIn_3_readyAndRev  (linkFwdIn_3_fwdPacket_readyAndRev       ), //i
    .linkIn_3_data         (linkFwdIn_3_fwdPacket_data[77:0]        ), //i
    .linkIn_4_v            (linkFwdIn_4_fwdPacket_v                 ), //i
    .linkIn_4_readyAndRev  (linkFwdIn_4_fwdPacket_readyAndRev       ), //i
    .linkIn_4_data         (linkFwdIn_4_fwdPacket_data[77:0]        ), //i
    .linkOut_0_v           (bufferMeshRouter_2_linkOut_0_v          ), //o
    .linkOut_0_readyAndRev (bufferMeshRouter_2_linkOut_0_readyAndRev), //o
    .linkOut_0_data        (bufferMeshRouter_2_linkOut_0_data[77:0] ), //o
    .linkOut_1_v           (bufferMeshRouter_2_linkOut_1_v          ), //o
    .linkOut_1_readyAndRev (bufferMeshRouter_2_linkOut_1_readyAndRev), //o
    .linkOut_1_data        (bufferMeshRouter_2_linkOut_1_data[77:0] ), //o
    .linkOut_2_v           (bufferMeshRouter_2_linkOut_2_v          ), //o
    .linkOut_2_readyAndRev (bufferMeshRouter_2_linkOut_2_readyAndRev), //o
    .linkOut_2_data        (bufferMeshRouter_2_linkOut_2_data[77:0] ), //o
    .linkOut_3_v           (bufferMeshRouter_2_linkOut_3_v          ), //o
    .linkOut_3_readyAndRev (bufferMeshRouter_2_linkOut_3_readyAndRev), //o
    .linkOut_3_data        (bufferMeshRouter_2_linkOut_3_data[77:0] ), //o
    .linkOut_4_v           (bufferMeshRouter_2_linkOut_4_v          ), //o
    .linkOut_4_readyAndRev (bufferMeshRouter_2_linkOut_4_readyAndRev), //o
    .linkOut_4_data        (bufferMeshRouter_2_linkOut_4_data[77:0] ), //o
    .myXCordIn             (myXCordIn[1:0]                          ), //i
    .myYCordIn             (myYCordIn[1:0]                          ), //i
    .clk                   (clk                                     ), //i
    .resetn                (resetn                                  )  //i
  );
  bufferMeshRouter_1 bufferMeshRouter_3 (
    .linkIn_0_v            (linkRevIn_0_revPacket_v                 ), //i
    .linkIn_0_readyAndRev  (linkRevIn_0_revPacket_readyAndRev       ), //i
    .linkIn_0_data         (linkRevIn_0_revPacket_data[46:0]        ), //i
    .linkIn_1_v            (linkRevIn_1_revPacket_v                 ), //i
    .linkIn_1_readyAndRev  (linkRevIn_1_revPacket_readyAndRev       ), //i
    .linkIn_1_data         (linkRevIn_1_revPacket_data[46:0]        ), //i
    .linkIn_2_v            (linkRevIn_2_revPacket_v                 ), //i
    .linkIn_2_readyAndRev  (linkRevIn_2_revPacket_readyAndRev       ), //i
    .linkIn_2_data         (linkRevIn_2_revPacket_data[46:0]        ), //i
    .linkIn_3_v            (linkRevIn_3_revPacket_v                 ), //i
    .linkIn_3_readyAndRev  (linkRevIn_3_revPacket_readyAndRev       ), //i
    .linkIn_3_data         (linkRevIn_3_revPacket_data[46:0]        ), //i
    .linkIn_4_v            (linkRevIn_4_revPacket_v                 ), //i
    .linkIn_4_readyAndRev  (linkRevIn_4_revPacket_readyAndRev       ), //i
    .linkIn_4_data         (linkRevIn_4_revPacket_data[46:0]        ), //i
    .linkOut_0_v           (bufferMeshRouter_3_linkOut_0_v          ), //o
    .linkOut_0_readyAndRev (bufferMeshRouter_3_linkOut_0_readyAndRev), //o
    .linkOut_0_data        (bufferMeshRouter_3_linkOut_0_data[46:0] ), //o
    .linkOut_1_v           (bufferMeshRouter_3_linkOut_1_v          ), //o
    .linkOut_1_readyAndRev (bufferMeshRouter_3_linkOut_1_readyAndRev), //o
    .linkOut_1_data        (bufferMeshRouter_3_linkOut_1_data[46:0] ), //o
    .linkOut_2_v           (bufferMeshRouter_3_linkOut_2_v          ), //o
    .linkOut_2_readyAndRev (bufferMeshRouter_3_linkOut_2_readyAndRev), //o
    .linkOut_2_data        (bufferMeshRouter_3_linkOut_2_data[46:0] ), //o
    .linkOut_3_v           (bufferMeshRouter_3_linkOut_3_v          ), //o
    .linkOut_3_readyAndRev (bufferMeshRouter_3_linkOut_3_readyAndRev), //o
    .linkOut_3_data        (bufferMeshRouter_3_linkOut_3_data[46:0] ), //o
    .linkOut_4_v           (bufferMeshRouter_3_linkOut_4_v          ), //o
    .linkOut_4_readyAndRev (bufferMeshRouter_3_linkOut_4_readyAndRev), //o
    .linkOut_4_data        (bufferMeshRouter_3_linkOut_4_data[46:0] ), //o
    .myXCordIn             (myXCordIn[1:0]                          ), //i
    .myYCordIn             (myYCordIn[1:0]                          ), //i
    .clk                   (clk                                     ), //i
    .resetn                (resetn                                  )  //i
  );
  assign linkInCast_0_fwdlink_fwdPacket_v = linkIn_0_fwdlink_fwdPacket_v;
  assign linkInCast_0_fwdlink_fwdPacket_readyAndRev = linkIn_0_fwdlink_fwdPacket_readyAndRev;
  assign linkInCast_0_fwdlink_fwdPacket_data = linkIn_0_fwdlink_fwdPacket_data;
  assign linkInCast_0_revlink_revPacket_v = linkIn_0_revlink_revPacket_v;
  assign linkInCast_0_revlink_revPacket_readyAndRev = linkIn_0_revlink_revPacket_readyAndRev;
  assign linkInCast_0_revlink_revPacket_data = linkIn_0_revlink_revPacket_data;
  assign linkInCast_1_fwdlink_fwdPacket_v = linkIn_1_fwdlink_fwdPacket_v;
  assign linkInCast_1_fwdlink_fwdPacket_readyAndRev = linkIn_1_fwdlink_fwdPacket_readyAndRev;
  assign linkInCast_1_fwdlink_fwdPacket_data = linkIn_1_fwdlink_fwdPacket_data;
  assign linkInCast_1_revlink_revPacket_v = linkIn_1_revlink_revPacket_v;
  assign linkInCast_1_revlink_revPacket_readyAndRev = linkIn_1_revlink_revPacket_readyAndRev;
  assign linkInCast_1_revlink_revPacket_data = linkIn_1_revlink_revPacket_data;
  assign linkInCast_2_fwdlink_fwdPacket_v = linkIn_2_fwdlink_fwdPacket_v;
  assign linkInCast_2_fwdlink_fwdPacket_readyAndRev = linkIn_2_fwdlink_fwdPacket_readyAndRev;
  assign linkInCast_2_fwdlink_fwdPacket_data = linkIn_2_fwdlink_fwdPacket_data;
  assign linkInCast_2_revlink_revPacket_v = linkIn_2_revlink_revPacket_v;
  assign linkInCast_2_revlink_revPacket_readyAndRev = linkIn_2_revlink_revPacket_readyAndRev;
  assign linkInCast_2_revlink_revPacket_data = linkIn_2_revlink_revPacket_data;
  assign linkInCast_3_fwdlink_fwdPacket_v = linkIn_3_fwdlink_fwdPacket_v;
  assign linkInCast_3_fwdlink_fwdPacket_readyAndRev = linkIn_3_fwdlink_fwdPacket_readyAndRev;
  assign linkInCast_3_fwdlink_fwdPacket_data = linkIn_3_fwdlink_fwdPacket_data;
  assign linkInCast_3_revlink_revPacket_v = linkIn_3_revlink_revPacket_v;
  assign linkInCast_3_revlink_revPacket_readyAndRev = linkIn_3_revlink_revPacket_readyAndRev;
  assign linkInCast_3_revlink_revPacket_data = linkIn_3_revlink_revPacket_data;
  assign linkOut_0_fwdlink_fwdPacket_v = linkOutCast_0_fwdlink_fwdPacket_v;
  assign linkOut_0_fwdlink_fwdPacket_readyAndRev = linkOutCast_0_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_0_fwdlink_fwdPacket_data = linkOutCast_0_fwdlink_fwdPacket_data;
  assign linkOut_0_revlink_revPacket_v = linkOutCast_0_revlink_revPacket_v;
  assign linkOut_0_revlink_revPacket_readyAndRev = linkOutCast_0_revlink_revPacket_readyAndRev;
  assign linkOut_0_revlink_revPacket_data = linkOutCast_0_revlink_revPacket_data;
  assign linkOut_1_fwdlink_fwdPacket_v = linkOutCast_1_fwdlink_fwdPacket_v;
  assign linkOut_1_fwdlink_fwdPacket_readyAndRev = linkOutCast_1_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_1_fwdlink_fwdPacket_data = linkOutCast_1_fwdlink_fwdPacket_data;
  assign linkOut_1_revlink_revPacket_v = linkOutCast_1_revlink_revPacket_v;
  assign linkOut_1_revlink_revPacket_readyAndRev = linkOutCast_1_revlink_revPacket_readyAndRev;
  assign linkOut_1_revlink_revPacket_data = linkOutCast_1_revlink_revPacket_data;
  assign linkOut_2_fwdlink_fwdPacket_v = linkOutCast_2_fwdlink_fwdPacket_v;
  assign linkOut_2_fwdlink_fwdPacket_readyAndRev = linkOutCast_2_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_2_fwdlink_fwdPacket_data = linkOutCast_2_fwdlink_fwdPacket_data;
  assign linkOut_2_revlink_revPacket_v = linkOutCast_2_revlink_revPacket_v;
  assign linkOut_2_revlink_revPacket_readyAndRev = linkOutCast_2_revlink_revPacket_readyAndRev;
  assign linkOut_2_revlink_revPacket_data = linkOutCast_2_revlink_revPacket_data;
  assign linkOut_3_fwdlink_fwdPacket_v = linkOutCast_3_fwdlink_fwdPacket_v;
  assign linkOut_3_fwdlink_fwdPacket_readyAndRev = linkOutCast_3_fwdlink_fwdPacket_readyAndRev;
  assign linkOut_3_fwdlink_fwdPacket_data = linkOutCast_3_fwdlink_fwdPacket_data;
  assign linkOut_3_revlink_revPacket_v = linkOutCast_3_revlink_revPacket_v;
  assign linkOut_3_revlink_revPacket_readyAndRev = linkOutCast_3_revlink_revPacket_readyAndRev;
  assign linkOut_3_revlink_revPacket_data = linkOutCast_3_revlink_revPacket_data;
  assign procLinkLocalOut_fwdlink_fwdPacket_v = procLinkIn_fwdlink_fwdPacket_v;
  assign procLinkLocalOut_fwdlink_fwdPacket_readyAndRev = procLinkIn_fwdlink_fwdPacket_readyAndRev;
  assign procLinkLocalOut_fwdlink_fwdPacket_data = procLinkIn_fwdlink_fwdPacket_data;
  assign procLinkLocalOut_revlink_revPacket_v = procLinkIn_revlink_revPacket_v;
  assign procLinkLocalOut_revlink_revPacket_readyAndRev = procLinkIn_revlink_revPacket_readyAndRev;
  assign procLinkLocalOut_revlink_revPacket_data = procLinkIn_revlink_revPacket_data;
  assign procLinkOut_fwdlink_fwdPacket_v = procLinkLocalIn_fwdlink_fwdPacket_v;
  assign procLinkOut_fwdlink_fwdPacket_readyAndRev = procLinkLocalIn_fwdlink_fwdPacket_readyAndRev;
  assign procLinkOut_fwdlink_fwdPacket_data = procLinkLocalIn_fwdlink_fwdPacket_data;
  assign procLinkOut_revlink_revPacket_v = procLinkLocalIn_revlink_revPacket_v;
  assign procLinkOut_revlink_revPacket_readyAndRev = procLinkLocalIn_revlink_revPacket_readyAndRev;
  assign procLinkOut_revlink_revPacket_data = procLinkLocalIn_revlink_revPacket_data;
  assign procLinkLocalIn_revlink_revPacket_v = linkRevOut_0_revPacket_v;
  assign procLinkLocalIn_revlink_revPacket_readyAndRev = linkRevOut_0_revPacket_readyAndRev;
  assign procLinkLocalIn_revlink_revPacket_data = linkRevOut_0_revPacket_data;
  assign procLinkLocalIn_fwdlink_fwdPacket_v = linkFwdOut_0_fwdPacket_v;
  assign procLinkLocalIn_fwdlink_fwdPacket_readyAndRev = linkFwdOut_0_fwdPacket_readyAndRev;
  assign procLinkLocalIn_fwdlink_fwdPacket_data = linkFwdOut_0_fwdPacket_data;
  assign linkFwdIn_0_fwdPacket_v = procLinkLocalOut_fwdlink_fwdPacket_v;
  assign linkFwdIn_0_fwdPacket_readyAndRev = procLinkLocalOut_fwdlink_fwdPacket_readyAndRev;
  assign linkFwdIn_0_fwdPacket_data = procLinkLocalOut_fwdlink_fwdPacket_data;
  assign linkRevIn_0_revPacket_v = procLinkLocalOut_revlink_revPacket_v;
  assign linkRevIn_0_revPacket_readyAndRev = procLinkLocalOut_revlink_revPacket_readyAndRev;
  assign linkRevIn_0_revPacket_data = procLinkLocalOut_revlink_revPacket_data;
  assign linkRevIn_1_revPacket_v = linkInCast_0_revlink_revPacket_v;
  assign linkRevIn_1_revPacket_readyAndRev = linkInCast_0_revlink_revPacket_readyAndRev;
  assign linkRevIn_1_revPacket_data = linkInCast_0_revlink_revPacket_data;
  assign linkFwdIn_1_fwdPacket_v = linkInCast_0_fwdlink_fwdPacket_v;
  assign linkFwdIn_1_fwdPacket_readyAndRev = linkInCast_0_fwdlink_fwdPacket_readyAndRev;
  assign linkFwdIn_1_fwdPacket_data = linkInCast_0_fwdlink_fwdPacket_data;
  assign linkOutCast_0_fwdlink_fwdPacket_v = linkFwdOut_1_fwdPacket_v;
  assign linkOutCast_0_fwdlink_fwdPacket_readyAndRev = linkFwdOut_1_fwdPacket_readyAndRev;
  assign linkOutCast_0_fwdlink_fwdPacket_data = linkFwdOut_1_fwdPacket_data;
  assign linkOutCast_0_revlink_revPacket_v = linkRevOut_1_revPacket_v;
  assign linkOutCast_0_revlink_revPacket_readyAndRev = linkRevOut_1_revPacket_readyAndRev;
  assign linkOutCast_0_revlink_revPacket_data = linkRevOut_1_revPacket_data;
  assign linkRevIn_2_revPacket_v = linkInCast_1_revlink_revPacket_v;
  assign linkRevIn_2_revPacket_readyAndRev = linkInCast_1_revlink_revPacket_readyAndRev;
  assign linkRevIn_2_revPacket_data = linkInCast_1_revlink_revPacket_data;
  assign linkFwdIn_2_fwdPacket_v = linkInCast_1_fwdlink_fwdPacket_v;
  assign linkFwdIn_2_fwdPacket_readyAndRev = linkInCast_1_fwdlink_fwdPacket_readyAndRev;
  assign linkFwdIn_2_fwdPacket_data = linkInCast_1_fwdlink_fwdPacket_data;
  assign linkOutCast_1_fwdlink_fwdPacket_v = linkFwdOut_2_fwdPacket_v;
  assign linkOutCast_1_fwdlink_fwdPacket_readyAndRev = linkFwdOut_2_fwdPacket_readyAndRev;
  assign linkOutCast_1_fwdlink_fwdPacket_data = linkFwdOut_2_fwdPacket_data;
  assign linkOutCast_1_revlink_revPacket_v = linkRevOut_2_revPacket_v;
  assign linkOutCast_1_revlink_revPacket_readyAndRev = linkRevOut_2_revPacket_readyAndRev;
  assign linkOutCast_1_revlink_revPacket_data = linkRevOut_2_revPacket_data;
  assign linkRevIn_3_revPacket_v = linkInCast_2_revlink_revPacket_v;
  assign linkRevIn_3_revPacket_readyAndRev = linkInCast_2_revlink_revPacket_readyAndRev;
  assign linkRevIn_3_revPacket_data = linkInCast_2_revlink_revPacket_data;
  assign linkFwdIn_3_fwdPacket_v = linkInCast_2_fwdlink_fwdPacket_v;
  assign linkFwdIn_3_fwdPacket_readyAndRev = linkInCast_2_fwdlink_fwdPacket_readyAndRev;
  assign linkFwdIn_3_fwdPacket_data = linkInCast_2_fwdlink_fwdPacket_data;
  assign linkOutCast_2_fwdlink_fwdPacket_v = linkFwdOut_3_fwdPacket_v;
  assign linkOutCast_2_fwdlink_fwdPacket_readyAndRev = linkFwdOut_3_fwdPacket_readyAndRev;
  assign linkOutCast_2_fwdlink_fwdPacket_data = linkFwdOut_3_fwdPacket_data;
  assign linkOutCast_2_revlink_revPacket_v = linkRevOut_3_revPacket_v;
  assign linkOutCast_2_revlink_revPacket_readyAndRev = linkRevOut_3_revPacket_readyAndRev;
  assign linkOutCast_2_revlink_revPacket_data = linkRevOut_3_revPacket_data;
  assign linkRevIn_4_revPacket_v = linkInCast_3_revlink_revPacket_v;
  assign linkRevIn_4_revPacket_readyAndRev = linkInCast_3_revlink_revPacket_readyAndRev;
  assign linkRevIn_4_revPacket_data = linkInCast_3_revlink_revPacket_data;
  assign linkFwdIn_4_fwdPacket_v = linkInCast_3_fwdlink_fwdPacket_v;
  assign linkFwdIn_4_fwdPacket_readyAndRev = linkInCast_3_fwdlink_fwdPacket_readyAndRev;
  assign linkFwdIn_4_fwdPacket_data = linkInCast_3_fwdlink_fwdPacket_data;
  assign linkOutCast_3_fwdlink_fwdPacket_v = linkFwdOut_4_fwdPacket_v;
  assign linkOutCast_3_fwdlink_fwdPacket_readyAndRev = linkFwdOut_4_fwdPacket_readyAndRev;
  assign linkOutCast_3_fwdlink_fwdPacket_data = linkFwdOut_4_fwdPacket_data;
  assign linkOutCast_3_revlink_revPacket_v = linkRevOut_4_revPacket_v;
  assign linkOutCast_3_revlink_revPacket_readyAndRev = linkRevOut_4_revPacket_readyAndRev;
  assign linkOutCast_3_revlink_revPacket_data = linkRevOut_4_revPacket_data;
  assign linkFwdOut_0_fwdPacket_v = bufferMeshRouter_2_linkOut_0_v;
  assign linkFwdOut_0_fwdPacket_readyAndRev = bufferMeshRouter_2_linkOut_0_readyAndRev;
  assign linkFwdOut_0_fwdPacket_data = bufferMeshRouter_2_linkOut_0_data;
  assign linkFwdOut_1_fwdPacket_v = bufferMeshRouter_2_linkOut_1_v;
  assign linkFwdOut_1_fwdPacket_readyAndRev = bufferMeshRouter_2_linkOut_1_readyAndRev;
  assign linkFwdOut_1_fwdPacket_data = bufferMeshRouter_2_linkOut_1_data;
  assign linkFwdOut_2_fwdPacket_v = bufferMeshRouter_2_linkOut_2_v;
  assign linkFwdOut_2_fwdPacket_readyAndRev = bufferMeshRouter_2_linkOut_2_readyAndRev;
  assign linkFwdOut_2_fwdPacket_data = bufferMeshRouter_2_linkOut_2_data;
  assign linkFwdOut_3_fwdPacket_v = bufferMeshRouter_2_linkOut_3_v;
  assign linkFwdOut_3_fwdPacket_readyAndRev = bufferMeshRouter_2_linkOut_3_readyAndRev;
  assign linkFwdOut_3_fwdPacket_data = bufferMeshRouter_2_linkOut_3_data;
  assign linkFwdOut_4_fwdPacket_v = bufferMeshRouter_2_linkOut_4_v;
  assign linkFwdOut_4_fwdPacket_readyAndRev = bufferMeshRouter_2_linkOut_4_readyAndRev;
  assign linkFwdOut_4_fwdPacket_data = bufferMeshRouter_2_linkOut_4_data;
  assign linkRevOut_0_revPacket_v = bufferMeshRouter_3_linkOut_0_v;
  assign linkRevOut_0_revPacket_readyAndRev = bufferMeshRouter_3_linkOut_0_readyAndRev;
  assign linkRevOut_0_revPacket_data = bufferMeshRouter_3_linkOut_0_data;
  assign linkRevOut_1_revPacket_v = bufferMeshRouter_3_linkOut_1_v;
  assign linkRevOut_1_revPacket_readyAndRev = bufferMeshRouter_3_linkOut_1_readyAndRev;
  assign linkRevOut_1_revPacket_data = bufferMeshRouter_3_linkOut_1_data;
  assign linkRevOut_2_revPacket_v = bufferMeshRouter_3_linkOut_2_v;
  assign linkRevOut_2_revPacket_readyAndRev = bufferMeshRouter_3_linkOut_2_readyAndRev;
  assign linkRevOut_2_revPacket_data = bufferMeshRouter_3_linkOut_2_data;
  assign linkRevOut_3_revPacket_v = bufferMeshRouter_3_linkOut_3_v;
  assign linkRevOut_3_revPacket_readyAndRev = bufferMeshRouter_3_linkOut_3_readyAndRev;
  assign linkRevOut_3_revPacket_data = bufferMeshRouter_3_linkOut_3_data;
  assign linkRevOut_4_revPacket_v = bufferMeshRouter_3_linkOut_4_v;
  assign linkRevOut_4_revPacket_readyAndRev = bufferMeshRouter_3_linkOut_4_readyAndRev;
  assign linkRevOut_4_revPacket_data = bufferMeshRouter_3_linkOut_4_data;

endmodule

module bufferMeshRouter_1 (
  input               linkIn_0_v,
  input               linkIn_0_readyAndRev,
  input      [46:0]   linkIn_0_data,
  input               linkIn_1_v,
  input               linkIn_1_readyAndRev,
  input      [46:0]   linkIn_1_data,
  input               linkIn_2_v,
  input               linkIn_2_readyAndRev,
  input      [46:0]   linkIn_2_data,
  input               linkIn_3_v,
  input               linkIn_3_readyAndRev,
  input      [46:0]   linkIn_3_data,
  input               linkIn_4_v,
  input               linkIn_4_readyAndRev,
  input      [46:0]   linkIn_4_data,
  output              linkOut_0_v,
  output              linkOut_0_readyAndRev,
  output     [46:0]   linkOut_0_data,
  output              linkOut_1_v,
  output              linkOut_1_readyAndRev,
  output     [46:0]   linkOut_1_data,
  output              linkOut_2_v,
  output              linkOut_2_readyAndRev,
  output     [46:0]   linkOut_2_data,
  output              linkOut_3_v,
  output              linkOut_3_readyAndRev,
  output     [46:0]   linkOut_3_data,
  output              linkOut_4_v,
  output              linkOut_4_readyAndRev,
  output     [46:0]   linkOut_4_data,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  input               clk,
  input               resetn
);

  wire                streamFifo_10_readyOut;
  wire       [46:0]   streamFifo_10_dataOut;
  wire                streamFifo_10_validOut;
  wire                streamFifo_11_readyOut;
  wire       [46:0]   streamFifo_11_dataOut;
  wire                streamFifo_11_validOut;
  wire                streamFifo_12_readyOut;
  wire       [46:0]   streamFifo_12_dataOut;
  wire                streamFifo_12_validOut;
  wire                streamFifo_13_readyOut;
  wire       [46:0]   streamFifo_13_dataOut;
  wire                streamFifo_13_validOut;
  wire                streamFifo_14_readyOut;
  wire       [46:0]   streamFifo_14_dataOut;
  wire                streamFifo_14_validOut;
  wire                meshRouterUnit_yumiOut_0;
  wire                meshRouterUnit_yumiOut_1;
  wire                meshRouterUnit_yumiOut_2;
  wire                meshRouterUnit_yumiOut_3;
  wire                meshRouterUnit_yumiOut_4;
  wire       [46:0]   meshRouterUnit_dataOut_0;
  wire       [46:0]   meshRouterUnit_dataOut_1;
  wire       [46:0]   meshRouterUnit_dataOut_2;
  wire       [46:0]   meshRouterUnit_dataOut_3;
  wire       [46:0]   meshRouterUnit_dataOut_4;
  wire                meshRouterUnit_validOut_0;
  wire                meshRouterUnit_validOut_1;
  wire                meshRouterUnit_validOut_2;
  wire                meshRouterUnit_validOut_3;
  wire                meshRouterUnit_validOut_4;
  wire                linkInCast_0_v;
  wire                linkInCast_0_readyAndRev;
  wire       [46:0]   linkInCast_0_data;
  wire                linkInCast_1_v;
  wire                linkInCast_1_readyAndRev;
  wire       [46:0]   linkInCast_1_data;
  wire                linkInCast_2_v;
  wire                linkInCast_2_readyAndRev;
  wire       [46:0]   linkInCast_2_data;
  wire                linkInCast_3_v;
  wire                linkInCast_3_readyAndRev;
  wire       [46:0]   linkInCast_3_data;
  wire                linkInCast_4_v;
  wire                linkInCast_4_readyAndRev;
  wire       [46:0]   linkInCast_4_data;
  wire                linkOutCast_0_v;
  wire                linkOutCast_0_readyAndRev;
  wire       [46:0]   linkOutCast_0_data;
  wire                linkOutCast_1_v;
  wire                linkOutCast_1_readyAndRev;
  wire       [46:0]   linkOutCast_1_data;
  wire                linkOutCast_2_v;
  wire                linkOutCast_2_readyAndRev;
  wire       [46:0]   linkOutCast_2_data;
  wire                linkOutCast_3_v;
  wire                linkOutCast_3_readyAndRev;
  wire       [46:0]   linkOutCast_3_data;
  wire                linkOutCast_4_v;
  wire                linkOutCast_4_readyAndRev;
  wire       [46:0]   linkOutCast_4_data;
  wire                fifoValid_0;
  wire                fifoValid_1;
  wire                fifoValid_2;
  wire                fifoValid_3;
  wire                fifoValid_4;
  wire       [46:0]   fifoData_0;
  wire       [46:0]   fifoData_1;
  wire       [46:0]   fifoData_2;
  wire       [46:0]   fifoData_3;
  wire       [46:0]   fifoData_4;
  wire                fifoYumi_0;
  wire                fifoYumi_1;
  wire                fifoYumi_2;
  wire                fifoYumi_3;
  wire                fifoYumi_4;
  wire                validOut_0;
  wire                validOut_1;
  wire                validOut_2;
  wire                validOut_3;
  wire                validOut_4;
  wire       [46:0]   dataOut_0;
  wire       [46:0]   dataOut_1;
  wire       [46:0]   dataOut_2;
  wire       [46:0]   dataOut_3;
  wire       [46:0]   dataOut_4;
  wire                readyIn_0;
  wire                readyIn_1;
  wire                readyIn_2;
  wire                readyIn_3;
  wire                readyIn_4;

  streamFifo_5 streamFifo_10 (
    .dataIn   (linkInCast_0_data[46:0]    ), //i
    .validIn  (linkInCast_0_v             ), //i
    .readyOut (streamFifo_10_readyOut     ), //o
    .dataOut  (streamFifo_10_dataOut[46:0]), //o
    .validOut (streamFifo_10_validOut     ), //o
    .yumiIn   (fifoYumi_0                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo_5 streamFifo_11 (
    .dataIn   (linkInCast_1_data[46:0]    ), //i
    .validIn  (linkInCast_1_v             ), //i
    .readyOut (streamFifo_11_readyOut     ), //o
    .dataOut  (streamFifo_11_dataOut[46:0]), //o
    .validOut (streamFifo_11_validOut     ), //o
    .yumiIn   (fifoYumi_1                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo_5 streamFifo_12 (
    .dataIn   (linkInCast_2_data[46:0]    ), //i
    .validIn  (linkInCast_2_v             ), //i
    .readyOut (streamFifo_12_readyOut     ), //o
    .dataOut  (streamFifo_12_dataOut[46:0]), //o
    .validOut (streamFifo_12_validOut     ), //o
    .yumiIn   (fifoYumi_2                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo_5 streamFifo_13 (
    .dataIn   (linkInCast_3_data[46:0]    ), //i
    .validIn  (linkInCast_3_v             ), //i
    .readyOut (streamFifo_13_readyOut     ), //o
    .dataOut  (streamFifo_13_dataOut[46:0]), //o
    .validOut (streamFifo_13_validOut     ), //o
    .yumiIn   (fifoYumi_3                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo_5 streamFifo_14 (
    .dataIn   (linkInCast_4_data[46:0]    ), //i
    .validIn  (linkInCast_4_v             ), //i
    .readyOut (streamFifo_14_readyOut     ), //o
    .dataOut  (streamFifo_14_dataOut[46:0]), //o
    .validOut (streamFifo_14_validOut     ), //o
    .yumiIn   (fifoYumi_4                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  meshRouter_1 meshRouterUnit (
    .dataIn_0   (fifoData_0[46:0]              ), //i
    .dataIn_1   (fifoData_1[46:0]              ), //i
    .dataIn_2   (fifoData_2[46:0]              ), //i
    .dataIn_3   (fifoData_3[46:0]              ), //i
    .dataIn_4   (fifoData_4[46:0]              ), //i
    .validIn_0  (fifoValid_0                   ), //i
    .validIn_1  (fifoValid_1                   ), //i
    .validIn_2  (fifoValid_2                   ), //i
    .validIn_3  (fifoValid_3                   ), //i
    .validIn_4  (fifoValid_4                   ), //i
    .yumiOut_0  (meshRouterUnit_yumiOut_0      ), //o
    .yumiOut_1  (meshRouterUnit_yumiOut_1      ), //o
    .yumiOut_2  (meshRouterUnit_yumiOut_2      ), //o
    .yumiOut_3  (meshRouterUnit_yumiOut_3      ), //o
    .yumiOut_4  (meshRouterUnit_yumiOut_4      ), //o
    .readyIn_0  (readyIn_0                     ), //i
    .readyIn_1  (readyIn_1                     ), //i
    .readyIn_2  (readyIn_2                     ), //i
    .readyIn_3  (readyIn_3                     ), //i
    .readyIn_4  (readyIn_4                     ), //i
    .dataOut_0  (meshRouterUnit_dataOut_0[46:0]), //o
    .dataOut_1  (meshRouterUnit_dataOut_1[46:0]), //o
    .dataOut_2  (meshRouterUnit_dataOut_2[46:0]), //o
    .dataOut_3  (meshRouterUnit_dataOut_3[46:0]), //o
    .dataOut_4  (meshRouterUnit_dataOut_4[46:0]), //o
    .validOut_0 (meshRouterUnit_validOut_0     ), //o
    .validOut_1 (meshRouterUnit_validOut_1     ), //o
    .validOut_2 (meshRouterUnit_validOut_2     ), //o
    .validOut_3 (meshRouterUnit_validOut_3     ), //o
    .validOut_4 (meshRouterUnit_validOut_4     ), //o
    .myXCordIn  (myXCordIn[1:0]                ), //i
    .myYCordIn  (myYCordIn[1:0]                ), //i
    .clk        (clk                           ), //i
    .resetn     (resetn                        )  //i
  );
  assign linkOut_0_v = linkOutCast_0_v;
  assign linkOut_0_readyAndRev = linkOutCast_0_readyAndRev;
  assign linkOut_0_data = linkOutCast_0_data;
  assign linkOut_1_v = linkOutCast_1_v;
  assign linkOut_1_readyAndRev = linkOutCast_1_readyAndRev;
  assign linkOut_1_data = linkOutCast_1_data;
  assign linkOut_2_v = linkOutCast_2_v;
  assign linkOut_2_readyAndRev = linkOutCast_2_readyAndRev;
  assign linkOut_2_data = linkOutCast_2_data;
  assign linkOut_3_v = linkOutCast_3_v;
  assign linkOut_3_readyAndRev = linkOutCast_3_readyAndRev;
  assign linkOut_3_data = linkOutCast_3_data;
  assign linkOut_4_v = linkOutCast_4_v;
  assign linkOut_4_readyAndRev = linkOutCast_4_readyAndRev;
  assign linkOut_4_data = linkOutCast_4_data;
  assign linkInCast_0_v = linkIn_0_v;
  assign linkInCast_0_readyAndRev = linkIn_0_readyAndRev;
  assign linkInCast_0_data = linkIn_0_data;
  assign linkInCast_1_v = linkIn_1_v;
  assign linkInCast_1_readyAndRev = linkIn_1_readyAndRev;
  assign linkInCast_1_data = linkIn_1_data;
  assign linkInCast_2_v = linkIn_2_v;
  assign linkInCast_2_readyAndRev = linkIn_2_readyAndRev;
  assign linkInCast_2_data = linkIn_2_data;
  assign linkInCast_3_v = linkIn_3_v;
  assign linkInCast_3_readyAndRev = linkIn_3_readyAndRev;
  assign linkInCast_3_data = linkIn_3_data;
  assign linkInCast_4_v = linkIn_4_v;
  assign linkInCast_4_readyAndRev = linkIn_4_readyAndRev;
  assign linkInCast_4_data = linkIn_4_data;
  assign linkOutCast_0_readyAndRev = streamFifo_10_readyOut;
  assign fifoValid_0 = streamFifo_10_validOut;
  assign fifoData_0 = streamFifo_10_dataOut;
  assign linkOutCast_0_data = dataOut_0;
  assign readyIn_0 = linkInCast_0_readyAndRev;
  assign linkOutCast_0_v = validOut_0;
  assign linkOutCast_1_readyAndRev = streamFifo_11_readyOut;
  assign fifoValid_1 = streamFifo_11_validOut;
  assign fifoData_1 = streamFifo_11_dataOut;
  assign linkOutCast_1_data = dataOut_1;
  assign readyIn_1 = linkInCast_1_readyAndRev;
  assign linkOutCast_1_v = validOut_1;
  assign linkOutCast_2_readyAndRev = streamFifo_12_readyOut;
  assign fifoValid_2 = streamFifo_12_validOut;
  assign fifoData_2 = streamFifo_12_dataOut;
  assign linkOutCast_2_data = dataOut_2;
  assign readyIn_2 = linkInCast_2_readyAndRev;
  assign linkOutCast_2_v = validOut_2;
  assign linkOutCast_3_readyAndRev = streamFifo_13_readyOut;
  assign fifoValid_3 = streamFifo_13_validOut;
  assign fifoData_3 = streamFifo_13_dataOut;
  assign linkOutCast_3_data = dataOut_3;
  assign readyIn_3 = linkInCast_3_readyAndRev;
  assign linkOutCast_3_v = validOut_3;
  assign linkOutCast_4_readyAndRev = streamFifo_14_readyOut;
  assign fifoValid_4 = streamFifo_14_validOut;
  assign fifoData_4 = streamFifo_14_dataOut;
  assign linkOutCast_4_data = dataOut_4;
  assign readyIn_4 = linkInCast_4_readyAndRev;
  assign linkOutCast_4_v = validOut_4;
  assign fifoYumi_0 = meshRouterUnit_yumiOut_0;
  assign fifoYumi_1 = meshRouterUnit_yumiOut_1;
  assign fifoYumi_2 = meshRouterUnit_yumiOut_2;
  assign fifoYumi_3 = meshRouterUnit_yumiOut_3;
  assign fifoYumi_4 = meshRouterUnit_yumiOut_4;
  assign dataOut_0 = meshRouterUnit_dataOut_0;
  assign dataOut_1 = meshRouterUnit_dataOut_1;
  assign dataOut_2 = meshRouterUnit_dataOut_2;
  assign dataOut_3 = meshRouterUnit_dataOut_3;
  assign dataOut_4 = meshRouterUnit_dataOut_4;
  assign validOut_0 = meshRouterUnit_validOut_0;
  assign validOut_1 = meshRouterUnit_validOut_1;
  assign validOut_2 = meshRouterUnit_validOut_2;
  assign validOut_3 = meshRouterUnit_validOut_3;
  assign validOut_4 = meshRouterUnit_validOut_4;

endmodule

module bufferMeshRouter (
  input               linkIn_0_v,
  input               linkIn_0_readyAndRev,
  input      [77:0]   linkIn_0_data,
  input               linkIn_1_v,
  input               linkIn_1_readyAndRev,
  input      [77:0]   linkIn_1_data,
  input               linkIn_2_v,
  input               linkIn_2_readyAndRev,
  input      [77:0]   linkIn_2_data,
  input               linkIn_3_v,
  input               linkIn_3_readyAndRev,
  input      [77:0]   linkIn_3_data,
  input               linkIn_4_v,
  input               linkIn_4_readyAndRev,
  input      [77:0]   linkIn_4_data,
  output              linkOut_0_v,
  output              linkOut_0_readyAndRev,
  output     [77:0]   linkOut_0_data,
  output              linkOut_1_v,
  output              linkOut_1_readyAndRev,
  output     [77:0]   linkOut_1_data,
  output              linkOut_2_v,
  output              linkOut_2_readyAndRev,
  output     [77:0]   linkOut_2_data,
  output              linkOut_3_v,
  output              linkOut_3_readyAndRev,
  output     [77:0]   linkOut_3_data,
  output              linkOut_4_v,
  output              linkOut_4_readyAndRev,
  output     [77:0]   linkOut_4_data,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  input               clk,
  input               resetn
);

  wire                streamFifo_10_readyOut;
  wire       [77:0]   streamFifo_10_dataOut;
  wire                streamFifo_10_validOut;
  wire                streamFifo_11_readyOut;
  wire       [77:0]   streamFifo_11_dataOut;
  wire                streamFifo_11_validOut;
  wire                streamFifo_12_readyOut;
  wire       [77:0]   streamFifo_12_dataOut;
  wire                streamFifo_12_validOut;
  wire                streamFifo_13_readyOut;
  wire       [77:0]   streamFifo_13_dataOut;
  wire                streamFifo_13_validOut;
  wire                streamFifo_14_readyOut;
  wire       [77:0]   streamFifo_14_dataOut;
  wire                streamFifo_14_validOut;
  wire                meshRouterUnit_yumiOut_0;
  wire                meshRouterUnit_yumiOut_1;
  wire                meshRouterUnit_yumiOut_2;
  wire                meshRouterUnit_yumiOut_3;
  wire                meshRouterUnit_yumiOut_4;
  wire       [77:0]   meshRouterUnit_dataOut_0;
  wire       [77:0]   meshRouterUnit_dataOut_1;
  wire       [77:0]   meshRouterUnit_dataOut_2;
  wire       [77:0]   meshRouterUnit_dataOut_3;
  wire       [77:0]   meshRouterUnit_dataOut_4;
  wire                meshRouterUnit_validOut_0;
  wire                meshRouterUnit_validOut_1;
  wire                meshRouterUnit_validOut_2;
  wire                meshRouterUnit_validOut_3;
  wire                meshRouterUnit_validOut_4;
  wire                linkInCast_0_v;
  wire                linkInCast_0_readyAndRev;
  wire       [77:0]   linkInCast_0_data;
  wire                linkInCast_1_v;
  wire                linkInCast_1_readyAndRev;
  wire       [77:0]   linkInCast_1_data;
  wire                linkInCast_2_v;
  wire                linkInCast_2_readyAndRev;
  wire       [77:0]   linkInCast_2_data;
  wire                linkInCast_3_v;
  wire                linkInCast_3_readyAndRev;
  wire       [77:0]   linkInCast_3_data;
  wire                linkInCast_4_v;
  wire                linkInCast_4_readyAndRev;
  wire       [77:0]   linkInCast_4_data;
  wire                linkOutCast_0_v;
  wire                linkOutCast_0_readyAndRev;
  wire       [77:0]   linkOutCast_0_data;
  wire                linkOutCast_1_v;
  wire                linkOutCast_1_readyAndRev;
  wire       [77:0]   linkOutCast_1_data;
  wire                linkOutCast_2_v;
  wire                linkOutCast_2_readyAndRev;
  wire       [77:0]   linkOutCast_2_data;
  wire                linkOutCast_3_v;
  wire                linkOutCast_3_readyAndRev;
  wire       [77:0]   linkOutCast_3_data;
  wire                linkOutCast_4_v;
  wire                linkOutCast_4_readyAndRev;
  wire       [77:0]   linkOutCast_4_data;
  wire                fifoValid_0;
  wire                fifoValid_1;
  wire                fifoValid_2;
  wire                fifoValid_3;
  wire                fifoValid_4;
  wire       [77:0]   fifoData_0;
  wire       [77:0]   fifoData_1;
  wire       [77:0]   fifoData_2;
  wire       [77:0]   fifoData_3;
  wire       [77:0]   fifoData_4;
  wire                fifoYumi_0;
  wire                fifoYumi_1;
  wire                fifoYumi_2;
  wire                fifoYumi_3;
  wire                fifoYumi_4;
  wire                validOut_0;
  wire                validOut_1;
  wire                validOut_2;
  wire                validOut_3;
  wire                validOut_4;
  wire       [77:0]   dataOut_0;
  wire       [77:0]   dataOut_1;
  wire       [77:0]   dataOut_2;
  wire       [77:0]   dataOut_3;
  wire       [77:0]   dataOut_4;
  wire                readyIn_0;
  wire                readyIn_1;
  wire                readyIn_2;
  wire                readyIn_3;
  wire                readyIn_4;

  streamFifo streamFifo_10 (
    .dataIn   (linkInCast_0_data[77:0]    ), //i
    .validIn  (linkInCast_0_v             ), //i
    .readyOut (streamFifo_10_readyOut     ), //o
    .dataOut  (streamFifo_10_dataOut[77:0]), //o
    .validOut (streamFifo_10_validOut     ), //o
    .yumiIn   (fifoYumi_0                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo streamFifo_11 (
    .dataIn   (linkInCast_1_data[77:0]    ), //i
    .validIn  (linkInCast_1_v             ), //i
    .readyOut (streamFifo_11_readyOut     ), //o
    .dataOut  (streamFifo_11_dataOut[77:0]), //o
    .validOut (streamFifo_11_validOut     ), //o
    .yumiIn   (fifoYumi_1                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo streamFifo_12 (
    .dataIn   (linkInCast_2_data[77:0]    ), //i
    .validIn  (linkInCast_2_v             ), //i
    .readyOut (streamFifo_12_readyOut     ), //o
    .dataOut  (streamFifo_12_dataOut[77:0]), //o
    .validOut (streamFifo_12_validOut     ), //o
    .yumiIn   (fifoYumi_2                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo streamFifo_13 (
    .dataIn   (linkInCast_3_data[77:0]    ), //i
    .validIn  (linkInCast_3_v             ), //i
    .readyOut (streamFifo_13_readyOut     ), //o
    .dataOut  (streamFifo_13_dataOut[77:0]), //o
    .validOut (streamFifo_13_validOut     ), //o
    .yumiIn   (fifoYumi_3                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  streamFifo streamFifo_14 (
    .dataIn   (linkInCast_4_data[77:0]    ), //i
    .validIn  (linkInCast_4_v             ), //i
    .readyOut (streamFifo_14_readyOut     ), //o
    .dataOut  (streamFifo_14_dataOut[77:0]), //o
    .validOut (streamFifo_14_validOut     ), //o
    .yumiIn   (fifoYumi_4                 ), //i
    .clk      (clk                        ), //i
    .resetn   (resetn                     )  //i
  );
  meshRouter meshRouterUnit (
    .dataIn_0   (fifoData_0[77:0]              ), //i
    .dataIn_1   (fifoData_1[77:0]              ), //i
    .dataIn_2   (fifoData_2[77:0]              ), //i
    .dataIn_3   (fifoData_3[77:0]              ), //i
    .dataIn_4   (fifoData_4[77:0]              ), //i
    .validIn_0  (fifoValid_0                   ), //i
    .validIn_1  (fifoValid_1                   ), //i
    .validIn_2  (fifoValid_2                   ), //i
    .validIn_3  (fifoValid_3                   ), //i
    .validIn_4  (fifoValid_4                   ), //i
    .yumiOut_0  (meshRouterUnit_yumiOut_0      ), //o
    .yumiOut_1  (meshRouterUnit_yumiOut_1      ), //o
    .yumiOut_2  (meshRouterUnit_yumiOut_2      ), //o
    .yumiOut_3  (meshRouterUnit_yumiOut_3      ), //o
    .yumiOut_4  (meshRouterUnit_yumiOut_4      ), //o
    .readyIn_0  (readyIn_0                     ), //i
    .readyIn_1  (readyIn_1                     ), //i
    .readyIn_2  (readyIn_2                     ), //i
    .readyIn_3  (readyIn_3                     ), //i
    .readyIn_4  (readyIn_4                     ), //i
    .dataOut_0  (meshRouterUnit_dataOut_0[77:0]), //o
    .dataOut_1  (meshRouterUnit_dataOut_1[77:0]), //o
    .dataOut_2  (meshRouterUnit_dataOut_2[77:0]), //o
    .dataOut_3  (meshRouterUnit_dataOut_3[77:0]), //o
    .dataOut_4  (meshRouterUnit_dataOut_4[77:0]), //o
    .validOut_0 (meshRouterUnit_validOut_0     ), //o
    .validOut_1 (meshRouterUnit_validOut_1     ), //o
    .validOut_2 (meshRouterUnit_validOut_2     ), //o
    .validOut_3 (meshRouterUnit_validOut_3     ), //o
    .validOut_4 (meshRouterUnit_validOut_4     ), //o
    .myXCordIn  (myXCordIn[1:0]                ), //i
    .myYCordIn  (myYCordIn[1:0]                ), //i
    .clk        (clk                           ), //i
    .resetn     (resetn                        )  //i
  );
  assign linkOut_0_v = linkOutCast_0_v;
  assign linkOut_0_readyAndRev = linkOutCast_0_readyAndRev;
  assign linkOut_0_data = linkOutCast_0_data;
  assign linkOut_1_v = linkOutCast_1_v;
  assign linkOut_1_readyAndRev = linkOutCast_1_readyAndRev;
  assign linkOut_1_data = linkOutCast_1_data;
  assign linkOut_2_v = linkOutCast_2_v;
  assign linkOut_2_readyAndRev = linkOutCast_2_readyAndRev;
  assign linkOut_2_data = linkOutCast_2_data;
  assign linkOut_3_v = linkOutCast_3_v;
  assign linkOut_3_readyAndRev = linkOutCast_3_readyAndRev;
  assign linkOut_3_data = linkOutCast_3_data;
  assign linkOut_4_v = linkOutCast_4_v;
  assign linkOut_4_readyAndRev = linkOutCast_4_readyAndRev;
  assign linkOut_4_data = linkOutCast_4_data;
  assign linkInCast_0_v = linkIn_0_v;
  assign linkInCast_0_readyAndRev = linkIn_0_readyAndRev;
  assign linkInCast_0_data = linkIn_0_data;
  assign linkInCast_1_v = linkIn_1_v;
  assign linkInCast_1_readyAndRev = linkIn_1_readyAndRev;
  assign linkInCast_1_data = linkIn_1_data;
  assign linkInCast_2_v = linkIn_2_v;
  assign linkInCast_2_readyAndRev = linkIn_2_readyAndRev;
  assign linkInCast_2_data = linkIn_2_data;
  assign linkInCast_3_v = linkIn_3_v;
  assign linkInCast_3_readyAndRev = linkIn_3_readyAndRev;
  assign linkInCast_3_data = linkIn_3_data;
  assign linkInCast_4_v = linkIn_4_v;
  assign linkInCast_4_readyAndRev = linkIn_4_readyAndRev;
  assign linkInCast_4_data = linkIn_4_data;
  assign linkOutCast_0_readyAndRev = streamFifo_10_readyOut;
  assign fifoValid_0 = streamFifo_10_validOut;
  assign fifoData_0 = streamFifo_10_dataOut;
  assign linkOutCast_0_data = dataOut_0;
  assign readyIn_0 = linkInCast_0_readyAndRev;
  assign linkOutCast_0_v = validOut_0;
  assign linkOutCast_1_readyAndRev = streamFifo_11_readyOut;
  assign fifoValid_1 = streamFifo_11_validOut;
  assign fifoData_1 = streamFifo_11_dataOut;
  assign linkOutCast_1_data = dataOut_1;
  assign readyIn_1 = linkInCast_1_readyAndRev;
  assign linkOutCast_1_v = validOut_1;
  assign linkOutCast_2_readyAndRev = streamFifo_12_readyOut;
  assign fifoValid_2 = streamFifo_12_validOut;
  assign fifoData_2 = streamFifo_12_dataOut;
  assign linkOutCast_2_data = dataOut_2;
  assign readyIn_2 = linkInCast_2_readyAndRev;
  assign linkOutCast_2_v = validOut_2;
  assign linkOutCast_3_readyAndRev = streamFifo_13_readyOut;
  assign fifoValid_3 = streamFifo_13_validOut;
  assign fifoData_3 = streamFifo_13_dataOut;
  assign linkOutCast_3_data = dataOut_3;
  assign readyIn_3 = linkInCast_3_readyAndRev;
  assign linkOutCast_3_v = validOut_3;
  assign linkOutCast_4_readyAndRev = streamFifo_14_readyOut;
  assign fifoValid_4 = streamFifo_14_validOut;
  assign fifoData_4 = streamFifo_14_dataOut;
  assign linkOutCast_4_data = dataOut_4;
  assign readyIn_4 = linkInCast_4_readyAndRev;
  assign linkOutCast_4_v = validOut_4;
  assign fifoYumi_0 = meshRouterUnit_yumiOut_0;
  assign fifoYumi_1 = meshRouterUnit_yumiOut_1;
  assign fifoYumi_2 = meshRouterUnit_yumiOut_2;
  assign fifoYumi_3 = meshRouterUnit_yumiOut_3;
  assign fifoYumi_4 = meshRouterUnit_yumiOut_4;
  assign dataOut_0 = meshRouterUnit_dataOut_0;
  assign dataOut_1 = meshRouterUnit_dataOut_1;
  assign dataOut_2 = meshRouterUnit_dataOut_2;
  assign dataOut_3 = meshRouterUnit_dataOut_3;
  assign dataOut_4 = meshRouterUnit_dataOut_4;
  assign validOut_0 = meshRouterUnit_validOut_0;
  assign validOut_1 = meshRouterUnit_validOut_1;
  assign validOut_2 = meshRouterUnit_validOut_2;
  assign validOut_3 = meshRouterUnit_validOut_3;
  assign validOut_4 = meshRouterUnit_validOut_4;

endmodule

module meshRouter_1 (
  input      [46:0]   dataIn_0,
  input      [46:0]   dataIn_1,
  input      [46:0]   dataIn_2,
  input      [46:0]   dataIn_3,
  input      [46:0]   dataIn_4,
  input               validIn_0,
  input               validIn_1,
  input               validIn_2,
  input               validIn_3,
  input               validIn_4,
  output              yumiOut_0,
  output              yumiOut_1,
  output              yumiOut_2,
  output              yumiOut_3,
  output              yumiOut_4,
  input               readyIn_0,
  input               readyIn_1,
  input               readyIn_2,
  input               readyIn_3,
  input               readyIn_4,
  output     [46:0]   dataOut_0,
  output     [46:0]   dataOut_1,
  output     [46:0]   dataOut_2,
  output     [46:0]   dataOut_3,
  output     [46:0]   dataOut_4,
  output              validOut_0,
  output              validOut_1,
  output              validOut_2,
  output              validOut_3,
  output              validOut_4,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  input               clk,
  input               resetn
);

  wire       [4:0]    meshDorRouting_reqOut_0;
  wire       [4:0]    meshDorRouting_reqOut_1;
  wire       [4:0]    meshDorRouting_reqOut_2;
  wire       [4:0]    meshDorRouting_reqOut_3;
  wire       [4:0]    meshDorRouting_reqOut_4;
  wire       [4:0]    rrArbiter_10_grantsOut;
  wire       [4:0]    rrArbiter_10_selOneHotOut;
  wire       [2:0]    rrArbiter_10_oneHotIndex;
  wire                rrArbiter_10_validOut;
  wire       [46:0]   muxOneHot_10_dataOut;
  wire       [1:0]    rrArbiter_11_grantsOut;
  wire       [1:0]    rrArbiter_11_selOneHotOut;
  wire       [0:0]    rrArbiter_11_oneHotIndex;
  wire                rrArbiter_11_validOut;
  wire       [46:0]   muxOneHot_11_dataOut;
  wire       [1:0]    rrArbiter_12_grantsOut;
  wire       [1:0]    rrArbiter_12_selOneHotOut;
  wire       [0:0]    rrArbiter_12_oneHotIndex;
  wire                rrArbiter_12_validOut;
  wire       [46:0]   muxOneHot_12_dataOut;
  wire       [3:0]    rrArbiter_13_grantsOut;
  wire       [3:0]    rrArbiter_13_selOneHotOut;
  wire       [1:0]    rrArbiter_13_oneHotIndex;
  wire                rrArbiter_13_validOut;
  wire       [46:0]   muxOneHot_13_dataOut;
  wire       [3:0]    rrArbiter_14_grantsOut;
  wire       [3:0]    rrArbiter_14_selOneHotOut;
  wire       [1:0]    rrArbiter_14_oneHotIndex;
  wire                rrArbiter_14_validOut;
  wire       [46:0]   muxOneHot_14_dataOut;
  wire       [46:0]   _zz_xDirs_0;
  wire       [46:0]   _zz_yDirs_0;
  wire       [46:0]   _zz_xDirs_1;
  wire       [46:0]   _zz_yDirs_1;
  wire       [46:0]   _zz_xDirs_2;
  wire       [46:0]   _zz_yDirs_2;
  wire       [46:0]   _zz_xDirs_3;
  wire       [46:0]   _zz_yDirs_3;
  wire       [46:0]   _zz_xDirs_4;
  wire       [46:0]   _zz_yDirs_4;
  wire       [1:0]    xDirs_0;
  wire       [1:0]    xDirs_1;
  wire       [1:0]    xDirs_2;
  wire       [1:0]    xDirs_3;
  wire       [1:0]    xDirs_4;
  wire       [1:0]    yDirs_0;
  wire       [1:0]    yDirs_1;
  wire       [1:0]    yDirs_2;
  wire       [1:0]    yDirs_3;
  wire       [1:0]    yDirs_4;
  wire                readyInStub_0;
  wire                readyInStub_1;
  wire                readyInStub_2;
  wire                readyInStub_3;
  wire                readyInStub_4;
  wire                validInStub_0;
  wire                validInStub_1;
  wire                validInStub_2;
  wire                validInStub_3;
  wire                validInStub_4;
  wire       [4:0]    dirReq_0;
  wire       [4:0]    dirReq_1;
  wire       [4:0]    dirReq_2;
  wire       [4:0]    dirReq_3;
  wire       [4:0]    dirReq_4;
  wire                grantDirEnIn_0;
  wire                grantDirEnIn_1;
  wire                grantDirEnIn_2;
  wire                grantDirEnIn_3;
  wire                grantDirEnIn_4;
  wire       [4:0]    reqDirIn_0;
  wire       [1:0]    reqDirIn_1;
  wire       [1:0]    reqDirIn_2;
  wire       [3:0]    reqDirIn_3;
  wire       [3:0]    reqDirIn_4;
  wire       [4:0]    grantDirOut_0;
  wire       [1:0]    grantDirOut_1;
  wire       [1:0]    grantDirOut_2;
  wire       [3:0]    grantDirOut_3;
  wire       [3:0]    grantDirOut_4;
  wire       [4:0]    selDirOut_0;
  wire       [1:0]    selDirOut_1;
  wire       [1:0]    selDirOut_2;
  wire       [3:0]    selDirOut_3;
  wire       [3:0]    selDirOut_4;
  wire                validDirOut_0;
  wire                validDirOut_1;
  wire                validDirOut_2;
  wire                validDirOut_3;
  wire                validDirOut_4;
  wire                yumDirIn_0;
  wire                yumDirIn_1;
  wire                yumDirIn_2;
  wire                yumDirIn_3;
  wire                yumDirIn_4;

  assign _zz_xDirs_0 = dataIn_0;
  assign _zz_yDirs_0 = dataIn_0;
  assign _zz_xDirs_1 = dataIn_1;
  assign _zz_yDirs_1 = dataIn_1;
  assign _zz_xDirs_2 = dataIn_2;
  assign _zz_yDirs_2 = dataIn_2;
  assign _zz_xDirs_3 = dataIn_3;
  assign _zz_yDirs_3 = dataIn_3;
  assign _zz_xDirs_4 = dataIn_4;
  assign _zz_yDirs_4 = dataIn_4;
  meshRouterDorDecoder meshDorRouting (
    .validIn_0 (validInStub_0               ), //i
    .validIn_1 (validInStub_1               ), //i
    .validIn_2 (validInStub_2               ), //i
    .validIn_3 (validInStub_3               ), //i
    .validIn_4 (validInStub_4               ), //i
    .xDirIn_0  (xDirs_0[1:0]                ), //i
    .xDirIn_1  (xDirs_1[1:0]                ), //i
    .xDirIn_2  (xDirs_2[1:0]                ), //i
    .xDirIn_3  (xDirs_3[1:0]                ), //i
    .xDirIn_4  (xDirs_4[1:0]                ), //i
    .yDirIn_0  (yDirs_0[1:0]                ), //i
    .yDirIn_1  (yDirs_1[1:0]                ), //i
    .yDirIn_2  (yDirs_2[1:0]                ), //i
    .yDirIn_3  (yDirs_3[1:0]                ), //i
    .yDirIn_4  (yDirs_4[1:0]                ), //i
    .myXCordIn (myXCordIn[1:0]              ), //i
    .myYCordIn (myYCordIn[1:0]              ), //i
    .reqOut_0  (meshDorRouting_reqOut_0[4:0]), //o
    .reqOut_1  (meshDorRouting_reqOut_1[4:0]), //o
    .reqOut_2  (meshDorRouting_reqOut_2[4:0]), //o
    .reqOut_3  (meshDorRouting_reqOut_3[4:0]), //o
    .reqOut_4  (meshDorRouting_reqOut_4[4:0])  //o
  );
  rrArbiter rrArbiter_10 (
    .grantsEnIn   (grantDirEnIn_0                ), //i
    .reqsIn       (reqDirIn_0[4:0]               ), //i
    .grantsOut    (rrArbiter_10_grantsOut[4:0]   ), //o
    .selOneHotOut (rrArbiter_10_selOneHotOut[4:0]), //o
    .yumIn        (yumDirIn_0                    ), //i
    .oneHotIndex  (rrArbiter_10_oneHotIndex[2:0] ), //o
    .validOut     (rrArbiter_10_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_5 muxOneHot_10 (
    .dataIn_0  (dataIn_4[46:0]            ), //i
    .dataIn_1  (dataIn_3[46:0]            ), //i
    .dataIn_2  (dataIn_2[46:0]            ), //i
    .dataIn_3  (dataIn_1[46:0]            ), //i
    .dataIn_4  (dataIn_0[46:0]            ), //i
    .selOneHot (selDirOut_0[4:0]          ), //i
    .dataOut   (muxOneHot_10_dataOut[46:0])  //o
  );
  rrArbiter_1 rrArbiter_11 (
    .grantsEnIn   (grantDirEnIn_1                ), //i
    .reqsIn       (reqDirIn_1[1:0]               ), //i
    .grantsOut    (rrArbiter_11_grantsOut[1:0]   ), //o
    .selOneHotOut (rrArbiter_11_selOneHotOut[1:0]), //o
    .yumIn        (yumDirIn_1                    ), //i
    .oneHotIndex  (rrArbiter_11_oneHotIndex      ), //o
    .validOut     (rrArbiter_11_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_6 muxOneHot_11 (
    .dataIn_0  (dataIn_2[46:0]            ), //i
    .dataIn_1  (dataIn_0[46:0]            ), //i
    .selOneHot (selDirOut_1[1:0]          ), //i
    .dataOut   (muxOneHot_11_dataOut[46:0])  //o
  );
  rrArbiter_1 rrArbiter_12 (
    .grantsEnIn   (grantDirEnIn_2                ), //i
    .reqsIn       (reqDirIn_2[1:0]               ), //i
    .grantsOut    (rrArbiter_12_grantsOut[1:0]   ), //o
    .selOneHotOut (rrArbiter_12_selOneHotOut[1:0]), //o
    .yumIn        (yumDirIn_2                    ), //i
    .oneHotIndex  (rrArbiter_12_oneHotIndex      ), //o
    .validOut     (rrArbiter_12_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_6 muxOneHot_12 (
    .dataIn_0  (dataIn_1[46:0]            ), //i
    .dataIn_1  (dataIn_0[46:0]            ), //i
    .selOneHot (selDirOut_2[1:0]          ), //i
    .dataOut   (muxOneHot_12_dataOut[46:0])  //o
  );
  rrArbiter_3 rrArbiter_13 (
    .grantsEnIn   (grantDirEnIn_3                ), //i
    .reqsIn       (reqDirIn_3[3:0]               ), //i
    .grantsOut    (rrArbiter_13_grantsOut[3:0]   ), //o
    .selOneHotOut (rrArbiter_13_selOneHotOut[3:0]), //o
    .yumIn        (yumDirIn_3                    ), //i
    .oneHotIndex  (rrArbiter_13_oneHotIndex[1:0] ), //o
    .validOut     (rrArbiter_13_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_8 muxOneHot_13 (
    .dataIn_0  (dataIn_4[46:0]            ), //i
    .dataIn_1  (dataIn_2[46:0]            ), //i
    .dataIn_2  (dataIn_1[46:0]            ), //i
    .dataIn_3  (dataIn_0[46:0]            ), //i
    .selOneHot (selDirOut_3[3:0]          ), //i
    .dataOut   (muxOneHot_13_dataOut[46:0])  //o
  );
  rrArbiter_3 rrArbiter_14 (
    .grantsEnIn   (grantDirEnIn_4                ), //i
    .reqsIn       (reqDirIn_4[3:0]               ), //i
    .grantsOut    (rrArbiter_14_grantsOut[3:0]   ), //o
    .selOneHotOut (rrArbiter_14_selOneHotOut[3:0]), //o
    .yumIn        (yumDirIn_4                    ), //i
    .oneHotIndex  (rrArbiter_14_oneHotIndex[1:0] ), //o
    .validOut     (rrArbiter_14_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_8 muxOneHot_14 (
    .dataIn_0  (dataIn_3[46:0]            ), //i
    .dataIn_1  (dataIn_2[46:0]            ), //i
    .dataIn_2  (dataIn_1[46:0]            ), //i
    .dataIn_3  (dataIn_0[46:0]            ), //i
    .selOneHot (selDirOut_4[3:0]          ), //i
    .dataOut   (muxOneHot_14_dataOut[46:0])  //o
  );
  assign readyInStub_0 = (readyIn_0 || 1'b0);
  assign validInStub_0 = (validIn_0 || 1'b0);
  assign readyInStub_1 = (readyIn_1 || 1'b0);
  assign validInStub_1 = (validIn_1 || 1'b0);
  assign readyInStub_2 = (readyIn_2 || 1'b0);
  assign validInStub_2 = (validIn_2 || 1'b0);
  assign readyInStub_3 = (readyIn_3 || 1'b0);
  assign validInStub_3 = (validIn_3 || 1'b0);
  assign readyInStub_4 = (readyIn_4 || 1'b0);
  assign validInStub_4 = (validIn_4 || 1'b0);
  assign xDirs_0 = _zz_xDirs_0[1 : 0];
  assign yDirs_0 = _zz_yDirs_0[3 : 2];
  assign xDirs_1 = _zz_xDirs_1[1 : 0];
  assign yDirs_1 = _zz_yDirs_1[3 : 2];
  assign xDirs_2 = _zz_xDirs_2[1 : 0];
  assign yDirs_2 = _zz_yDirs_2[3 : 2];
  assign xDirs_3 = _zz_xDirs_3[1 : 0];
  assign yDirs_3 = _zz_yDirs_3[3 : 2];
  assign xDirs_4 = _zz_xDirs_4[1 : 0];
  assign yDirs_4 = _zz_yDirs_4[3 : 2];
  assign dirReq_0 = meshDorRouting_reqOut_0;
  assign dirReq_1 = meshDorRouting_reqOut_1;
  assign dirReq_2 = meshDorRouting_reqOut_2;
  assign dirReq_3 = meshDorRouting_reqOut_3;
  assign dirReq_4 = meshDorRouting_reqOut_4;
  assign grantDirEnIn_0 = readyInStub_0;
  assign yumDirIn_0 = (validDirOut_0 && readyInStub_0);
  assign reqDirIn_0 = {{{{dirReq_4[0],dirReq_3[0]},dirReq_2[0]},dirReq_1[0]},dirReq_0[0]};
  assign grantDirOut_0 = rrArbiter_10_grantsOut;
  assign selDirOut_0 = rrArbiter_10_selOneHotOut;
  assign validDirOut_0 = rrArbiter_10_validOut;
  assign dataOut_0 = muxOneHot_10_dataOut;
  assign yumiOut_0 = (|grantDirOut_0);
  assign validOut_0 = validDirOut_0;
  assign grantDirEnIn_1 = readyInStub_1;
  assign yumDirIn_1 = (validDirOut_1 && readyInStub_1);
  assign reqDirIn_1 = {dirReq_2[1],dirReq_0[1]};
  assign grantDirOut_1 = rrArbiter_11_grantsOut;
  assign selDirOut_1 = rrArbiter_11_selOneHotOut;
  assign validDirOut_1 = rrArbiter_11_validOut;
  assign dataOut_1 = muxOneHot_11_dataOut;
  assign yumiOut_1 = (|grantDirOut_1);
  assign validOut_1 = validDirOut_1;
  assign grantDirEnIn_2 = readyInStub_2;
  assign yumDirIn_2 = (validDirOut_2 && readyInStub_2);
  assign reqDirIn_2 = {dirReq_1[2],dirReq_0[2]};
  assign grantDirOut_2 = rrArbiter_12_grantsOut;
  assign selDirOut_2 = rrArbiter_12_selOneHotOut;
  assign validDirOut_2 = rrArbiter_12_validOut;
  assign dataOut_2 = muxOneHot_12_dataOut;
  assign yumiOut_2 = (|grantDirOut_2);
  assign validOut_2 = validDirOut_2;
  assign grantDirEnIn_3 = readyInStub_3;
  assign yumDirIn_3 = (validDirOut_3 && readyInStub_3);
  assign reqDirIn_3 = {{{dirReq_4[3],dirReq_2[3]},dirReq_1[3]},dirReq_0[3]};
  assign grantDirOut_3 = rrArbiter_13_grantsOut;
  assign selDirOut_3 = rrArbiter_13_selOneHotOut;
  assign validDirOut_3 = rrArbiter_13_validOut;
  assign dataOut_3 = muxOneHot_13_dataOut;
  assign yumiOut_3 = (|grantDirOut_3);
  assign validOut_3 = validDirOut_3;
  assign grantDirEnIn_4 = readyInStub_4;
  assign yumDirIn_4 = (validDirOut_4 && readyInStub_4);
  assign reqDirIn_4 = {{{dirReq_3[4],dirReq_2[4]},dirReq_1[4]},dirReq_0[4]};
  assign grantDirOut_4 = rrArbiter_14_grantsOut;
  assign selDirOut_4 = rrArbiter_14_selOneHotOut;
  assign validDirOut_4 = rrArbiter_14_validOut;
  assign dataOut_4 = muxOneHot_14_dataOut;
  assign yumiOut_4 = (|grantDirOut_4);
  assign validOut_4 = validDirOut_4;

endmodule

//streamFifo_5 replaced by streamFifo_5

//streamFifo_5 replaced by streamFifo_5

//streamFifo_5 replaced by streamFifo_5

//streamFifo_5 replaced by streamFifo_5

module streamFifo_5 (
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

  Mem1r1w_5 fifo2_myMem1r1w (
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

module meshRouter (
  input      [77:0]   dataIn_0,
  input      [77:0]   dataIn_1,
  input      [77:0]   dataIn_2,
  input      [77:0]   dataIn_3,
  input      [77:0]   dataIn_4,
  input               validIn_0,
  input               validIn_1,
  input               validIn_2,
  input               validIn_3,
  input               validIn_4,
  output              yumiOut_0,
  output              yumiOut_1,
  output              yumiOut_2,
  output              yumiOut_3,
  output              yumiOut_4,
  input               readyIn_0,
  input               readyIn_1,
  input               readyIn_2,
  input               readyIn_3,
  input               readyIn_4,
  output     [77:0]   dataOut_0,
  output     [77:0]   dataOut_1,
  output     [77:0]   dataOut_2,
  output     [77:0]   dataOut_3,
  output     [77:0]   dataOut_4,
  output              validOut_0,
  output              validOut_1,
  output              validOut_2,
  output              validOut_3,
  output              validOut_4,
  input      [1:0]    myXCordIn,
  input      [1:0]    myYCordIn,
  input               clk,
  input               resetn
);

  wire       [4:0]    meshDorRouting_reqOut_0;
  wire       [4:0]    meshDorRouting_reqOut_1;
  wire       [4:0]    meshDorRouting_reqOut_2;
  wire       [4:0]    meshDorRouting_reqOut_3;
  wire       [4:0]    meshDorRouting_reqOut_4;
  wire       [4:0]    rrArbiter_10_grantsOut;
  wire       [4:0]    rrArbiter_10_selOneHotOut;
  wire       [2:0]    rrArbiter_10_oneHotIndex;
  wire                rrArbiter_10_validOut;
  wire       [77:0]   muxOneHot_10_dataOut;
  wire       [1:0]    rrArbiter_11_grantsOut;
  wire       [1:0]    rrArbiter_11_selOneHotOut;
  wire       [0:0]    rrArbiter_11_oneHotIndex;
  wire                rrArbiter_11_validOut;
  wire       [77:0]   muxOneHot_11_dataOut;
  wire       [1:0]    rrArbiter_12_grantsOut;
  wire       [1:0]    rrArbiter_12_selOneHotOut;
  wire       [0:0]    rrArbiter_12_oneHotIndex;
  wire                rrArbiter_12_validOut;
  wire       [77:0]   muxOneHot_12_dataOut;
  wire       [3:0]    rrArbiter_13_grantsOut;
  wire       [3:0]    rrArbiter_13_selOneHotOut;
  wire       [1:0]    rrArbiter_13_oneHotIndex;
  wire                rrArbiter_13_validOut;
  wire       [77:0]   muxOneHot_13_dataOut;
  wire       [3:0]    rrArbiter_14_grantsOut;
  wire       [3:0]    rrArbiter_14_selOneHotOut;
  wire       [1:0]    rrArbiter_14_oneHotIndex;
  wire                rrArbiter_14_validOut;
  wire       [77:0]   muxOneHot_14_dataOut;
  wire       [77:0]   _zz_xDirs_0;
  wire       [77:0]   _zz_yDirs_0;
  wire       [77:0]   _zz_xDirs_1;
  wire       [77:0]   _zz_yDirs_1;
  wire       [77:0]   _zz_xDirs_2;
  wire       [77:0]   _zz_yDirs_2;
  wire       [77:0]   _zz_xDirs_3;
  wire       [77:0]   _zz_yDirs_3;
  wire       [77:0]   _zz_xDirs_4;
  wire       [77:0]   _zz_yDirs_4;
  wire       [1:0]    xDirs_0;
  wire       [1:0]    xDirs_1;
  wire       [1:0]    xDirs_2;
  wire       [1:0]    xDirs_3;
  wire       [1:0]    xDirs_4;
  wire       [1:0]    yDirs_0;
  wire       [1:0]    yDirs_1;
  wire       [1:0]    yDirs_2;
  wire       [1:0]    yDirs_3;
  wire       [1:0]    yDirs_4;
  wire                readyInStub_0;
  wire                readyInStub_1;
  wire                readyInStub_2;
  wire                readyInStub_3;
  wire                readyInStub_4;
  wire                validInStub_0;
  wire                validInStub_1;
  wire                validInStub_2;
  wire                validInStub_3;
  wire                validInStub_4;
  wire       [4:0]    dirReq_0;
  wire       [4:0]    dirReq_1;
  wire       [4:0]    dirReq_2;
  wire       [4:0]    dirReq_3;
  wire       [4:0]    dirReq_4;
  wire                grantDirEnIn_0;
  wire                grantDirEnIn_1;
  wire                grantDirEnIn_2;
  wire                grantDirEnIn_3;
  wire                grantDirEnIn_4;
  wire       [4:0]    reqDirIn_0;
  wire       [1:0]    reqDirIn_1;
  wire       [1:0]    reqDirIn_2;
  wire       [3:0]    reqDirIn_3;
  wire       [3:0]    reqDirIn_4;
  wire       [4:0]    grantDirOut_0;
  wire       [1:0]    grantDirOut_1;
  wire       [1:0]    grantDirOut_2;
  wire       [3:0]    grantDirOut_3;
  wire       [3:0]    grantDirOut_4;
  wire       [4:0]    selDirOut_0;
  wire       [1:0]    selDirOut_1;
  wire       [1:0]    selDirOut_2;
  wire       [3:0]    selDirOut_3;
  wire       [3:0]    selDirOut_4;
  wire                validDirOut_0;
  wire                validDirOut_1;
  wire                validDirOut_2;
  wire                validDirOut_3;
  wire                validDirOut_4;
  wire                yumDirIn_0;
  wire                yumDirIn_1;
  wire                yumDirIn_2;
  wire                yumDirIn_3;
  wire                yumDirIn_4;

  assign _zz_xDirs_0 = dataIn_0;
  assign _zz_yDirs_0 = dataIn_0;
  assign _zz_xDirs_1 = dataIn_1;
  assign _zz_yDirs_1 = dataIn_1;
  assign _zz_xDirs_2 = dataIn_2;
  assign _zz_yDirs_2 = dataIn_2;
  assign _zz_xDirs_3 = dataIn_3;
  assign _zz_yDirs_3 = dataIn_3;
  assign _zz_xDirs_4 = dataIn_4;
  assign _zz_yDirs_4 = dataIn_4;
  meshRouterDorDecoder meshDorRouting (
    .validIn_0 (validInStub_0               ), //i
    .validIn_1 (validInStub_1               ), //i
    .validIn_2 (validInStub_2               ), //i
    .validIn_3 (validInStub_3               ), //i
    .validIn_4 (validInStub_4               ), //i
    .xDirIn_0  (xDirs_0[1:0]                ), //i
    .xDirIn_1  (xDirs_1[1:0]                ), //i
    .xDirIn_2  (xDirs_2[1:0]                ), //i
    .xDirIn_3  (xDirs_3[1:0]                ), //i
    .xDirIn_4  (xDirs_4[1:0]                ), //i
    .yDirIn_0  (yDirs_0[1:0]                ), //i
    .yDirIn_1  (yDirs_1[1:0]                ), //i
    .yDirIn_2  (yDirs_2[1:0]                ), //i
    .yDirIn_3  (yDirs_3[1:0]                ), //i
    .yDirIn_4  (yDirs_4[1:0]                ), //i
    .myXCordIn (myXCordIn[1:0]              ), //i
    .myYCordIn (myYCordIn[1:0]              ), //i
    .reqOut_0  (meshDorRouting_reqOut_0[4:0]), //o
    .reqOut_1  (meshDorRouting_reqOut_1[4:0]), //o
    .reqOut_2  (meshDorRouting_reqOut_2[4:0]), //o
    .reqOut_3  (meshDorRouting_reqOut_3[4:0]), //o
    .reqOut_4  (meshDorRouting_reqOut_4[4:0])  //o
  );
  rrArbiter rrArbiter_10 (
    .grantsEnIn   (grantDirEnIn_0                ), //i
    .reqsIn       (reqDirIn_0[4:0]               ), //i
    .grantsOut    (rrArbiter_10_grantsOut[4:0]   ), //o
    .selOneHotOut (rrArbiter_10_selOneHotOut[4:0]), //o
    .yumIn        (yumDirIn_0                    ), //i
    .oneHotIndex  (rrArbiter_10_oneHotIndex[2:0] ), //o
    .validOut     (rrArbiter_10_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot muxOneHot_10 (
    .dataIn_0  (dataIn_4[77:0]            ), //i
    .dataIn_1  (dataIn_3[77:0]            ), //i
    .dataIn_2  (dataIn_2[77:0]            ), //i
    .dataIn_3  (dataIn_1[77:0]            ), //i
    .dataIn_4  (dataIn_0[77:0]            ), //i
    .selOneHot (selDirOut_0[4:0]          ), //i
    .dataOut   (muxOneHot_10_dataOut[77:0])  //o
  );
  rrArbiter_1 rrArbiter_11 (
    .grantsEnIn   (grantDirEnIn_1                ), //i
    .reqsIn       (reqDirIn_1[1:0]               ), //i
    .grantsOut    (rrArbiter_11_grantsOut[1:0]   ), //o
    .selOneHotOut (rrArbiter_11_selOneHotOut[1:0]), //o
    .yumIn        (yumDirIn_1                    ), //i
    .oneHotIndex  (rrArbiter_11_oneHotIndex      ), //o
    .validOut     (rrArbiter_11_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_1 muxOneHot_11 (
    .dataIn_0  (dataIn_2[77:0]            ), //i
    .dataIn_1  (dataIn_0[77:0]            ), //i
    .selOneHot (selDirOut_1[1:0]          ), //i
    .dataOut   (muxOneHot_11_dataOut[77:0])  //o
  );
  rrArbiter_1 rrArbiter_12 (
    .grantsEnIn   (grantDirEnIn_2                ), //i
    .reqsIn       (reqDirIn_2[1:0]               ), //i
    .grantsOut    (rrArbiter_12_grantsOut[1:0]   ), //o
    .selOneHotOut (rrArbiter_12_selOneHotOut[1:0]), //o
    .yumIn        (yumDirIn_2                    ), //i
    .oneHotIndex  (rrArbiter_12_oneHotIndex      ), //o
    .validOut     (rrArbiter_12_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_1 muxOneHot_12 (
    .dataIn_0  (dataIn_1[77:0]            ), //i
    .dataIn_1  (dataIn_0[77:0]            ), //i
    .selOneHot (selDirOut_2[1:0]          ), //i
    .dataOut   (muxOneHot_12_dataOut[77:0])  //o
  );
  rrArbiter_3 rrArbiter_13 (
    .grantsEnIn   (grantDirEnIn_3                ), //i
    .reqsIn       (reqDirIn_3[3:0]               ), //i
    .grantsOut    (rrArbiter_13_grantsOut[3:0]   ), //o
    .selOneHotOut (rrArbiter_13_selOneHotOut[3:0]), //o
    .yumIn        (yumDirIn_3                    ), //i
    .oneHotIndex  (rrArbiter_13_oneHotIndex[1:0] ), //o
    .validOut     (rrArbiter_13_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_3 muxOneHot_13 (
    .dataIn_0  (dataIn_4[77:0]            ), //i
    .dataIn_1  (dataIn_2[77:0]            ), //i
    .dataIn_2  (dataIn_1[77:0]            ), //i
    .dataIn_3  (dataIn_0[77:0]            ), //i
    .selOneHot (selDirOut_3[3:0]          ), //i
    .dataOut   (muxOneHot_13_dataOut[77:0])  //o
  );
  rrArbiter_3 rrArbiter_14 (
    .grantsEnIn   (grantDirEnIn_4                ), //i
    .reqsIn       (reqDirIn_4[3:0]               ), //i
    .grantsOut    (rrArbiter_14_grantsOut[3:0]   ), //o
    .selOneHotOut (rrArbiter_14_selOneHotOut[3:0]), //o
    .yumIn        (yumDirIn_4                    ), //i
    .oneHotIndex  (rrArbiter_14_oneHotIndex[1:0] ), //o
    .validOut     (rrArbiter_14_validOut         ), //o
    .clk          (clk                           ), //i
    .resetn       (resetn                        )  //i
  );
  muxOneHot_3 muxOneHot_14 (
    .dataIn_0  (dataIn_3[77:0]            ), //i
    .dataIn_1  (dataIn_2[77:0]            ), //i
    .dataIn_2  (dataIn_1[77:0]            ), //i
    .dataIn_3  (dataIn_0[77:0]            ), //i
    .selOneHot (selDirOut_4[3:0]          ), //i
    .dataOut   (muxOneHot_14_dataOut[77:0])  //o
  );
  assign readyInStub_0 = (readyIn_0 || 1'b0);
  assign validInStub_0 = (validIn_0 || 1'b0);
  assign readyInStub_1 = (readyIn_1 || 1'b0);
  assign validInStub_1 = (validIn_1 || 1'b0);
  assign readyInStub_2 = (readyIn_2 || 1'b0);
  assign validInStub_2 = (validIn_2 || 1'b0);
  assign readyInStub_3 = (readyIn_3 || 1'b0);
  assign validInStub_3 = (validIn_3 || 1'b0);
  assign readyInStub_4 = (readyIn_4 || 1'b0);
  assign validInStub_4 = (validIn_4 || 1'b0);
  assign xDirs_0 = _zz_xDirs_0[1 : 0];
  assign yDirs_0 = _zz_yDirs_0[3 : 2];
  assign xDirs_1 = _zz_xDirs_1[1 : 0];
  assign yDirs_1 = _zz_yDirs_1[3 : 2];
  assign xDirs_2 = _zz_xDirs_2[1 : 0];
  assign yDirs_2 = _zz_yDirs_2[3 : 2];
  assign xDirs_3 = _zz_xDirs_3[1 : 0];
  assign yDirs_3 = _zz_yDirs_3[3 : 2];
  assign xDirs_4 = _zz_xDirs_4[1 : 0];
  assign yDirs_4 = _zz_yDirs_4[3 : 2];
  assign dirReq_0 = meshDorRouting_reqOut_0;
  assign dirReq_1 = meshDorRouting_reqOut_1;
  assign dirReq_2 = meshDorRouting_reqOut_2;
  assign dirReq_3 = meshDorRouting_reqOut_3;
  assign dirReq_4 = meshDorRouting_reqOut_4;
  assign grantDirEnIn_0 = readyInStub_0;
  assign yumDirIn_0 = (validDirOut_0 && readyInStub_0);
  assign reqDirIn_0 = {{{{dirReq_4[0],dirReq_3[0]},dirReq_2[0]},dirReq_1[0]},dirReq_0[0]};
  assign grantDirOut_0 = rrArbiter_10_grantsOut;
  assign selDirOut_0 = rrArbiter_10_selOneHotOut;
  assign validDirOut_0 = rrArbiter_10_validOut;
  assign dataOut_0 = muxOneHot_10_dataOut;
  assign yumiOut_0 = (|grantDirOut_0);
  assign validOut_0 = validDirOut_0;
  assign grantDirEnIn_1 = readyInStub_1;
  assign yumDirIn_1 = (validDirOut_1 && readyInStub_1);
  assign reqDirIn_1 = {dirReq_2[1],dirReq_0[1]};
  assign grantDirOut_1 = rrArbiter_11_grantsOut;
  assign selDirOut_1 = rrArbiter_11_selOneHotOut;
  assign validDirOut_1 = rrArbiter_11_validOut;
  assign dataOut_1 = muxOneHot_11_dataOut;
  assign yumiOut_1 = (|grantDirOut_1);
  assign validOut_1 = validDirOut_1;
  assign grantDirEnIn_2 = readyInStub_2;
  assign yumDirIn_2 = (validDirOut_2 && readyInStub_2);
  assign reqDirIn_2 = {dirReq_1[2],dirReq_0[2]};
  assign grantDirOut_2 = rrArbiter_12_grantsOut;
  assign selDirOut_2 = rrArbiter_12_selOneHotOut;
  assign validDirOut_2 = rrArbiter_12_validOut;
  assign dataOut_2 = muxOneHot_12_dataOut;
  assign yumiOut_2 = (|grantDirOut_2);
  assign validOut_2 = validDirOut_2;
  assign grantDirEnIn_3 = readyInStub_3;
  assign yumDirIn_3 = (validDirOut_3 && readyInStub_3);
  assign reqDirIn_3 = {{{dirReq_4[3],dirReq_2[3]},dirReq_1[3]},dirReq_0[3]};
  assign grantDirOut_3 = rrArbiter_13_grantsOut;
  assign selDirOut_3 = rrArbiter_13_selOneHotOut;
  assign validDirOut_3 = rrArbiter_13_validOut;
  assign dataOut_3 = muxOneHot_13_dataOut;
  assign yumiOut_3 = (|grantDirOut_3);
  assign validOut_3 = validDirOut_3;
  assign grantDirEnIn_4 = readyInStub_4;
  assign yumDirIn_4 = (validDirOut_4 && readyInStub_4);
  assign reqDirIn_4 = {{{dirReq_3[4],dirReq_2[4]},dirReq_1[4]},dirReq_0[4]};
  assign grantDirOut_4 = rrArbiter_14_grantsOut;
  assign selDirOut_4 = rrArbiter_14_selOneHotOut;
  assign validDirOut_4 = rrArbiter_14_validOut;
  assign dataOut_4 = muxOneHot_14_dataOut;
  assign yumiOut_4 = (|grantDirOut_4);
  assign validOut_4 = validDirOut_4;

endmodule

//streamFifo replaced by streamFifo

//streamFifo replaced by streamFifo

//streamFifo replaced by streamFifo

//streamFifo replaced by streamFifo

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

  wire                fifo2_myMem1r1w_rVi;
  wire       [77:0]   fifo2_myMem1r1w_rDatao;
  reg        [0:0]    fifo2_ptrRead;
  wire                fifo2_deq;
  reg        [0:0]    fifo2_ptrWrite;
  wire                fifo2_enq;
  reg                 fifo2_empty;
  reg                 fifo2_full;

  Mem1r1w fifo2_myMem1r1w (
    .wVi    (fifo2_enq                   ), //i
    .wAddri (fifo2_ptrWrite              ), //i
    .wDatai (dataIn[77:0]                ), //i
    .rVi    (fifo2_myMem1r1w_rVi         ), //i
    .rAddri (fifo2_ptrRead               ), //i
    .rDatao (fifo2_myMem1r1w_rDatao[77:0]), //o
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

//muxOneHot_8 replaced by muxOneHot_8

//rrArbiter_3 replaced by rrArbiter_3

module muxOneHot_8 (
  input      [46:0]   dataIn_0,
  input      [46:0]   dataIn_1,
  input      [46:0]   dataIn_2,
  input      [46:0]   dataIn_3,
  input      [3:0]    selOneHot,
  output     [46:0]   dataOut
);

  wire       [46:0]   dataMask_0;
  wire       [46:0]   dataMask_1;
  wire       [46:0]   dataMask_2;
  wire       [46:0]   dataMask_3;
  wire                _zz_dataMask_0;
  reg        [46:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [46:0]   _zz_dataMask_1_1;
  wire                _zz_dataMask_2;
  reg        [46:0]   _zz_dataMask_2_1;
  wire                _zz_dataMask_3;
  reg        [46:0]   _zz_dataMask_3_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
    _zz_dataMask_2_1[46] = _zz_dataMask_2;
    _zz_dataMask_2_1[45] = _zz_dataMask_2;
    _zz_dataMask_2_1[44] = _zz_dataMask_2;
    _zz_dataMask_2_1[43] = _zz_dataMask_2;
    _zz_dataMask_2_1[42] = _zz_dataMask_2;
    _zz_dataMask_2_1[41] = _zz_dataMask_2;
    _zz_dataMask_2_1[40] = _zz_dataMask_2;
    _zz_dataMask_2_1[39] = _zz_dataMask_2;
    _zz_dataMask_2_1[38] = _zz_dataMask_2;
    _zz_dataMask_2_1[37] = _zz_dataMask_2;
    _zz_dataMask_2_1[36] = _zz_dataMask_2;
    _zz_dataMask_2_1[35] = _zz_dataMask_2;
    _zz_dataMask_2_1[34] = _zz_dataMask_2;
    _zz_dataMask_2_1[33] = _zz_dataMask_2;
    _zz_dataMask_2_1[32] = _zz_dataMask_2;
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
  assign _zz_dataMask_3 = selOneHot[3];
  always @(*) begin
    _zz_dataMask_3_1[46] = _zz_dataMask_3;
    _zz_dataMask_3_1[45] = _zz_dataMask_3;
    _zz_dataMask_3_1[44] = _zz_dataMask_3;
    _zz_dataMask_3_1[43] = _zz_dataMask_3;
    _zz_dataMask_3_1[42] = _zz_dataMask_3;
    _zz_dataMask_3_1[41] = _zz_dataMask_3;
    _zz_dataMask_3_1[40] = _zz_dataMask_3;
    _zz_dataMask_3_1[39] = _zz_dataMask_3;
    _zz_dataMask_3_1[38] = _zz_dataMask_3;
    _zz_dataMask_3_1[37] = _zz_dataMask_3;
    _zz_dataMask_3_1[36] = _zz_dataMask_3;
    _zz_dataMask_3_1[35] = _zz_dataMask_3;
    _zz_dataMask_3_1[34] = _zz_dataMask_3;
    _zz_dataMask_3_1[33] = _zz_dataMask_3;
    _zz_dataMask_3_1[32] = _zz_dataMask_3;
    _zz_dataMask_3_1[31] = _zz_dataMask_3;
    _zz_dataMask_3_1[30] = _zz_dataMask_3;
    _zz_dataMask_3_1[29] = _zz_dataMask_3;
    _zz_dataMask_3_1[28] = _zz_dataMask_3;
    _zz_dataMask_3_1[27] = _zz_dataMask_3;
    _zz_dataMask_3_1[26] = _zz_dataMask_3;
    _zz_dataMask_3_1[25] = _zz_dataMask_3;
    _zz_dataMask_3_1[24] = _zz_dataMask_3;
    _zz_dataMask_3_1[23] = _zz_dataMask_3;
    _zz_dataMask_3_1[22] = _zz_dataMask_3;
    _zz_dataMask_3_1[21] = _zz_dataMask_3;
    _zz_dataMask_3_1[20] = _zz_dataMask_3;
    _zz_dataMask_3_1[19] = _zz_dataMask_3;
    _zz_dataMask_3_1[18] = _zz_dataMask_3;
    _zz_dataMask_3_1[17] = _zz_dataMask_3;
    _zz_dataMask_3_1[16] = _zz_dataMask_3;
    _zz_dataMask_3_1[15] = _zz_dataMask_3;
    _zz_dataMask_3_1[14] = _zz_dataMask_3;
    _zz_dataMask_3_1[13] = _zz_dataMask_3;
    _zz_dataMask_3_1[12] = _zz_dataMask_3;
    _zz_dataMask_3_1[11] = _zz_dataMask_3;
    _zz_dataMask_3_1[10] = _zz_dataMask_3;
    _zz_dataMask_3_1[9] = _zz_dataMask_3;
    _zz_dataMask_3_1[8] = _zz_dataMask_3;
    _zz_dataMask_3_1[7] = _zz_dataMask_3;
    _zz_dataMask_3_1[6] = _zz_dataMask_3;
    _zz_dataMask_3_1[5] = _zz_dataMask_3;
    _zz_dataMask_3_1[4] = _zz_dataMask_3;
    _zz_dataMask_3_1[3] = _zz_dataMask_3;
    _zz_dataMask_3_1[2] = _zz_dataMask_3;
    _zz_dataMask_3_1[1] = _zz_dataMask_3;
    _zz_dataMask_3_1[0] = _zz_dataMask_3;
  end

  assign dataMask_3 = (_zz_dataMask_3_1 & dataIn_3);
  assign dataOut = (((dataMask_0 | dataMask_1) | dataMask_2) | dataMask_3);

endmodule

//rrArbiter_3 replaced by rrArbiter_3

//muxOneHot_6 replaced by muxOneHot_6

//rrArbiter_1 replaced by rrArbiter_1

module muxOneHot_6 (
  input      [46:0]   dataIn_0,
  input      [46:0]   dataIn_1,
  input      [1:0]    selOneHot,
  output     [46:0]   dataOut
);

  wire       [46:0]   dataMask_0;
  wire       [46:0]   dataMask_1;
  wire                _zz_dataMask_0;
  reg        [46:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [46:0]   _zz_dataMask_1_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
  assign dataOut = (dataMask_0 | dataMask_1);

endmodule

//rrArbiter_1 replaced by rrArbiter_1

module muxOneHot_5 (
  input      [46:0]   dataIn_0,
  input      [46:0]   dataIn_1,
  input      [46:0]   dataIn_2,
  input      [46:0]   dataIn_3,
  input      [46:0]   dataIn_4,
  input      [4:0]    selOneHot,
  output     [46:0]   dataOut
);

  wire       [46:0]   dataMask_0;
  wire       [46:0]   dataMask_1;
  wire       [46:0]   dataMask_2;
  wire       [46:0]   dataMask_3;
  wire       [46:0]   dataMask_4;
  wire                _zz_dataMask_0;
  reg        [46:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [46:0]   _zz_dataMask_1_1;
  wire                _zz_dataMask_2;
  reg        [46:0]   _zz_dataMask_2_1;
  wire                _zz_dataMask_3;
  reg        [46:0]   _zz_dataMask_3_1;
  wire                _zz_dataMask_4;
  reg        [46:0]   _zz_dataMask_4_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
    _zz_dataMask_2_1[46] = _zz_dataMask_2;
    _zz_dataMask_2_1[45] = _zz_dataMask_2;
    _zz_dataMask_2_1[44] = _zz_dataMask_2;
    _zz_dataMask_2_1[43] = _zz_dataMask_2;
    _zz_dataMask_2_1[42] = _zz_dataMask_2;
    _zz_dataMask_2_1[41] = _zz_dataMask_2;
    _zz_dataMask_2_1[40] = _zz_dataMask_2;
    _zz_dataMask_2_1[39] = _zz_dataMask_2;
    _zz_dataMask_2_1[38] = _zz_dataMask_2;
    _zz_dataMask_2_1[37] = _zz_dataMask_2;
    _zz_dataMask_2_1[36] = _zz_dataMask_2;
    _zz_dataMask_2_1[35] = _zz_dataMask_2;
    _zz_dataMask_2_1[34] = _zz_dataMask_2;
    _zz_dataMask_2_1[33] = _zz_dataMask_2;
    _zz_dataMask_2_1[32] = _zz_dataMask_2;
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
  assign _zz_dataMask_3 = selOneHot[3];
  always @(*) begin
    _zz_dataMask_3_1[46] = _zz_dataMask_3;
    _zz_dataMask_3_1[45] = _zz_dataMask_3;
    _zz_dataMask_3_1[44] = _zz_dataMask_3;
    _zz_dataMask_3_1[43] = _zz_dataMask_3;
    _zz_dataMask_3_1[42] = _zz_dataMask_3;
    _zz_dataMask_3_1[41] = _zz_dataMask_3;
    _zz_dataMask_3_1[40] = _zz_dataMask_3;
    _zz_dataMask_3_1[39] = _zz_dataMask_3;
    _zz_dataMask_3_1[38] = _zz_dataMask_3;
    _zz_dataMask_3_1[37] = _zz_dataMask_3;
    _zz_dataMask_3_1[36] = _zz_dataMask_3;
    _zz_dataMask_3_1[35] = _zz_dataMask_3;
    _zz_dataMask_3_1[34] = _zz_dataMask_3;
    _zz_dataMask_3_1[33] = _zz_dataMask_3;
    _zz_dataMask_3_1[32] = _zz_dataMask_3;
    _zz_dataMask_3_1[31] = _zz_dataMask_3;
    _zz_dataMask_3_1[30] = _zz_dataMask_3;
    _zz_dataMask_3_1[29] = _zz_dataMask_3;
    _zz_dataMask_3_1[28] = _zz_dataMask_3;
    _zz_dataMask_3_1[27] = _zz_dataMask_3;
    _zz_dataMask_3_1[26] = _zz_dataMask_3;
    _zz_dataMask_3_1[25] = _zz_dataMask_3;
    _zz_dataMask_3_1[24] = _zz_dataMask_3;
    _zz_dataMask_3_1[23] = _zz_dataMask_3;
    _zz_dataMask_3_1[22] = _zz_dataMask_3;
    _zz_dataMask_3_1[21] = _zz_dataMask_3;
    _zz_dataMask_3_1[20] = _zz_dataMask_3;
    _zz_dataMask_3_1[19] = _zz_dataMask_3;
    _zz_dataMask_3_1[18] = _zz_dataMask_3;
    _zz_dataMask_3_1[17] = _zz_dataMask_3;
    _zz_dataMask_3_1[16] = _zz_dataMask_3;
    _zz_dataMask_3_1[15] = _zz_dataMask_3;
    _zz_dataMask_3_1[14] = _zz_dataMask_3;
    _zz_dataMask_3_1[13] = _zz_dataMask_3;
    _zz_dataMask_3_1[12] = _zz_dataMask_3;
    _zz_dataMask_3_1[11] = _zz_dataMask_3;
    _zz_dataMask_3_1[10] = _zz_dataMask_3;
    _zz_dataMask_3_1[9] = _zz_dataMask_3;
    _zz_dataMask_3_1[8] = _zz_dataMask_3;
    _zz_dataMask_3_1[7] = _zz_dataMask_3;
    _zz_dataMask_3_1[6] = _zz_dataMask_3;
    _zz_dataMask_3_1[5] = _zz_dataMask_3;
    _zz_dataMask_3_1[4] = _zz_dataMask_3;
    _zz_dataMask_3_1[3] = _zz_dataMask_3;
    _zz_dataMask_3_1[2] = _zz_dataMask_3;
    _zz_dataMask_3_1[1] = _zz_dataMask_3;
    _zz_dataMask_3_1[0] = _zz_dataMask_3;
  end

  assign dataMask_3 = (_zz_dataMask_3_1 & dataIn_3);
  assign _zz_dataMask_4 = selOneHot[4];
  always @(*) begin
    _zz_dataMask_4_1[46] = _zz_dataMask_4;
    _zz_dataMask_4_1[45] = _zz_dataMask_4;
    _zz_dataMask_4_1[44] = _zz_dataMask_4;
    _zz_dataMask_4_1[43] = _zz_dataMask_4;
    _zz_dataMask_4_1[42] = _zz_dataMask_4;
    _zz_dataMask_4_1[41] = _zz_dataMask_4;
    _zz_dataMask_4_1[40] = _zz_dataMask_4;
    _zz_dataMask_4_1[39] = _zz_dataMask_4;
    _zz_dataMask_4_1[38] = _zz_dataMask_4;
    _zz_dataMask_4_1[37] = _zz_dataMask_4;
    _zz_dataMask_4_1[36] = _zz_dataMask_4;
    _zz_dataMask_4_1[35] = _zz_dataMask_4;
    _zz_dataMask_4_1[34] = _zz_dataMask_4;
    _zz_dataMask_4_1[33] = _zz_dataMask_4;
    _zz_dataMask_4_1[32] = _zz_dataMask_4;
    _zz_dataMask_4_1[31] = _zz_dataMask_4;
    _zz_dataMask_4_1[30] = _zz_dataMask_4;
    _zz_dataMask_4_1[29] = _zz_dataMask_4;
    _zz_dataMask_4_1[28] = _zz_dataMask_4;
    _zz_dataMask_4_1[27] = _zz_dataMask_4;
    _zz_dataMask_4_1[26] = _zz_dataMask_4;
    _zz_dataMask_4_1[25] = _zz_dataMask_4;
    _zz_dataMask_4_1[24] = _zz_dataMask_4;
    _zz_dataMask_4_1[23] = _zz_dataMask_4;
    _zz_dataMask_4_1[22] = _zz_dataMask_4;
    _zz_dataMask_4_1[21] = _zz_dataMask_4;
    _zz_dataMask_4_1[20] = _zz_dataMask_4;
    _zz_dataMask_4_1[19] = _zz_dataMask_4;
    _zz_dataMask_4_1[18] = _zz_dataMask_4;
    _zz_dataMask_4_1[17] = _zz_dataMask_4;
    _zz_dataMask_4_1[16] = _zz_dataMask_4;
    _zz_dataMask_4_1[15] = _zz_dataMask_4;
    _zz_dataMask_4_1[14] = _zz_dataMask_4;
    _zz_dataMask_4_1[13] = _zz_dataMask_4;
    _zz_dataMask_4_1[12] = _zz_dataMask_4;
    _zz_dataMask_4_1[11] = _zz_dataMask_4;
    _zz_dataMask_4_1[10] = _zz_dataMask_4;
    _zz_dataMask_4_1[9] = _zz_dataMask_4;
    _zz_dataMask_4_1[8] = _zz_dataMask_4;
    _zz_dataMask_4_1[7] = _zz_dataMask_4;
    _zz_dataMask_4_1[6] = _zz_dataMask_4;
    _zz_dataMask_4_1[5] = _zz_dataMask_4;
    _zz_dataMask_4_1[4] = _zz_dataMask_4;
    _zz_dataMask_4_1[3] = _zz_dataMask_4;
    _zz_dataMask_4_1[2] = _zz_dataMask_4;
    _zz_dataMask_4_1[1] = _zz_dataMask_4;
    _zz_dataMask_4_1[0] = _zz_dataMask_4;
  end

  assign dataMask_4 = (_zz_dataMask_4_1 & dataIn_4);
  assign dataOut = ((((dataMask_0 | dataMask_1) | dataMask_2) | dataMask_3) | dataMask_4);

endmodule

//rrArbiter replaced by rrArbiter

//meshRouterDorDecoder replaced by meshRouterDorDecoder

//Mem1r1w_5 replaced by Mem1r1w_5

//Mem1r1w_5 replaced by Mem1r1w_5

//Mem1r1w_5 replaced by Mem1r1w_5

//Mem1r1w_5 replaced by Mem1r1w_5

module Mem1r1w_5 (
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

//muxOneHot_3 replaced by muxOneHot_3

//rrArbiter_3 replaced by rrArbiter_3

module muxOneHot_3 (
  input      [77:0]   dataIn_0,
  input      [77:0]   dataIn_1,
  input      [77:0]   dataIn_2,
  input      [77:0]   dataIn_3,
  input      [3:0]    selOneHot,
  output     [77:0]   dataOut
);

  wire       [77:0]   dataMask_0;
  wire       [77:0]   dataMask_1;
  wire       [77:0]   dataMask_2;
  wire       [77:0]   dataMask_3;
  wire                _zz_dataMask_0;
  reg        [77:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [77:0]   _zz_dataMask_1_1;
  wire                _zz_dataMask_2;
  reg        [77:0]   _zz_dataMask_2_1;
  wire                _zz_dataMask_3;
  reg        [77:0]   _zz_dataMask_3_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[77] = _zz_dataMask_0;
    _zz_dataMask_0_1[76] = _zz_dataMask_0;
    _zz_dataMask_0_1[75] = _zz_dataMask_0;
    _zz_dataMask_0_1[74] = _zz_dataMask_0;
    _zz_dataMask_0_1[73] = _zz_dataMask_0;
    _zz_dataMask_0_1[72] = _zz_dataMask_0;
    _zz_dataMask_0_1[71] = _zz_dataMask_0;
    _zz_dataMask_0_1[70] = _zz_dataMask_0;
    _zz_dataMask_0_1[69] = _zz_dataMask_0;
    _zz_dataMask_0_1[68] = _zz_dataMask_0;
    _zz_dataMask_0_1[67] = _zz_dataMask_0;
    _zz_dataMask_0_1[66] = _zz_dataMask_0;
    _zz_dataMask_0_1[65] = _zz_dataMask_0;
    _zz_dataMask_0_1[64] = _zz_dataMask_0;
    _zz_dataMask_0_1[63] = _zz_dataMask_0;
    _zz_dataMask_0_1[62] = _zz_dataMask_0;
    _zz_dataMask_0_1[61] = _zz_dataMask_0;
    _zz_dataMask_0_1[60] = _zz_dataMask_0;
    _zz_dataMask_0_1[59] = _zz_dataMask_0;
    _zz_dataMask_0_1[58] = _zz_dataMask_0;
    _zz_dataMask_0_1[57] = _zz_dataMask_0;
    _zz_dataMask_0_1[56] = _zz_dataMask_0;
    _zz_dataMask_0_1[55] = _zz_dataMask_0;
    _zz_dataMask_0_1[54] = _zz_dataMask_0;
    _zz_dataMask_0_1[53] = _zz_dataMask_0;
    _zz_dataMask_0_1[52] = _zz_dataMask_0;
    _zz_dataMask_0_1[51] = _zz_dataMask_0;
    _zz_dataMask_0_1[50] = _zz_dataMask_0;
    _zz_dataMask_0_1[49] = _zz_dataMask_0;
    _zz_dataMask_0_1[48] = _zz_dataMask_0;
    _zz_dataMask_0_1[47] = _zz_dataMask_0;
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[77] = _zz_dataMask_1;
    _zz_dataMask_1_1[76] = _zz_dataMask_1;
    _zz_dataMask_1_1[75] = _zz_dataMask_1;
    _zz_dataMask_1_1[74] = _zz_dataMask_1;
    _zz_dataMask_1_1[73] = _zz_dataMask_1;
    _zz_dataMask_1_1[72] = _zz_dataMask_1;
    _zz_dataMask_1_1[71] = _zz_dataMask_1;
    _zz_dataMask_1_1[70] = _zz_dataMask_1;
    _zz_dataMask_1_1[69] = _zz_dataMask_1;
    _zz_dataMask_1_1[68] = _zz_dataMask_1;
    _zz_dataMask_1_1[67] = _zz_dataMask_1;
    _zz_dataMask_1_1[66] = _zz_dataMask_1;
    _zz_dataMask_1_1[65] = _zz_dataMask_1;
    _zz_dataMask_1_1[64] = _zz_dataMask_1;
    _zz_dataMask_1_1[63] = _zz_dataMask_1;
    _zz_dataMask_1_1[62] = _zz_dataMask_1;
    _zz_dataMask_1_1[61] = _zz_dataMask_1;
    _zz_dataMask_1_1[60] = _zz_dataMask_1;
    _zz_dataMask_1_1[59] = _zz_dataMask_1;
    _zz_dataMask_1_1[58] = _zz_dataMask_1;
    _zz_dataMask_1_1[57] = _zz_dataMask_1;
    _zz_dataMask_1_1[56] = _zz_dataMask_1;
    _zz_dataMask_1_1[55] = _zz_dataMask_1;
    _zz_dataMask_1_1[54] = _zz_dataMask_1;
    _zz_dataMask_1_1[53] = _zz_dataMask_1;
    _zz_dataMask_1_1[52] = _zz_dataMask_1;
    _zz_dataMask_1_1[51] = _zz_dataMask_1;
    _zz_dataMask_1_1[50] = _zz_dataMask_1;
    _zz_dataMask_1_1[49] = _zz_dataMask_1;
    _zz_dataMask_1_1[48] = _zz_dataMask_1;
    _zz_dataMask_1_1[47] = _zz_dataMask_1;
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
    _zz_dataMask_2_1[77] = _zz_dataMask_2;
    _zz_dataMask_2_1[76] = _zz_dataMask_2;
    _zz_dataMask_2_1[75] = _zz_dataMask_2;
    _zz_dataMask_2_1[74] = _zz_dataMask_2;
    _zz_dataMask_2_1[73] = _zz_dataMask_2;
    _zz_dataMask_2_1[72] = _zz_dataMask_2;
    _zz_dataMask_2_1[71] = _zz_dataMask_2;
    _zz_dataMask_2_1[70] = _zz_dataMask_2;
    _zz_dataMask_2_1[69] = _zz_dataMask_2;
    _zz_dataMask_2_1[68] = _zz_dataMask_2;
    _zz_dataMask_2_1[67] = _zz_dataMask_2;
    _zz_dataMask_2_1[66] = _zz_dataMask_2;
    _zz_dataMask_2_1[65] = _zz_dataMask_2;
    _zz_dataMask_2_1[64] = _zz_dataMask_2;
    _zz_dataMask_2_1[63] = _zz_dataMask_2;
    _zz_dataMask_2_1[62] = _zz_dataMask_2;
    _zz_dataMask_2_1[61] = _zz_dataMask_2;
    _zz_dataMask_2_1[60] = _zz_dataMask_2;
    _zz_dataMask_2_1[59] = _zz_dataMask_2;
    _zz_dataMask_2_1[58] = _zz_dataMask_2;
    _zz_dataMask_2_1[57] = _zz_dataMask_2;
    _zz_dataMask_2_1[56] = _zz_dataMask_2;
    _zz_dataMask_2_1[55] = _zz_dataMask_2;
    _zz_dataMask_2_1[54] = _zz_dataMask_2;
    _zz_dataMask_2_1[53] = _zz_dataMask_2;
    _zz_dataMask_2_1[52] = _zz_dataMask_2;
    _zz_dataMask_2_1[51] = _zz_dataMask_2;
    _zz_dataMask_2_1[50] = _zz_dataMask_2;
    _zz_dataMask_2_1[49] = _zz_dataMask_2;
    _zz_dataMask_2_1[48] = _zz_dataMask_2;
    _zz_dataMask_2_1[47] = _zz_dataMask_2;
    _zz_dataMask_2_1[46] = _zz_dataMask_2;
    _zz_dataMask_2_1[45] = _zz_dataMask_2;
    _zz_dataMask_2_1[44] = _zz_dataMask_2;
    _zz_dataMask_2_1[43] = _zz_dataMask_2;
    _zz_dataMask_2_1[42] = _zz_dataMask_2;
    _zz_dataMask_2_1[41] = _zz_dataMask_2;
    _zz_dataMask_2_1[40] = _zz_dataMask_2;
    _zz_dataMask_2_1[39] = _zz_dataMask_2;
    _zz_dataMask_2_1[38] = _zz_dataMask_2;
    _zz_dataMask_2_1[37] = _zz_dataMask_2;
    _zz_dataMask_2_1[36] = _zz_dataMask_2;
    _zz_dataMask_2_1[35] = _zz_dataMask_2;
    _zz_dataMask_2_1[34] = _zz_dataMask_2;
    _zz_dataMask_2_1[33] = _zz_dataMask_2;
    _zz_dataMask_2_1[32] = _zz_dataMask_2;
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
  assign _zz_dataMask_3 = selOneHot[3];
  always @(*) begin
    _zz_dataMask_3_1[77] = _zz_dataMask_3;
    _zz_dataMask_3_1[76] = _zz_dataMask_3;
    _zz_dataMask_3_1[75] = _zz_dataMask_3;
    _zz_dataMask_3_1[74] = _zz_dataMask_3;
    _zz_dataMask_3_1[73] = _zz_dataMask_3;
    _zz_dataMask_3_1[72] = _zz_dataMask_3;
    _zz_dataMask_3_1[71] = _zz_dataMask_3;
    _zz_dataMask_3_1[70] = _zz_dataMask_3;
    _zz_dataMask_3_1[69] = _zz_dataMask_3;
    _zz_dataMask_3_1[68] = _zz_dataMask_3;
    _zz_dataMask_3_1[67] = _zz_dataMask_3;
    _zz_dataMask_3_1[66] = _zz_dataMask_3;
    _zz_dataMask_3_1[65] = _zz_dataMask_3;
    _zz_dataMask_3_1[64] = _zz_dataMask_3;
    _zz_dataMask_3_1[63] = _zz_dataMask_3;
    _zz_dataMask_3_1[62] = _zz_dataMask_3;
    _zz_dataMask_3_1[61] = _zz_dataMask_3;
    _zz_dataMask_3_1[60] = _zz_dataMask_3;
    _zz_dataMask_3_1[59] = _zz_dataMask_3;
    _zz_dataMask_3_1[58] = _zz_dataMask_3;
    _zz_dataMask_3_1[57] = _zz_dataMask_3;
    _zz_dataMask_3_1[56] = _zz_dataMask_3;
    _zz_dataMask_3_1[55] = _zz_dataMask_3;
    _zz_dataMask_3_1[54] = _zz_dataMask_3;
    _zz_dataMask_3_1[53] = _zz_dataMask_3;
    _zz_dataMask_3_1[52] = _zz_dataMask_3;
    _zz_dataMask_3_1[51] = _zz_dataMask_3;
    _zz_dataMask_3_1[50] = _zz_dataMask_3;
    _zz_dataMask_3_1[49] = _zz_dataMask_3;
    _zz_dataMask_3_1[48] = _zz_dataMask_3;
    _zz_dataMask_3_1[47] = _zz_dataMask_3;
    _zz_dataMask_3_1[46] = _zz_dataMask_3;
    _zz_dataMask_3_1[45] = _zz_dataMask_3;
    _zz_dataMask_3_1[44] = _zz_dataMask_3;
    _zz_dataMask_3_1[43] = _zz_dataMask_3;
    _zz_dataMask_3_1[42] = _zz_dataMask_3;
    _zz_dataMask_3_1[41] = _zz_dataMask_3;
    _zz_dataMask_3_1[40] = _zz_dataMask_3;
    _zz_dataMask_3_1[39] = _zz_dataMask_3;
    _zz_dataMask_3_1[38] = _zz_dataMask_3;
    _zz_dataMask_3_1[37] = _zz_dataMask_3;
    _zz_dataMask_3_1[36] = _zz_dataMask_3;
    _zz_dataMask_3_1[35] = _zz_dataMask_3;
    _zz_dataMask_3_1[34] = _zz_dataMask_3;
    _zz_dataMask_3_1[33] = _zz_dataMask_3;
    _zz_dataMask_3_1[32] = _zz_dataMask_3;
    _zz_dataMask_3_1[31] = _zz_dataMask_3;
    _zz_dataMask_3_1[30] = _zz_dataMask_3;
    _zz_dataMask_3_1[29] = _zz_dataMask_3;
    _zz_dataMask_3_1[28] = _zz_dataMask_3;
    _zz_dataMask_3_1[27] = _zz_dataMask_3;
    _zz_dataMask_3_1[26] = _zz_dataMask_3;
    _zz_dataMask_3_1[25] = _zz_dataMask_3;
    _zz_dataMask_3_1[24] = _zz_dataMask_3;
    _zz_dataMask_3_1[23] = _zz_dataMask_3;
    _zz_dataMask_3_1[22] = _zz_dataMask_3;
    _zz_dataMask_3_1[21] = _zz_dataMask_3;
    _zz_dataMask_3_1[20] = _zz_dataMask_3;
    _zz_dataMask_3_1[19] = _zz_dataMask_3;
    _zz_dataMask_3_1[18] = _zz_dataMask_3;
    _zz_dataMask_3_1[17] = _zz_dataMask_3;
    _zz_dataMask_3_1[16] = _zz_dataMask_3;
    _zz_dataMask_3_1[15] = _zz_dataMask_3;
    _zz_dataMask_3_1[14] = _zz_dataMask_3;
    _zz_dataMask_3_1[13] = _zz_dataMask_3;
    _zz_dataMask_3_1[12] = _zz_dataMask_3;
    _zz_dataMask_3_1[11] = _zz_dataMask_3;
    _zz_dataMask_3_1[10] = _zz_dataMask_3;
    _zz_dataMask_3_1[9] = _zz_dataMask_3;
    _zz_dataMask_3_1[8] = _zz_dataMask_3;
    _zz_dataMask_3_1[7] = _zz_dataMask_3;
    _zz_dataMask_3_1[6] = _zz_dataMask_3;
    _zz_dataMask_3_1[5] = _zz_dataMask_3;
    _zz_dataMask_3_1[4] = _zz_dataMask_3;
    _zz_dataMask_3_1[3] = _zz_dataMask_3;
    _zz_dataMask_3_1[2] = _zz_dataMask_3;
    _zz_dataMask_3_1[1] = _zz_dataMask_3;
    _zz_dataMask_3_1[0] = _zz_dataMask_3;
  end

  assign dataMask_3 = (_zz_dataMask_3_1 & dataIn_3);
  assign dataOut = (((dataMask_0 | dataMask_1) | dataMask_2) | dataMask_3);

endmodule

module rrArbiter_3 (
  input               grantsEnIn,
  input      [3:0]    reqsIn,
  output     [3:0]    grantsOut,
  output     [3:0]    selOneHotOut,
  input               yumIn,
  output     [1:0]    oneHotIndex,
  output              validOut,
  input               clk,
  input               resetn
);

  wire       [3:0]    reqsMask;
  reg        [3:0]    maskHigerReq;
  reg        [3:0]    unmaskHigerReq;
  wire       [3:0]    maskSelOneHot;
  wire       [3:0]    unMaskSelOneHot;
  wire                noReqMask;
  reg        [3:0]    pointerReg;
  wire       [3:0]    _zz_pointerReg;
  wire                when_nocDefines_l582;
  wire                when_nocDefines_l585;
  reg        [3:0]    _zz_selOneHotOut;
  reg        [3:0]    _zz_grantsOut;
  reg        [1:0]    oneHotIndex_0;
  reg        [1:0]    oneHotIndex_1;
  reg        [1:0]    oneHotIndex_2;
  reg        [1:0]    oneHotIndex_3;
  wire                when_nocDefines_l609;
  wire                when_nocDefines_l609_1;
  wire                when_nocDefines_l609_2;
  wire                when_nocDefines_l609_3;

  assign _zz_pointerReg[3 : 0] = 4'b1111;
  assign when_nocDefines_l582 = (|reqsMask);
  assign when_nocDefines_l585 = (|reqsIn);
  assign reqsMask = (reqsIn & pointerReg);
  always @(*) begin
    maskHigerReq[3 : 1] = (maskHigerReq[2 : 0] | reqsMask[2 : 0]);
    maskHigerReq[0] = 1'b0;
  end

  assign maskSelOneHot = (reqsMask & (~ maskHigerReq));
  always @(*) begin
    unmaskHigerReq[3 : 1] = (unmaskHigerReq[2 : 0] | reqsIn[2 : 0]);
    unmaskHigerReq[0] = 1'b0;
  end

  assign unMaskSelOneHot = (reqsIn & (~ unmaskHigerReq));
  assign noReqMask = (! (|reqsMask));
  always @(*) begin
    _zz_selOneHotOut[3] = noReqMask;
    _zz_selOneHotOut[2] = noReqMask;
    _zz_selOneHotOut[1] = noReqMask;
    _zz_selOneHotOut[0] = noReqMask;
  end

  assign selOneHotOut = ((_zz_selOneHotOut & unMaskSelOneHot) | maskSelOneHot);
  always @(*) begin
    _zz_grantsOut[3] = grantsEnIn;
    _zz_grantsOut[2] = grantsEnIn;
    _zz_grantsOut[1] = grantsEnIn;
    _zz_grantsOut[0] = grantsEnIn;
  end

  assign grantsOut = (_zz_grantsOut & selOneHotOut);
  assign validOut = (|reqsIn);
  assign when_nocDefines_l609 = selOneHotOut[0];
  always @(*) begin
    if(when_nocDefines_l609) begin
      oneHotIndex_0 = 2'b00;
    end else begin
      oneHotIndex_0 = 2'b00;
    end
  end

  assign when_nocDefines_l609_1 = selOneHotOut[1];
  always @(*) begin
    if(when_nocDefines_l609_1) begin
      oneHotIndex_1 = 2'b01;
    end else begin
      oneHotIndex_1 = 2'b00;
    end
  end

  assign when_nocDefines_l609_2 = selOneHotOut[2];
  always @(*) begin
    if(when_nocDefines_l609_2) begin
      oneHotIndex_2 = 2'b10;
    end else begin
      oneHotIndex_2 = 2'b00;
    end
  end

  assign when_nocDefines_l609_3 = selOneHotOut[3];
  always @(*) begin
    if(when_nocDefines_l609_3) begin
      oneHotIndex_3 = 2'b11;
    end else begin
      oneHotIndex_3 = 2'b00;
    end
  end

  assign oneHotIndex = (((oneHotIndex_0 | oneHotIndex_1) | oneHotIndex_2) | oneHotIndex_3);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pointerReg <= _zz_pointerReg;
    end else begin
      if(when_nocDefines_l582) begin
        pointerReg <= maskHigerReq;
      end else begin
        if(when_nocDefines_l585) begin
          pointerReg <= unmaskHigerReq;
        end else begin
          pointerReg <= pointerReg;
        end
      end
    end
  end


endmodule

//muxOneHot_1 replaced by muxOneHot_1

//rrArbiter_1 replaced by rrArbiter_1

module muxOneHot_1 (
  input      [77:0]   dataIn_0,
  input      [77:0]   dataIn_1,
  input      [1:0]    selOneHot,
  output     [77:0]   dataOut
);

  wire       [77:0]   dataMask_0;
  wire       [77:0]   dataMask_1;
  wire                _zz_dataMask_0;
  reg        [77:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [77:0]   _zz_dataMask_1_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[77] = _zz_dataMask_0;
    _zz_dataMask_0_1[76] = _zz_dataMask_0;
    _zz_dataMask_0_1[75] = _zz_dataMask_0;
    _zz_dataMask_0_1[74] = _zz_dataMask_0;
    _zz_dataMask_0_1[73] = _zz_dataMask_0;
    _zz_dataMask_0_1[72] = _zz_dataMask_0;
    _zz_dataMask_0_1[71] = _zz_dataMask_0;
    _zz_dataMask_0_1[70] = _zz_dataMask_0;
    _zz_dataMask_0_1[69] = _zz_dataMask_0;
    _zz_dataMask_0_1[68] = _zz_dataMask_0;
    _zz_dataMask_0_1[67] = _zz_dataMask_0;
    _zz_dataMask_0_1[66] = _zz_dataMask_0;
    _zz_dataMask_0_1[65] = _zz_dataMask_0;
    _zz_dataMask_0_1[64] = _zz_dataMask_0;
    _zz_dataMask_0_1[63] = _zz_dataMask_0;
    _zz_dataMask_0_1[62] = _zz_dataMask_0;
    _zz_dataMask_0_1[61] = _zz_dataMask_0;
    _zz_dataMask_0_1[60] = _zz_dataMask_0;
    _zz_dataMask_0_1[59] = _zz_dataMask_0;
    _zz_dataMask_0_1[58] = _zz_dataMask_0;
    _zz_dataMask_0_1[57] = _zz_dataMask_0;
    _zz_dataMask_0_1[56] = _zz_dataMask_0;
    _zz_dataMask_0_1[55] = _zz_dataMask_0;
    _zz_dataMask_0_1[54] = _zz_dataMask_0;
    _zz_dataMask_0_1[53] = _zz_dataMask_0;
    _zz_dataMask_0_1[52] = _zz_dataMask_0;
    _zz_dataMask_0_1[51] = _zz_dataMask_0;
    _zz_dataMask_0_1[50] = _zz_dataMask_0;
    _zz_dataMask_0_1[49] = _zz_dataMask_0;
    _zz_dataMask_0_1[48] = _zz_dataMask_0;
    _zz_dataMask_0_1[47] = _zz_dataMask_0;
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[77] = _zz_dataMask_1;
    _zz_dataMask_1_1[76] = _zz_dataMask_1;
    _zz_dataMask_1_1[75] = _zz_dataMask_1;
    _zz_dataMask_1_1[74] = _zz_dataMask_1;
    _zz_dataMask_1_1[73] = _zz_dataMask_1;
    _zz_dataMask_1_1[72] = _zz_dataMask_1;
    _zz_dataMask_1_1[71] = _zz_dataMask_1;
    _zz_dataMask_1_1[70] = _zz_dataMask_1;
    _zz_dataMask_1_1[69] = _zz_dataMask_1;
    _zz_dataMask_1_1[68] = _zz_dataMask_1;
    _zz_dataMask_1_1[67] = _zz_dataMask_1;
    _zz_dataMask_1_1[66] = _zz_dataMask_1;
    _zz_dataMask_1_1[65] = _zz_dataMask_1;
    _zz_dataMask_1_1[64] = _zz_dataMask_1;
    _zz_dataMask_1_1[63] = _zz_dataMask_1;
    _zz_dataMask_1_1[62] = _zz_dataMask_1;
    _zz_dataMask_1_1[61] = _zz_dataMask_1;
    _zz_dataMask_1_1[60] = _zz_dataMask_1;
    _zz_dataMask_1_1[59] = _zz_dataMask_1;
    _zz_dataMask_1_1[58] = _zz_dataMask_1;
    _zz_dataMask_1_1[57] = _zz_dataMask_1;
    _zz_dataMask_1_1[56] = _zz_dataMask_1;
    _zz_dataMask_1_1[55] = _zz_dataMask_1;
    _zz_dataMask_1_1[54] = _zz_dataMask_1;
    _zz_dataMask_1_1[53] = _zz_dataMask_1;
    _zz_dataMask_1_1[52] = _zz_dataMask_1;
    _zz_dataMask_1_1[51] = _zz_dataMask_1;
    _zz_dataMask_1_1[50] = _zz_dataMask_1;
    _zz_dataMask_1_1[49] = _zz_dataMask_1;
    _zz_dataMask_1_1[48] = _zz_dataMask_1;
    _zz_dataMask_1_1[47] = _zz_dataMask_1;
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
  assign dataOut = (dataMask_0 | dataMask_1);

endmodule

module rrArbiter_1 (
  input               grantsEnIn,
  input      [1:0]    reqsIn,
  output     [1:0]    grantsOut,
  output     [1:0]    selOneHotOut,
  input               yumIn,
  output     [0:0]    oneHotIndex,
  output              validOut,
  input               clk,
  input               resetn
);

  wire       [1:0]    reqsMask;
  reg        [1:0]    maskHigerReq;
  reg        [1:0]    unmaskHigerReq;
  wire       [1:0]    maskSelOneHot;
  wire       [1:0]    unMaskSelOneHot;
  wire                noReqMask;
  reg        [1:0]    pointerReg;
  wire       [1:0]    _zz_pointerReg;
  wire                when_nocDefines_l582;
  wire                when_nocDefines_l585;
  reg        [1:0]    _zz_selOneHotOut;
  reg        [1:0]    _zz_grantsOut;
  reg        [0:0]    oneHotIndex_0;
  reg        [0:0]    oneHotIndex_1;
  wire                when_nocDefines_l609;
  wire                when_nocDefines_l609_1;

  assign _zz_pointerReg[1 : 0] = 2'b11;
  assign when_nocDefines_l582 = (|reqsMask);
  assign when_nocDefines_l585 = (|reqsIn);
  assign reqsMask = (reqsIn & pointerReg);
  always @(*) begin
    maskHigerReq[1 : 1] = (maskHigerReq[0 : 0] | reqsMask[0 : 0]);
    maskHigerReq[0] = 1'b0;
  end

  assign maskSelOneHot = (reqsMask & (~ maskHigerReq));
  always @(*) begin
    unmaskHigerReq[1 : 1] = (unmaskHigerReq[0 : 0] | reqsIn[0 : 0]);
    unmaskHigerReq[0] = 1'b0;
  end

  assign unMaskSelOneHot = (reqsIn & (~ unmaskHigerReq));
  assign noReqMask = (! (|reqsMask));
  always @(*) begin
    _zz_selOneHotOut[1] = noReqMask;
    _zz_selOneHotOut[0] = noReqMask;
  end

  assign selOneHotOut = ((_zz_selOneHotOut & unMaskSelOneHot) | maskSelOneHot);
  always @(*) begin
    _zz_grantsOut[1] = grantsEnIn;
    _zz_grantsOut[0] = grantsEnIn;
  end

  assign grantsOut = (_zz_grantsOut & selOneHotOut);
  assign validOut = (|reqsIn);
  assign when_nocDefines_l609 = selOneHotOut[0];
  always @(*) begin
    if(when_nocDefines_l609) begin
      oneHotIndex_0 = 1'b0;
    end else begin
      oneHotIndex_0 = 1'b0;
    end
  end

  assign when_nocDefines_l609_1 = selOneHotOut[1];
  always @(*) begin
    if(when_nocDefines_l609_1) begin
      oneHotIndex_1 = 1'b1;
    end else begin
      oneHotIndex_1 = 1'b0;
    end
  end

  assign oneHotIndex = (oneHotIndex_0 | oneHotIndex_1);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pointerReg <= _zz_pointerReg;
    end else begin
      if(when_nocDefines_l582) begin
        pointerReg <= maskHigerReq;
      end else begin
        if(when_nocDefines_l585) begin
          pointerReg <= unmaskHigerReq;
        end else begin
          pointerReg <= pointerReg;
        end
      end
    end
  end


endmodule

module muxOneHot (
  input      [77:0]   dataIn_0,
  input      [77:0]   dataIn_1,
  input      [77:0]   dataIn_2,
  input      [77:0]   dataIn_3,
  input      [77:0]   dataIn_4,
  input      [4:0]    selOneHot,
  output     [77:0]   dataOut
);

  wire       [77:0]   dataMask_0;
  wire       [77:0]   dataMask_1;
  wire       [77:0]   dataMask_2;
  wire       [77:0]   dataMask_3;
  wire       [77:0]   dataMask_4;
  wire                _zz_dataMask_0;
  reg        [77:0]   _zz_dataMask_0_1;
  wire                _zz_dataMask_1;
  reg        [77:0]   _zz_dataMask_1_1;
  wire                _zz_dataMask_2;
  reg        [77:0]   _zz_dataMask_2_1;
  wire                _zz_dataMask_3;
  reg        [77:0]   _zz_dataMask_3_1;
  wire                _zz_dataMask_4;
  reg        [77:0]   _zz_dataMask_4_1;

  assign _zz_dataMask_0 = selOneHot[0];
  always @(*) begin
    _zz_dataMask_0_1[77] = _zz_dataMask_0;
    _zz_dataMask_0_1[76] = _zz_dataMask_0;
    _zz_dataMask_0_1[75] = _zz_dataMask_0;
    _zz_dataMask_0_1[74] = _zz_dataMask_0;
    _zz_dataMask_0_1[73] = _zz_dataMask_0;
    _zz_dataMask_0_1[72] = _zz_dataMask_0;
    _zz_dataMask_0_1[71] = _zz_dataMask_0;
    _zz_dataMask_0_1[70] = _zz_dataMask_0;
    _zz_dataMask_0_1[69] = _zz_dataMask_0;
    _zz_dataMask_0_1[68] = _zz_dataMask_0;
    _zz_dataMask_0_1[67] = _zz_dataMask_0;
    _zz_dataMask_0_1[66] = _zz_dataMask_0;
    _zz_dataMask_0_1[65] = _zz_dataMask_0;
    _zz_dataMask_0_1[64] = _zz_dataMask_0;
    _zz_dataMask_0_1[63] = _zz_dataMask_0;
    _zz_dataMask_0_1[62] = _zz_dataMask_0;
    _zz_dataMask_0_1[61] = _zz_dataMask_0;
    _zz_dataMask_0_1[60] = _zz_dataMask_0;
    _zz_dataMask_0_1[59] = _zz_dataMask_0;
    _zz_dataMask_0_1[58] = _zz_dataMask_0;
    _zz_dataMask_0_1[57] = _zz_dataMask_0;
    _zz_dataMask_0_1[56] = _zz_dataMask_0;
    _zz_dataMask_0_1[55] = _zz_dataMask_0;
    _zz_dataMask_0_1[54] = _zz_dataMask_0;
    _zz_dataMask_0_1[53] = _zz_dataMask_0;
    _zz_dataMask_0_1[52] = _zz_dataMask_0;
    _zz_dataMask_0_1[51] = _zz_dataMask_0;
    _zz_dataMask_0_1[50] = _zz_dataMask_0;
    _zz_dataMask_0_1[49] = _zz_dataMask_0;
    _zz_dataMask_0_1[48] = _zz_dataMask_0;
    _zz_dataMask_0_1[47] = _zz_dataMask_0;
    _zz_dataMask_0_1[46] = _zz_dataMask_0;
    _zz_dataMask_0_1[45] = _zz_dataMask_0;
    _zz_dataMask_0_1[44] = _zz_dataMask_0;
    _zz_dataMask_0_1[43] = _zz_dataMask_0;
    _zz_dataMask_0_1[42] = _zz_dataMask_0;
    _zz_dataMask_0_1[41] = _zz_dataMask_0;
    _zz_dataMask_0_1[40] = _zz_dataMask_0;
    _zz_dataMask_0_1[39] = _zz_dataMask_0;
    _zz_dataMask_0_1[38] = _zz_dataMask_0;
    _zz_dataMask_0_1[37] = _zz_dataMask_0;
    _zz_dataMask_0_1[36] = _zz_dataMask_0;
    _zz_dataMask_0_1[35] = _zz_dataMask_0;
    _zz_dataMask_0_1[34] = _zz_dataMask_0;
    _zz_dataMask_0_1[33] = _zz_dataMask_0;
    _zz_dataMask_0_1[32] = _zz_dataMask_0;
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
    _zz_dataMask_1_1[77] = _zz_dataMask_1;
    _zz_dataMask_1_1[76] = _zz_dataMask_1;
    _zz_dataMask_1_1[75] = _zz_dataMask_1;
    _zz_dataMask_1_1[74] = _zz_dataMask_1;
    _zz_dataMask_1_1[73] = _zz_dataMask_1;
    _zz_dataMask_1_1[72] = _zz_dataMask_1;
    _zz_dataMask_1_1[71] = _zz_dataMask_1;
    _zz_dataMask_1_1[70] = _zz_dataMask_1;
    _zz_dataMask_1_1[69] = _zz_dataMask_1;
    _zz_dataMask_1_1[68] = _zz_dataMask_1;
    _zz_dataMask_1_1[67] = _zz_dataMask_1;
    _zz_dataMask_1_1[66] = _zz_dataMask_1;
    _zz_dataMask_1_1[65] = _zz_dataMask_1;
    _zz_dataMask_1_1[64] = _zz_dataMask_1;
    _zz_dataMask_1_1[63] = _zz_dataMask_1;
    _zz_dataMask_1_1[62] = _zz_dataMask_1;
    _zz_dataMask_1_1[61] = _zz_dataMask_1;
    _zz_dataMask_1_1[60] = _zz_dataMask_1;
    _zz_dataMask_1_1[59] = _zz_dataMask_1;
    _zz_dataMask_1_1[58] = _zz_dataMask_1;
    _zz_dataMask_1_1[57] = _zz_dataMask_1;
    _zz_dataMask_1_1[56] = _zz_dataMask_1;
    _zz_dataMask_1_1[55] = _zz_dataMask_1;
    _zz_dataMask_1_1[54] = _zz_dataMask_1;
    _zz_dataMask_1_1[53] = _zz_dataMask_1;
    _zz_dataMask_1_1[52] = _zz_dataMask_1;
    _zz_dataMask_1_1[51] = _zz_dataMask_1;
    _zz_dataMask_1_1[50] = _zz_dataMask_1;
    _zz_dataMask_1_1[49] = _zz_dataMask_1;
    _zz_dataMask_1_1[48] = _zz_dataMask_1;
    _zz_dataMask_1_1[47] = _zz_dataMask_1;
    _zz_dataMask_1_1[46] = _zz_dataMask_1;
    _zz_dataMask_1_1[45] = _zz_dataMask_1;
    _zz_dataMask_1_1[44] = _zz_dataMask_1;
    _zz_dataMask_1_1[43] = _zz_dataMask_1;
    _zz_dataMask_1_1[42] = _zz_dataMask_1;
    _zz_dataMask_1_1[41] = _zz_dataMask_1;
    _zz_dataMask_1_1[40] = _zz_dataMask_1;
    _zz_dataMask_1_1[39] = _zz_dataMask_1;
    _zz_dataMask_1_1[38] = _zz_dataMask_1;
    _zz_dataMask_1_1[37] = _zz_dataMask_1;
    _zz_dataMask_1_1[36] = _zz_dataMask_1;
    _zz_dataMask_1_1[35] = _zz_dataMask_1;
    _zz_dataMask_1_1[34] = _zz_dataMask_1;
    _zz_dataMask_1_1[33] = _zz_dataMask_1;
    _zz_dataMask_1_1[32] = _zz_dataMask_1;
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
    _zz_dataMask_2_1[77] = _zz_dataMask_2;
    _zz_dataMask_2_1[76] = _zz_dataMask_2;
    _zz_dataMask_2_1[75] = _zz_dataMask_2;
    _zz_dataMask_2_1[74] = _zz_dataMask_2;
    _zz_dataMask_2_1[73] = _zz_dataMask_2;
    _zz_dataMask_2_1[72] = _zz_dataMask_2;
    _zz_dataMask_2_1[71] = _zz_dataMask_2;
    _zz_dataMask_2_1[70] = _zz_dataMask_2;
    _zz_dataMask_2_1[69] = _zz_dataMask_2;
    _zz_dataMask_2_1[68] = _zz_dataMask_2;
    _zz_dataMask_2_1[67] = _zz_dataMask_2;
    _zz_dataMask_2_1[66] = _zz_dataMask_2;
    _zz_dataMask_2_1[65] = _zz_dataMask_2;
    _zz_dataMask_2_1[64] = _zz_dataMask_2;
    _zz_dataMask_2_1[63] = _zz_dataMask_2;
    _zz_dataMask_2_1[62] = _zz_dataMask_2;
    _zz_dataMask_2_1[61] = _zz_dataMask_2;
    _zz_dataMask_2_1[60] = _zz_dataMask_2;
    _zz_dataMask_2_1[59] = _zz_dataMask_2;
    _zz_dataMask_2_1[58] = _zz_dataMask_2;
    _zz_dataMask_2_1[57] = _zz_dataMask_2;
    _zz_dataMask_2_1[56] = _zz_dataMask_2;
    _zz_dataMask_2_1[55] = _zz_dataMask_2;
    _zz_dataMask_2_1[54] = _zz_dataMask_2;
    _zz_dataMask_2_1[53] = _zz_dataMask_2;
    _zz_dataMask_2_1[52] = _zz_dataMask_2;
    _zz_dataMask_2_1[51] = _zz_dataMask_2;
    _zz_dataMask_2_1[50] = _zz_dataMask_2;
    _zz_dataMask_2_1[49] = _zz_dataMask_2;
    _zz_dataMask_2_1[48] = _zz_dataMask_2;
    _zz_dataMask_2_1[47] = _zz_dataMask_2;
    _zz_dataMask_2_1[46] = _zz_dataMask_2;
    _zz_dataMask_2_1[45] = _zz_dataMask_2;
    _zz_dataMask_2_1[44] = _zz_dataMask_2;
    _zz_dataMask_2_1[43] = _zz_dataMask_2;
    _zz_dataMask_2_1[42] = _zz_dataMask_2;
    _zz_dataMask_2_1[41] = _zz_dataMask_2;
    _zz_dataMask_2_1[40] = _zz_dataMask_2;
    _zz_dataMask_2_1[39] = _zz_dataMask_2;
    _zz_dataMask_2_1[38] = _zz_dataMask_2;
    _zz_dataMask_2_1[37] = _zz_dataMask_2;
    _zz_dataMask_2_1[36] = _zz_dataMask_2;
    _zz_dataMask_2_1[35] = _zz_dataMask_2;
    _zz_dataMask_2_1[34] = _zz_dataMask_2;
    _zz_dataMask_2_1[33] = _zz_dataMask_2;
    _zz_dataMask_2_1[32] = _zz_dataMask_2;
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
  assign _zz_dataMask_3 = selOneHot[3];
  always @(*) begin
    _zz_dataMask_3_1[77] = _zz_dataMask_3;
    _zz_dataMask_3_1[76] = _zz_dataMask_3;
    _zz_dataMask_3_1[75] = _zz_dataMask_3;
    _zz_dataMask_3_1[74] = _zz_dataMask_3;
    _zz_dataMask_3_1[73] = _zz_dataMask_3;
    _zz_dataMask_3_1[72] = _zz_dataMask_3;
    _zz_dataMask_3_1[71] = _zz_dataMask_3;
    _zz_dataMask_3_1[70] = _zz_dataMask_3;
    _zz_dataMask_3_1[69] = _zz_dataMask_3;
    _zz_dataMask_3_1[68] = _zz_dataMask_3;
    _zz_dataMask_3_1[67] = _zz_dataMask_3;
    _zz_dataMask_3_1[66] = _zz_dataMask_3;
    _zz_dataMask_3_1[65] = _zz_dataMask_3;
    _zz_dataMask_3_1[64] = _zz_dataMask_3;
    _zz_dataMask_3_1[63] = _zz_dataMask_3;
    _zz_dataMask_3_1[62] = _zz_dataMask_3;
    _zz_dataMask_3_1[61] = _zz_dataMask_3;
    _zz_dataMask_3_1[60] = _zz_dataMask_3;
    _zz_dataMask_3_1[59] = _zz_dataMask_3;
    _zz_dataMask_3_1[58] = _zz_dataMask_3;
    _zz_dataMask_3_1[57] = _zz_dataMask_3;
    _zz_dataMask_3_1[56] = _zz_dataMask_3;
    _zz_dataMask_3_1[55] = _zz_dataMask_3;
    _zz_dataMask_3_1[54] = _zz_dataMask_3;
    _zz_dataMask_3_1[53] = _zz_dataMask_3;
    _zz_dataMask_3_1[52] = _zz_dataMask_3;
    _zz_dataMask_3_1[51] = _zz_dataMask_3;
    _zz_dataMask_3_1[50] = _zz_dataMask_3;
    _zz_dataMask_3_1[49] = _zz_dataMask_3;
    _zz_dataMask_3_1[48] = _zz_dataMask_3;
    _zz_dataMask_3_1[47] = _zz_dataMask_3;
    _zz_dataMask_3_1[46] = _zz_dataMask_3;
    _zz_dataMask_3_1[45] = _zz_dataMask_3;
    _zz_dataMask_3_1[44] = _zz_dataMask_3;
    _zz_dataMask_3_1[43] = _zz_dataMask_3;
    _zz_dataMask_3_1[42] = _zz_dataMask_3;
    _zz_dataMask_3_1[41] = _zz_dataMask_3;
    _zz_dataMask_3_1[40] = _zz_dataMask_3;
    _zz_dataMask_3_1[39] = _zz_dataMask_3;
    _zz_dataMask_3_1[38] = _zz_dataMask_3;
    _zz_dataMask_3_1[37] = _zz_dataMask_3;
    _zz_dataMask_3_1[36] = _zz_dataMask_3;
    _zz_dataMask_3_1[35] = _zz_dataMask_3;
    _zz_dataMask_3_1[34] = _zz_dataMask_3;
    _zz_dataMask_3_1[33] = _zz_dataMask_3;
    _zz_dataMask_3_1[32] = _zz_dataMask_3;
    _zz_dataMask_3_1[31] = _zz_dataMask_3;
    _zz_dataMask_3_1[30] = _zz_dataMask_3;
    _zz_dataMask_3_1[29] = _zz_dataMask_3;
    _zz_dataMask_3_1[28] = _zz_dataMask_3;
    _zz_dataMask_3_1[27] = _zz_dataMask_3;
    _zz_dataMask_3_1[26] = _zz_dataMask_3;
    _zz_dataMask_3_1[25] = _zz_dataMask_3;
    _zz_dataMask_3_1[24] = _zz_dataMask_3;
    _zz_dataMask_3_1[23] = _zz_dataMask_3;
    _zz_dataMask_3_1[22] = _zz_dataMask_3;
    _zz_dataMask_3_1[21] = _zz_dataMask_3;
    _zz_dataMask_3_1[20] = _zz_dataMask_3;
    _zz_dataMask_3_1[19] = _zz_dataMask_3;
    _zz_dataMask_3_1[18] = _zz_dataMask_3;
    _zz_dataMask_3_1[17] = _zz_dataMask_3;
    _zz_dataMask_3_1[16] = _zz_dataMask_3;
    _zz_dataMask_3_1[15] = _zz_dataMask_3;
    _zz_dataMask_3_1[14] = _zz_dataMask_3;
    _zz_dataMask_3_1[13] = _zz_dataMask_3;
    _zz_dataMask_3_1[12] = _zz_dataMask_3;
    _zz_dataMask_3_1[11] = _zz_dataMask_3;
    _zz_dataMask_3_1[10] = _zz_dataMask_3;
    _zz_dataMask_3_1[9] = _zz_dataMask_3;
    _zz_dataMask_3_1[8] = _zz_dataMask_3;
    _zz_dataMask_3_1[7] = _zz_dataMask_3;
    _zz_dataMask_3_1[6] = _zz_dataMask_3;
    _zz_dataMask_3_1[5] = _zz_dataMask_3;
    _zz_dataMask_3_1[4] = _zz_dataMask_3;
    _zz_dataMask_3_1[3] = _zz_dataMask_3;
    _zz_dataMask_3_1[2] = _zz_dataMask_3;
    _zz_dataMask_3_1[1] = _zz_dataMask_3;
    _zz_dataMask_3_1[0] = _zz_dataMask_3;
  end

  assign dataMask_3 = (_zz_dataMask_3_1 & dataIn_3);
  assign _zz_dataMask_4 = selOneHot[4];
  always @(*) begin
    _zz_dataMask_4_1[77] = _zz_dataMask_4;
    _zz_dataMask_4_1[76] = _zz_dataMask_4;
    _zz_dataMask_4_1[75] = _zz_dataMask_4;
    _zz_dataMask_4_1[74] = _zz_dataMask_4;
    _zz_dataMask_4_1[73] = _zz_dataMask_4;
    _zz_dataMask_4_1[72] = _zz_dataMask_4;
    _zz_dataMask_4_1[71] = _zz_dataMask_4;
    _zz_dataMask_4_1[70] = _zz_dataMask_4;
    _zz_dataMask_4_1[69] = _zz_dataMask_4;
    _zz_dataMask_4_1[68] = _zz_dataMask_4;
    _zz_dataMask_4_1[67] = _zz_dataMask_4;
    _zz_dataMask_4_1[66] = _zz_dataMask_4;
    _zz_dataMask_4_1[65] = _zz_dataMask_4;
    _zz_dataMask_4_1[64] = _zz_dataMask_4;
    _zz_dataMask_4_1[63] = _zz_dataMask_4;
    _zz_dataMask_4_1[62] = _zz_dataMask_4;
    _zz_dataMask_4_1[61] = _zz_dataMask_4;
    _zz_dataMask_4_1[60] = _zz_dataMask_4;
    _zz_dataMask_4_1[59] = _zz_dataMask_4;
    _zz_dataMask_4_1[58] = _zz_dataMask_4;
    _zz_dataMask_4_1[57] = _zz_dataMask_4;
    _zz_dataMask_4_1[56] = _zz_dataMask_4;
    _zz_dataMask_4_1[55] = _zz_dataMask_4;
    _zz_dataMask_4_1[54] = _zz_dataMask_4;
    _zz_dataMask_4_1[53] = _zz_dataMask_4;
    _zz_dataMask_4_1[52] = _zz_dataMask_4;
    _zz_dataMask_4_1[51] = _zz_dataMask_4;
    _zz_dataMask_4_1[50] = _zz_dataMask_4;
    _zz_dataMask_4_1[49] = _zz_dataMask_4;
    _zz_dataMask_4_1[48] = _zz_dataMask_4;
    _zz_dataMask_4_1[47] = _zz_dataMask_4;
    _zz_dataMask_4_1[46] = _zz_dataMask_4;
    _zz_dataMask_4_1[45] = _zz_dataMask_4;
    _zz_dataMask_4_1[44] = _zz_dataMask_4;
    _zz_dataMask_4_1[43] = _zz_dataMask_4;
    _zz_dataMask_4_1[42] = _zz_dataMask_4;
    _zz_dataMask_4_1[41] = _zz_dataMask_4;
    _zz_dataMask_4_1[40] = _zz_dataMask_4;
    _zz_dataMask_4_1[39] = _zz_dataMask_4;
    _zz_dataMask_4_1[38] = _zz_dataMask_4;
    _zz_dataMask_4_1[37] = _zz_dataMask_4;
    _zz_dataMask_4_1[36] = _zz_dataMask_4;
    _zz_dataMask_4_1[35] = _zz_dataMask_4;
    _zz_dataMask_4_1[34] = _zz_dataMask_4;
    _zz_dataMask_4_1[33] = _zz_dataMask_4;
    _zz_dataMask_4_1[32] = _zz_dataMask_4;
    _zz_dataMask_4_1[31] = _zz_dataMask_4;
    _zz_dataMask_4_1[30] = _zz_dataMask_4;
    _zz_dataMask_4_1[29] = _zz_dataMask_4;
    _zz_dataMask_4_1[28] = _zz_dataMask_4;
    _zz_dataMask_4_1[27] = _zz_dataMask_4;
    _zz_dataMask_4_1[26] = _zz_dataMask_4;
    _zz_dataMask_4_1[25] = _zz_dataMask_4;
    _zz_dataMask_4_1[24] = _zz_dataMask_4;
    _zz_dataMask_4_1[23] = _zz_dataMask_4;
    _zz_dataMask_4_1[22] = _zz_dataMask_4;
    _zz_dataMask_4_1[21] = _zz_dataMask_4;
    _zz_dataMask_4_1[20] = _zz_dataMask_4;
    _zz_dataMask_4_1[19] = _zz_dataMask_4;
    _zz_dataMask_4_1[18] = _zz_dataMask_4;
    _zz_dataMask_4_1[17] = _zz_dataMask_4;
    _zz_dataMask_4_1[16] = _zz_dataMask_4;
    _zz_dataMask_4_1[15] = _zz_dataMask_4;
    _zz_dataMask_4_1[14] = _zz_dataMask_4;
    _zz_dataMask_4_1[13] = _zz_dataMask_4;
    _zz_dataMask_4_1[12] = _zz_dataMask_4;
    _zz_dataMask_4_1[11] = _zz_dataMask_4;
    _zz_dataMask_4_1[10] = _zz_dataMask_4;
    _zz_dataMask_4_1[9] = _zz_dataMask_4;
    _zz_dataMask_4_1[8] = _zz_dataMask_4;
    _zz_dataMask_4_1[7] = _zz_dataMask_4;
    _zz_dataMask_4_1[6] = _zz_dataMask_4;
    _zz_dataMask_4_1[5] = _zz_dataMask_4;
    _zz_dataMask_4_1[4] = _zz_dataMask_4;
    _zz_dataMask_4_1[3] = _zz_dataMask_4;
    _zz_dataMask_4_1[2] = _zz_dataMask_4;
    _zz_dataMask_4_1[1] = _zz_dataMask_4;
    _zz_dataMask_4_1[0] = _zz_dataMask_4;
  end

  assign dataMask_4 = (_zz_dataMask_4_1 & dataIn_4);
  assign dataOut = ((((dataMask_0 | dataMask_1) | dataMask_2) | dataMask_3) | dataMask_4);

endmodule

module rrArbiter (
  input               grantsEnIn,
  input      [4:0]    reqsIn,
  output     [4:0]    grantsOut,
  output     [4:0]    selOneHotOut,
  input               yumIn,
  output     [2:0]    oneHotIndex,
  output              validOut,
  input               clk,
  input               resetn
);

  wire       [4:0]    reqsMask;
  reg        [4:0]    maskHigerReq;
  reg        [4:0]    unmaskHigerReq;
  wire       [4:0]    maskSelOneHot;
  wire       [4:0]    unMaskSelOneHot;
  wire                noReqMask;
  reg        [4:0]    pointerReg;
  wire       [4:0]    _zz_pointerReg;
  wire                when_nocDefines_l582;
  wire                when_nocDefines_l585;
  reg        [4:0]    _zz_selOneHotOut;
  reg        [4:0]    _zz_grantsOut;
  reg        [2:0]    oneHotIndex_0;
  reg        [2:0]    oneHotIndex_1;
  reg        [2:0]    oneHotIndex_2;
  reg        [2:0]    oneHotIndex_3;
  reg        [2:0]    oneHotIndex_4;
  wire                when_nocDefines_l609;
  wire                when_nocDefines_l609_1;
  wire                when_nocDefines_l609_2;
  wire                when_nocDefines_l609_3;
  wire                when_nocDefines_l609_4;

  assign _zz_pointerReg[4 : 0] = 5'h1f;
  assign when_nocDefines_l582 = (|reqsMask);
  assign when_nocDefines_l585 = (|reqsIn);
  assign reqsMask = (reqsIn & pointerReg);
  always @(*) begin
    maskHigerReq[4 : 1] = (maskHigerReq[3 : 0] | reqsMask[3 : 0]);
    maskHigerReq[0] = 1'b0;
  end

  assign maskSelOneHot = (reqsMask & (~ maskHigerReq));
  always @(*) begin
    unmaskHigerReq[4 : 1] = (unmaskHigerReq[3 : 0] | reqsIn[3 : 0]);
    unmaskHigerReq[0] = 1'b0;
  end

  assign unMaskSelOneHot = (reqsIn & (~ unmaskHigerReq));
  assign noReqMask = (! (|reqsMask));
  always @(*) begin
    _zz_selOneHotOut[4] = noReqMask;
    _zz_selOneHotOut[3] = noReqMask;
    _zz_selOneHotOut[2] = noReqMask;
    _zz_selOneHotOut[1] = noReqMask;
    _zz_selOneHotOut[0] = noReqMask;
  end

  assign selOneHotOut = ((_zz_selOneHotOut & unMaskSelOneHot) | maskSelOneHot);
  always @(*) begin
    _zz_grantsOut[4] = grantsEnIn;
    _zz_grantsOut[3] = grantsEnIn;
    _zz_grantsOut[2] = grantsEnIn;
    _zz_grantsOut[1] = grantsEnIn;
    _zz_grantsOut[0] = grantsEnIn;
  end

  assign grantsOut = (_zz_grantsOut & selOneHotOut);
  assign validOut = (|reqsIn);
  assign when_nocDefines_l609 = selOneHotOut[0];
  always @(*) begin
    if(when_nocDefines_l609) begin
      oneHotIndex_0 = 3'b000;
    end else begin
      oneHotIndex_0 = 3'b000;
    end
  end

  assign when_nocDefines_l609_1 = selOneHotOut[1];
  always @(*) begin
    if(when_nocDefines_l609_1) begin
      oneHotIndex_1 = 3'b001;
    end else begin
      oneHotIndex_1 = 3'b000;
    end
  end

  assign when_nocDefines_l609_2 = selOneHotOut[2];
  always @(*) begin
    if(when_nocDefines_l609_2) begin
      oneHotIndex_2 = 3'b010;
    end else begin
      oneHotIndex_2 = 3'b000;
    end
  end

  assign when_nocDefines_l609_3 = selOneHotOut[3];
  always @(*) begin
    if(when_nocDefines_l609_3) begin
      oneHotIndex_3 = 3'b011;
    end else begin
      oneHotIndex_3 = 3'b000;
    end
  end

  assign when_nocDefines_l609_4 = selOneHotOut[4];
  always @(*) begin
    if(when_nocDefines_l609_4) begin
      oneHotIndex_4 = 3'b100;
    end else begin
      oneHotIndex_4 = 3'b000;
    end
  end

  assign oneHotIndex = ((((oneHotIndex_0 | oneHotIndex_1) | oneHotIndex_2) | oneHotIndex_3) | oneHotIndex_4);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pointerReg <= _zz_pointerReg;
    end else begin
      if(when_nocDefines_l582) begin
        pointerReg <= maskHigerReq;
      end else begin
        if(when_nocDefines_l585) begin
          pointerReg <= unmaskHigerReq;
        end else begin
          pointerReg <= pointerReg;
        end
      end
    end
  end


endmodule

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
  wire                validStud_0;
  wire                validStud_1;
  wire                validStud_2;
  wire                validStud_3;
  wire                validStud_4;

  assign validStud_0 = (validIn_0 && 1'b0);
  assign validStud_1 = (validIn_1 && 1'b0);
  assign validStud_2 = (validIn_2 && 1'b0);
  assign validStud_3 = (validIn_3 && 1'b0);
  assign validStud_4 = (validIn_4 && 1'b0);
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

//Mem1r1w replaced by Mem1r1w

//Mem1r1w replaced by Mem1r1w

//Mem1r1w replaced by Mem1r1w

//Mem1r1w replaced by Mem1r1w

module Mem1r1w (
  input               wVi,
  input      [0:0]    wAddri,
  input      [77:0]   wDatai,
  input               rVi,
  input      [0:0]    rAddri,
  output     [77:0]   rDatao,
  input               clk,
  input               resetn
);

  wire       [77:0]   _zz_mem_port0;
  (* ram_style = "distributed" *) reg [77:0] mem [0:1];

  assign _zz_mem_port0 = mem[rAddri];
  always @(posedge clk) begin
    if(wVi) begin
      mem[wAddri] <= wDatai;
    end
  end

  assign rDatao = _zz_mem_port0;

endmodule
