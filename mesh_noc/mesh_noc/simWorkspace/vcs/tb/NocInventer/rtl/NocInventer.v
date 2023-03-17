// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : NocInventer

`timescale 1ns/1ps

module NocInventer (
  input      [7:0]    ain,
  output     [7:0]    aout
);


  assign aout = (~ ain);

endmodule
