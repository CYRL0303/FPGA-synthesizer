
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
    input  logic       clk_05,         // 0.5Hz ����ʱ��
    input  logic [7:0] sin,            // �����źţ�8λ��
    input  logic       rst_n_shiji,    // ����Ч��λ��ʹ�ܣ�
    output logic [12:0] shi_ji_zhi = 13'd0  // ʵ��Ƶ�ʲ���ֵ
    );
    logic wave_s = 0;           // ���κ�ķ���
    logic [12:0] freq_m = 13'd0; // Ƶ�ʼ���
    logic [12:0] lock   = 13'd0; // �����־

    // �����벨�� sin ת��Ϊ 0/1 ������ͨ����ֵ�жϣ�
    always_comb begin
        if (sin > 8'd127)
            wave_s = 1;
        else if (sin < 8'd127)
            wave_s = 0;
    end

    // �� wave_s �����ؽ���Ƶ��ͳ��������
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
