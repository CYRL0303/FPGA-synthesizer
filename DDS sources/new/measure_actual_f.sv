
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 11:56:34
// Design Name: 
// Module Name: measure_actual_f
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

module measure_actual_f(
    input  logic       clk_05,         // 0.5Hz 输入时钟
    input  logic [7:0] sin,            // 波形信号（8位）
    input  logic       rst_n_shiji,    // 低有效复位（使能）
    output logic [12:0] shi_ji_zhi = 13'd0  // 实际频率测量值
    );
    logic wave_s = 0;           // 整形后的方波
    logic [12:0] freq_m = 13'd0; // 频率计数
    logic [12:0] lock   = 13'd0; // 锁存标志

    // 将输入波形 sin 转换为 0/1 方波（通过阈值判断）
    always_comb begin
        if (sin > 8'd127)
            wave_s = 1;
        else if (sin < 8'd127)
            wave_s = 0;
    end

    // 在 wave_s 上升沿进行频率统计与锁存
    always_ff @(posedge wave_s) begin
        if (rst_n_shiji) begin
            if (clk_05 == 1 && lock == 0) begin
                freq_m <= freq_m + 1;
            end else if (clk_05 == 1 && lock > 0) begin
                shi_ji_zhi <= freq_m;
                freq_m <= 13'd1;
                lock <= 13'd0;
            end

            if (clk_05 == 0) begin
                lock <= lock + 1;
                shi_ji_zhi <= freq_m;
            end
        end else begin
            shi_ji_zhi <= 13'd0;
        end
    end

endmodule
