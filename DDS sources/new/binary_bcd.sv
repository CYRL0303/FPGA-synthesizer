`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 19:06:52
// Design Name: 
// Module Name: binary_bcd
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


module binary_bcd (
    input  logic [12:0] bin_in,        // 输入的二进制数
    output logic [15:0] bcd_out        // 输出的 8421 BCD 码（4 位 × 4 位）
);

    logic [3:0] ones       = 4'd0;
    logic [3:0] tens       = 4'd0;
    logic [3:0] hundreds   = 4'd0;
    logic [3:0] thousands  = 4'd0;

    always_comb begin
        // 初始化所有位
        ones      = 4'd0;
        tens      = 4'd0;
        hundreds  = 4'd0;
        thousands = 4'd0;

        // Shift-add-3 算法（Double Dabble）
        for (int i = 12; i >= 0; i--) begin
            if (ones      >= 4'd5) ones      += 4'd3;
            if (tens      >= 4'd5) tens      += 4'd3;
            if (hundreds  >= 4'd5) hundreds  += 4'd3;
            if (thousands >= 4'd5) thousands += 4'd3;

            thousands = {thousands[2:0], hundreds[3]};
            hundreds  = {hundreds[2:0], tens[3]};
            tens      = {tens[2:0],     ones[3]};
            ones      = {ones[2:0],     bin_in[i]};
        end
    end

    assign bcd_out = {thousands, hundreds, tens, ones};

endmodule

