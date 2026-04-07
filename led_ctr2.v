
module led_ctr2(
    clk,
    rst_n,
    sw,
    led
);

    input clk;
    input rst_n;
    input [7:0]sw;
    output reg led;

    reg [23:0]cnt;

    // parameter TIME_UNIT_MS = 1_000;
    parameter TIME_UNIT_250MS = 12_500_000 - 1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 0;
    else if(cnt == TIME_UNIT_250MS)
        cnt <= 0;
    else
        cnt <= cnt + 1'd1;

    reg [2:0]cnt_t;
    always@(posedge clk or negedge rst_n) 
    if(!rst_n)
        cnt_t <= 0;
    else if(cnt == TIME_UNIT_250MS)
        cnt_t <= cnt_t + 1;

    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        led <= 1'b0;
    else begin
        case (cnt_t)
            4'b0000:    led <= sw[0];
            4'b0001:    led <= sw[1];
            4'b0010:    led <= sw[2];
            4'b0011:    led <= sw[3];
            4'b0100:    led <= sw[4];
            4'b0101:    led <= sw[5];
            4'b0110:    led <= sw[6];
            4'b0111:    led <= sw[7];
            default:    led <= led;
        endcase
    end
    



endmodule