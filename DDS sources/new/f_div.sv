`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/10 12:05:40
// Design Name: 
// Module Name: f_div
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

module f_div (
    input  logic sys_clk,
    output logic clk_10k = 0,
    output logic clk_05  = 0
);

    logic [13:0] cnt_10k = 0;
    logic [27:0] cnt_05  = 0;

    parameter int div_10k = 4999;       // div 10KHz from 100MHz 
    parameter int div_05  = 99999999;   // div 0.5Hz from 100MHz 

    always_ff @(posedge sys_clk) begin
        if (cnt_10k == div_10k) begin
            clk_10k <= ~clk_10k;
            cnt_10k <= 0;
        end else begin
            cnt_10k <= cnt_10k + 1;
        end

        
        if (cnt_05 == div_05) begin
            clk_05 <= ~clk_05;
            cnt_05 <= 0;
        end else begin
            cnt_05 <= cnt_05 + 1;
        end
    end

endmodule
