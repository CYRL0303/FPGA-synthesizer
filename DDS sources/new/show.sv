`timescale 1ns / 1ps

module show (
    input  logic [27:0] f_lilun_value,    // ����Ƶ�� BCD ��ʾֵ
    input  logic [27:0] f_shiji_value,    // ʵ��Ƶ�� BCD ��ʾֵ
    input  logic        clk_10k,          // 10kHz ʱ������

    output logic [3:0]  l_dis = 4'b0000,  // ��������ѡͨ�źţ���̬��
    output logic [6:0]  l_seg = 7'b0000000, // �������ܶ�ѡ
    output logic [3:0]  r_dis = 4'b0000,  // �ұ������ѡͨ�źţ���̬��
    output logic [6:0]  r_seg = 7'b0000000  // �ұ�����ܶ�ѡ
);

    logic [1:0] sel = 2'd0;  // ��̬ɨ��λ��ѡ��

    always_ff @(posedge clk_10k) begin
        sel <= sel + 1;

        // �����ʾ����ֵ
        case (sel)
            2'd0: begin
                l_dis <= 4'b1000;
                l_seg <= f_lilun_value[27:21];
            end
            2'd1: begin
                l_dis <= 4'b0100;
                l_seg <= f_lilun_value[20:14];
            end
            2'd2: begin
                l_dis <= 4'b0010;
                l_seg <= f_lilun_value[13:7];
            end
            2'd3: begin
                l_dis <= 4'b0001;
                l_seg <= f_lilun_value[6:0];
            end
            default: begin
                l_dis <= 4'b1000;
                l_seg <= 7'b0000000;
            end
        endcase

        // �ұ���ʾʵ��ֵ
        case (sel)
            2'd0: begin
                r_dis <= 4'b1000;
                r_seg <= f_shiji_value[27:21];
            end
            2'd1: begin
                r_dis <= 4'b0100;
                r_seg <= f_shiji_value[20:14];
            end
            2'd2: begin
                r_dis <= 4'b0010;
                r_seg <= f_shiji_value[13:7];
            end
            2'd3: begin
                r_dis <= 4'b0001;
                r_seg <= f_shiji_value[6:0];
            end
            default: begin
                r_dis <= 4'b1000;
                r_seg <= 7'b0000000;
            end
        endcase
    end

endmodule
