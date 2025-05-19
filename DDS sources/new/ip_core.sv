
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/11 12:35:55
// Design Name: 
// Module Name: ip_core
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

module ip_rom (
    input  logic [7:0] address,
    input  logic [1:0] sel, // ����ѡ���ź�
    input  logic clk, //�¼ӵ����clk��֮��Ҫ����clk��
    
    
    output logic [7:0] sin
);

    logic [7:0] sin_wave;
    logic [7:0] triangular_wave;
    logic [7:0] square_wave;
    logic [7:0] sawtooth_wave;

    //ʵ�������Ҳ�ROM
    rom_256x8b u0 (
        .clka(clk),
        .addra   (address),
        .douta (sin_wave)
    );

    //���ǲ�ROM
    triangular_rom256x8 u1 (
        .clka(clk),
        .addra   (address),
        .douta (triangular_wave)
    );

    //fang��ROM
    square_256x8b u2 (
        .clka(clk),
        .addra   (address),
        .douta (square_wave)
    );

    //��ݲ�ROM
    sawtooth_256x8b u3 (
        .clka(clk),
        .addra   (address),
        .douta (sawtooth_wave)
    );


    always_comb begin
        case (sel)
            2'b00: sin = sin_wave;
            2'b01: sin = triangular_wave;
            2'b10: sin = square_wave;
            2'b11: sin = sawtooth_wave;
            default: sin = 8'd0;
        endcase
    end

endmodule

