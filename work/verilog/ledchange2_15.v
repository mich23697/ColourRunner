/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     PIXEL_COUNT = 2
*/
module ledchange2_15 (
    input clk,
    input rst,
    output reg [0:0] pixel,
    output reg led,
    input [1:0] ledinput,
    input update
  );
  
  localparam PIXEL_COUNT = 2'h2;
  
  
  localparam SEND_PIXEL_state = 1'd0;
  localparam RESET_state = 1'd1;
  
  reg M_state_d, M_state_q = SEND_PIXEL_state;
  reg [0:0] M_pixel_ctr_d, M_pixel_ctr_q = 1'h0;
  reg [4:0] M_bit_ctr_d, M_bit_ctr_q = 1'h0;
  reg [5:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [11:0] M_rst_ctr_d, M_rst_ctr_q = 1'h0;
  
  reg [23:0] bits;
  
  reg [0:0] num;
  
  reg [23:0] color;
  
  always @* begin
    M_state_d = M_state_q;
    M_pixel_ctr_d = M_pixel_ctr_q;
    M_rst_ctr_d = M_rst_ctr_q;
    M_bit_ctr_d = M_bit_ctr_q;
    M_ctr_d = M_ctr_q;
    
    led = 1'h0;
    num = ledinput[(M_pixel_ctr_q)*1+0-:1];
    
    case (num)
      1'h0: begin
        color = 24'hff0000;
      end
      1'h1: begin
        color = 24'h000000;
      end
      default: begin
        color = 24'hff0000;
      end
    endcase
    bits = {color[0+0-:1], color[1+0-:1], color[2+0-:1], color[3+0-:1], color[4+0-:1], color[5+0-:1], color[6+0-:1], color[7+0-:1], color[16+0-:1], color[17+0-:1], color[18+0-:1], color[19+0-:1], color[20+0-:1], color[21+0-:1], color[22+0-:1], color[23+0-:1], color[8+0-:1], color[9+0-:1], color[10+0-:1], color[11+0-:1], color[12+0-:1], color[13+0-:1], color[14+0-:1], color[15+0-:1]};
    pixel = M_pixel_ctr_q;
    
    case (M_state_q)
      SEND_PIXEL_state: begin
        if (bits[(M_bit_ctr_q)*1+0-:1]) begin
          led = M_ctr_q < 6'h2d;
        end else begin
          led = M_ctr_q < 5'h11;
        end
        M_ctr_d = M_ctr_q + 1'h1;
        if (M_ctr_q == 6'h3e) begin
          M_ctr_d = 1'h0;
          M_bit_ctr_d = M_bit_ctr_q + 1'h1;
          if (M_bit_ctr_q == 5'h17) begin
            M_bit_ctr_d = 1'h0;
            M_pixel_ctr_d = M_pixel_ctr_q + 1'h1;
            if (M_pixel_ctr_q == 3'h1) begin
              M_pixel_ctr_d = 1'h0;
              M_state_d = RESET_state;
            end
          end
        end
      end
      RESET_state: begin
        if ((&M_rst_ctr_q)) begin
          if (update) begin
            M_rst_ctr_d = 1'h0;
            M_state_d = SEND_PIXEL_state;
          end
        end else begin
          M_rst_ctr_d = M_rst_ctr_q + 1'h1;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_pixel_ctr_q <= 1'h0;
      M_bit_ctr_q <= 1'h0;
      M_ctr_q <= 1'h0;
      M_rst_ctr_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_pixel_ctr_q <= M_pixel_ctr_d;
      M_bit_ctr_q <= M_bit_ctr_d;
      M_ctr_q <= M_ctr_d;
      M_rst_ctr_q <= M_rst_ctr_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
