`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/14 12:53:11
// Design Name: 
// Module Name: DDS_top
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


module DDS_top (
    input  logic        sys_clk,        // ����ϵͳʱ��
    input  logic [7:0]  key_in,         // ���뿪�ؿ�����
    input  logic [1:0]  sel,            // ����ѡ��
    input  logic        rst_n_shiji,    // ��Ƶʹ��

    output logic [3:0]  l_dis,          // ��������λѡ
    output logic [6:0]  l_seg,          // �������ܶ�ѡ
    output logic [3:0]  r_dis,          // �Ҳ������λѡ
    output logic [6:0]  r_seg,          // �Ҳ�����ܶ�ѡ

    output logic [7:0]  sin,            // �������ֵ
    output logic [4:0]  rst_n_AD        // �̶� AD ����
);

    logic        clk_10k;
    logic        clk_05;
    logic [7:0]  address;
    logic [12:0] bin_in_lilun;
    logic [15:0] bcd_in_lilun;
    logic [27:0] f_lilun_value;

    logic [12:0] bin_in_shiji;
    logic [15:0] bcd_in_shiji;
    logic [27:0] f_shiji_value;
    
    f_div fen_pin_qi (
        .sys_clk(sys_clk),
        .clk_10k(clk_10k),
        .clk_05(clk_05)
    );
    
    phase_accumulator leijiaqi (
        .clk_10k(clk_10k),
        .key_in(key_in),
        .address(address)
    );
    
    
    ip_rom rom (
        .address(address),
        .sel(sel),
        .clk(clk_10k),
        .sin(sin)
    );
    
    freq_calc_module lilun_f_inst (
        .clk_10k(clk_10k),
        .key_in(key_in),
        .li_lun_zhi(bin_in_lilun)
    );
    
    
    
    
    // ����Ƶ�ʶ�����תBCD
    binary_bcd binary_bcd_inst_lilun (
        .bin_in(bin_in_lilun),
        .bcd_out(bcd_in_lilun)
    );
    // ����Ƶ��BCDת����ܶ���
    trans_BCD trans_BCD_inst_lilun (
        .BCD_in(bcd_in_lilun),
        .show_in(f_lilun_value)
    );

    // ʵ��Ƶ�ʲ���ģ��
    measure_actual_f measure_shiji_f_inst (
        .clk_05(clk_05),
        .sin(sin),
        .rst_n_shiji(rst_n_shiji),
        .shi_ji_zhi(bin_in_shiji)
    );

    
    binary_bcd binary_bcd_inst_shiji (
        .bin_in(bin_in_shiji),
        .bcd_out(bcd_in_shiji)
    );

    
    trans_BCD trans_BCD_inst_shiji (
        .BCD_in(bcd_in_shiji),
        .show_in(f_shiji_value)
    );

    
    show show_inst (
        .f_lilun_value(f_lilun_value),
        .f_shiji_value(f_shiji_value),
        .clk_10k(clk_10k),
        .l_dis(l_dis),
        .l_seg(l_seg),
        .r_dis(r_dis),
        .r_seg(r_seg)
    );


    assign rst_n_AD = 5'b00001;

endmodule