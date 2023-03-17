// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : myNocDirectionTest

`timescale 1ns/1ps

module myNocDirectionTest (
);
  localparam NocDirection_P = 3'd0;
  localparam NocDirection_W = 3'd1;
  localparam NocDirection_E = 3'd2;
  localparam NocDirection_N = 3'd3;
  localparam NocDirection_S = 3'd4;

  wire       [2:0]    routerDirect;
  `ifndef SYNTHESIS
  reg [7:0] routerDirect_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(routerDirect)
      NocDirection_P : routerDirect_string = "P";
      NocDirection_W : routerDirect_string = "W";
      NocDirection_E : routerDirect_string = "E";
      NocDirection_N : routerDirect_string = "N";
      NocDirection_S : routerDirect_string = "S";
      default : routerDirect_string = "?";
    endcase
  end
  `endif

  assign routerDirect = NocDirection_P;

endmodule
