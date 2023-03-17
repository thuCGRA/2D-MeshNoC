// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : holdDataCycle

`timescale 1ns/1ps

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
  wire                when_nocDefines_l536;
  wire                when_nocDefines_l547;

  assign when_nocDefines_l536 = (holdReg_0 && (counterHoldCycle != 1'b1));
  assign when_nocDefines_l547 = (holdReg_0 && (counterHoldCycle == 1'b1));
  assign dataOut = dataReg_0;
  assign validOut = validReg_0;
  always @(posedge clk) begin
    if(holdIn) begin
      counterHoldCycle <= 1'b1;
      holdReg_0 <= 1'b1;
    end else begin
      if(when_nocDefines_l536) begin
        counterHoldCycle <= (counterHoldCycle + 1'b1);
      end else begin
        counterHoldCycle <= 1'b0;
        holdReg_0 <= 1'b0;
      end
    end
    if(holdIn) begin
      dataReg_0 <= dataIn;
      validReg_0 <= validIn;
    end else begin
      if(when_nocDefines_l547) begin
        dataReg_0 <= dataIn;
        validReg_0 <= 1'b0;
      end
    end
  end


endmodule
