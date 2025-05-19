`timescale 1ns / 1ps

module freq_calc_module (
    input  logic        clk_10k,         // 10kHz ����ʱ��
    input  logic [7:0]  key_in,          // Ƶ�ʿ�����
    output logic [12:0] li_lun_zhi = 13'd0  // �������Ƶ��ֵ
);

    always_ff @(posedge clk_10k) begin
        if (key_in == 8'd0) begin
            li_lun_zhi <= 13'd0;
        end else begin
            li_lun_zhi <= (10000 * key_in) >> 8;
        end
    end

endmodule