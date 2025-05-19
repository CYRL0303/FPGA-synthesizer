`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/10 12:38:53
// Design Name: 
// Module Name: phase_accumulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module phase_accumulator (
    input  logic clk_10k,
    input  logic [7:0] key_in,

    output logic [7:0] address = 0
);

    always_ff @(posedge clk_10k) begin
        address <= address + key_in;
    end

endmodule

