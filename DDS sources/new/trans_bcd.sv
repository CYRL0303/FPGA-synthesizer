`timescale 1ns / 1ps

module trans_BCD (
    input  logic [15:0] BCD_in,       // 输入的 16 位 BCD 码
    output logic [27:0] show_in       // 输出给数码管的显示码（每 7 位对应 1 个数字）
);

    logic [3:0] thousand;
    logic [3:0] hundred;
    logic [3:0] tens;
    logic [3:0] units;

    always_comb begin
        // 拆分每 4 位 BCD 数字
        thousand = BCD_in[15:12];
        hundred  = BCD_in[11:8];
        tens     = BCD_in[7:4];
        units    = BCD_in[3:0];

        // 个位
        case (units)
            4'd0:  show_in[6:0]   = 7'b1111110;
            4'd1:  show_in[6:0]   = 7'b0110000;
            4'd2:  show_in[6:0]   = 7'b1101101;
            4'd3:  show_in[6:0]   = 7'b1111001;
            4'd4:  show_in[6:0]   = 7'b0110011;
            4'd5:  show_in[6:0]   = 7'b1011011;
            4'd6:  show_in[6:0]   = 7'b1011111;
            4'd7:  show_in[6:0]   = 7'b1110000;
            4'd8:  show_in[6:0]   = 7'b1111111;
            4'd9:  show_in[6:0]   = 7'b1111011;
            default: show_in[6:0] = 7'b0000000;
        endcase

        // 十位
        case (tens)
            4'd0:  show_in[13:7]  = 7'b1111110;
            4'd1:  show_in[13:7]  = 7'b0110000;
            4'd2:  show_in[13:7]  = 7'b1101101;
            4'd3:  show_in[13:7]  = 7'b1111001;
            4'd4:  show_in[13:7]  = 7'b0110011;
            4'd5:  show_in[13:7]  = 7'b1011011;
            4'd6:  show_in[13:7]  = 7'b1011111;
            4'd7:  show_in[13:7]  = 7'b1110000;
            4'd8:  show_in[13:7]  = 7'b1111111;
            4'd9:  show_in[13:7]  = 7'b1111011;
            default: show_in[13:7] = 7'b0000000;
        endcase

        // 百位
        case (hundred)
            4'd0:  show_in[20:14] = 7'b1111110;
            4'd1:  show_in[20:14] = 7'b0110000;
            4'd2:  show_in[20:14] = 7'b1101101;
            4'd3:  show_in[20:14] = 7'b1111001;
            4'd4:  show_in[20:14] = 7'b0110011;
            4'd5:  show_in[20:14] = 7'b1011011;
            4'd6:  show_in[20:14] = 7'b1011111;
            4'd7:  show_in[20:14] = 7'b1110000;
            4'd8:  show_in[20:14] = 7'b1111111;
            4'd9:  show_in[20:14] = 7'b1111011;
            default: show_in[20:14] = 7'b0000000;
        endcase

        // 千位
        case (thousand)
            4'd0:  show_in[27:21] = 7'b1111110;
            4'd1:  show_in[27:21] = 7'b0110000;
            4'd2:  show_in[27:21] = 7'b1101101;
            4'd3:  show_in[27:21] = 7'b1111001;
            4'd4:  show_in[27:21] = 7'b0110011;
            4'd5:  show_in[27:21] = 7'b1011011;
            4'd6:  show_in[27:21] = 7'b1011111;
            4'd7:  show_in[27:21] = 7'b1110000;
            4'd8:  show_in[27:21] = 7'b1111111;
            4'd9:  show_in[27:21] = 7'b1111011;
            default: show_in[27:21] = 7'b0000000;
        endcase
    end

endmodule
