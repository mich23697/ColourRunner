/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg strip1,
    output reg strip2,
    output reg strip3,
    output reg strip4,
    input button1a,
    input button1b,
    input button2a,
    input button2b,
    input resetbutton
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_c0_out;
  reg [1-1:0] M_c0_in;
  button_conditioner_1 c0 (
    .clk(clk),
    .in(M_c0_in),
    .out(M_c0_out)
  );
  wire [1-1:0] M_c1_out;
  reg [1-1:0] M_c1_in;
  button_conditioner_1 c1 (
    .clk(clk),
    .in(M_c1_in),
    .out(M_c1_out)
  );
  wire [1-1:0] M_c2_out;
  reg [1-1:0] M_c2_in;
  button_conditioner_1 c2 (
    .clk(clk),
    .in(M_c2_in),
    .out(M_c2_out)
  );
  wire [1-1:0] M_c3_out;
  reg [1-1:0] M_c3_in;
  button_conditioner_1 c3 (
    .clk(clk),
    .in(M_c3_in),
    .out(M_c3_out)
  );
  wire [1-1:0] M_cr_out;
  reg [1-1:0] M_cr_in;
  button_conditioner_1 cr (
    .clk(clk),
    .in(M_cr_in),
    .out(M_cr_out)
  );
  wire [1-1:0] M_e0_out;
  reg [1-1:0] M_e0_in;
  edge_detector_6 e0 (
    .clk(clk),
    .in(M_e0_in),
    .out(M_e0_out)
  );
  wire [1-1:0] M_e1_out;
  reg [1-1:0] M_e1_in;
  edge_detector_6 e1 (
    .clk(clk),
    .in(M_e1_in),
    .out(M_e1_out)
  );
  wire [1-1:0] M_e2_out;
  reg [1-1:0] M_e2_in;
  edge_detector_6 e2 (
    .clk(clk),
    .in(M_e2_in),
    .out(M_e2_out)
  );
  wire [1-1:0] M_e3_out;
  reg [1-1:0] M_e3_in;
  edge_detector_6 e3 (
    .clk(clk),
    .in(M_e3_in),
    .out(M_e3_out)
  );
  wire [1-1:0] M_er_out;
  reg [1-1:0] M_er_in;
  edge_detector_6 er (
    .clk(clk),
    .in(M_er_in),
    .out(M_er_out)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_11 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [7:0] M_counter1_d, M_counter1_q = 1'h0;
  reg [7:0] M_counter2_d, M_counter2_q = 1'h0;
  reg [26:0] M_movecount1_d, M_movecount1_q = 1'h0;
  reg [26:0] M_movecount2_d, M_movecount2_q = 1'h0;
  reg [15:0] M_currenta1_d, M_currenta1_q = 1'h0;
  reg [15:0] M_currenta2_d, M_currenta2_q = 1'h0;
  reg [0:0] M_secondmove_d, M_secondmove_q = 1'h0;
  reg [0:0] M_firstmove_d, M_firstmove_q = 1'h0;
  reg [0:0] M_delay1_d, M_delay1_q = 1'h0;
  reg [0:0] M_delay2_d, M_delay2_q = 1'h0;
  reg [1:0] M_lives1_d, M_lives1_q = 1'h0;
  reg [1:0] M_lives2_d, M_lives2_q = 1'h0;
  reg [3:0] M_win1_d, M_win1_q = 1'h0;
  reg [3:0] M_win2_d, M_win2_q = 1'h0;
  localparam START_state = 4'd0;
  localparam PLAY_state = 4'd1;
  localparam FIRSTPRESSONE_state = 4'd2;
  localparam FIRSTPRESSZERO_state = 4'd3;
  localparam SECONDPRESSONE_state = 4'd4;
  localparam SECONDPRESSZERO_state = 4'd5;
  localparam SHIFTDOWN_state = 4'd6;
  localparam END_state = 4'd7;
  localparam WINONE_state = 4'd8;
  localparam WINTWO_state = 4'd9;
  
  reg [3:0] M_state_d, M_state_q = START_state;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_values;
  multi_seven_seg_12 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [3-1:0] M_rgbled1_pixel;
  wire [1-1:0] M_rgbled1_led;
  reg [8-1:0] M_rgbled1_ledinput;
  reg [1-1:0] M_rgbled1_update;
  ledchange_13 rgbled1 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgbled1_ledinput),
    .update(M_rgbled1_update),
    .pixel(M_rgbled1_pixel),
    .led(M_rgbled1_led)
  );
  wire [3-1:0] M_rgbled2_pixel;
  wire [1-1:0] M_rgbled2_led;
  reg [8-1:0] M_rgbled2_ledinput;
  reg [1-1:0] M_rgbled2_update;
  ledchange_13 rgbled2 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgbled2_ledinput),
    .update(M_rgbled2_update),
    .pixel(M_rgbled2_pixel),
    .led(M_rgbled2_led)
  );
  wire [1-1:0] M_rgblives1_pixel;
  wire [1-1:0] M_rgblives1_led;
  reg [2-1:0] M_rgblives1_ledinput;
  reg [1-1:0] M_rgblives1_update;
  ledchange2_15 rgblives1 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgblives1_ledinput),
    .update(M_rgblives1_update),
    .pixel(M_rgblives1_pixel),
    .led(M_rgblives1_led)
  );
  wire [1-1:0] M_rgblives2_pixel;
  wire [1-1:0] M_rgblives2_led;
  reg [2-1:0] M_rgblives2_ledinput;
  reg [1-1:0] M_rgblives2_update;
  ledchange2_15 rgblives2 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgblives2_ledinput),
    .update(M_rgblives2_update),
    .pixel(M_rgblives2_pixel),
    .led(M_rgblives2_led)
  );
  wire [3-1:0] M_rgbwinner1_pixel;
  wire [1-1:0] M_rgbwinner1_led;
  reg [8-1:0] M_rgbwinner1_ledinput;
  reg [1-1:0] M_rgbwinner1_update;
  ledwinner_17 rgbwinner1 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgbwinner1_ledinput),
    .update(M_rgbwinner1_update),
    .pixel(M_rgbwinner1_pixel),
    .led(M_rgbwinner1_led)
  );
  wire [3-1:0] M_rgbwinner2_pixel;
  wire [1-1:0] M_rgbwinner2_led;
  reg [8-1:0] M_rgbwinner2_ledinput;
  reg [1-1:0] M_rgbwinner2_update;
  ledwinner_17 rgbwinner2 (
    .clk(clk),
    .rst(rst),
    .ledinput(M_rgbwinner2_ledinput),
    .update(M_rgbwinner2_update),
    .pixel(M_rgbwinner2_pixel),
    .led(M_rgbwinner2_led)
  );
  wire [32-1:0] M_random_num;
  reg [1-1:0] M_random_next;
  reg [32-1:0] M_random_seed;
  pn_gen_19 random (
    .clk(clk),
    .rst(rst),
    .next(M_random_next),
    .seed(M_random_seed),
    .num(M_random_num)
  );
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [5:0] alufn;
  
  reg [15:0] alu;
  
  wire [16-1:0] M_alumod_alu;
  wire [1-1:0] M_alumod_z;
  wire [1-1:0] M_alumod_v;
  wire [1-1:0] M_alumod_n;
  reg [6-1:0] M_alumod_alufn;
  reg [16-1:0] M_alumod_a;
  reg [16-1:0] M_alumod_b;
  alu_20 alumod (
    .alufn(M_alumod_alufn),
    .a(M_alumod_a),
    .b(M_alumod_b),
    .alu(M_alumod_alu),
    .z(M_alumod_z),
    .v(M_alumod_v),
    .n(M_alumod_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_movecount1_d = M_movecount1_q;
    M_currenta1_d = M_currenta1_q;
    M_currenta2_d = M_currenta2_q;
    M_movecount2_d = M_movecount2_q;
    M_counter2_d = M_counter2_q;
    M_firstmove_d = M_firstmove_q;
    M_counter1_d = M_counter1_q;
    M_lives2_d = M_lives2_q;
    M_lives1_d = M_lives1_q;
    M_secondmove_d = M_secondmove_q;
    M_delay2_d = M_delay2_q;
    M_win2_d = M_win2_q;
    M_delay1_d = M_delay1_q;
    M_win1_d = M_win1_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_random_seed = 32'h9554aa85;
    M_random_next = 1'h1;
    M_c0_in = button1a;
    M_e0_in = M_c0_out;
    M_c1_in = button1b;
    M_e1_in = M_c1_out;
    M_c2_in = button2a;
    M_e2_in = M_c2_out;
    M_c3_in = button2b;
    M_e3_in = M_c3_out;
    M_cr_in = resetbutton;
    M_er_in = M_cr_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_seg_values = 20'h00000;
    io_sel = 4'hf;
    a = 16'h0000;
    b = 16'h0000;
    alufn = io_dip[16+0+5-:6];
    M_alumod_alufn = alufn;
    M_alumod_a = a;
    M_alumod_b = b;
    alu = M_alumod_alu;
    M_rgbled1_update = 1'h1;
    M_rgbled2_update = 1'h1;
    M_rgblives1_update = 1'h1;
    M_rgblives2_update = 1'h1;
    M_rgbwinner1_update = 1'h1;
    M_rgbwinner2_update = 1'h1;
    
    case (M_state_q)
      START_state: begin
        M_currenta1_d[0+15-:16] = 8'hff;
        M_currenta2_d[0+15-:16] = 8'hff;
        if (io_dip[0+0+0-:1]) begin
          M_lives1_d = 1'h1;
          M_lives2_d = 1'h1;
        end else begin
          M_lives1_d = 1'h0;
          M_lives2_d = 1'h0;
        end
        M_delay1_d = 1'h0;
        M_delay2_d = 1'h0;
        M_win1_d = 1'h0;
        M_win2_d = 1'h0;
        if (M_er_out) begin
          M_random_next = 1'h1;
          M_currenta1_d[0+15-:16] = M_random_num[16+15-:16];
          M_currenta2_d[0+15-:16] = M_random_num[0+15-:16];
          M_state_d = PLAY_state;
        end
      end
      PLAY_state: begin
        if (M_delay1_q == 1'h0) begin
          if (M_e0_out) begin
            M_state_d = FIRSTPRESSONE_state;
          end
          if (M_e2_out) begin
            M_state_d = FIRSTPRESSZERO_state;
          end
        end else begin
          M_movecount1_d = M_movecount1_q + 1'h1;
        end
        if (M_delay2_q == 1'h0) begin
          if (M_e1_out) begin
            M_state_d = SECONDPRESSONE_state;
          end
          if (M_e3_out) begin
            M_state_d = SECONDPRESSZERO_state;
          end
        end else begin
          M_movecount2_d = M_movecount2_q + 1'h1;
        end
        if (M_firstmove_q) begin
          M_currenta1_d = M_currenta1_q >> 1'h1;
          M_counter1_d = M_counter1_q + 1'h1;
          M_firstmove_d = 1'h0;
          io_led[8+7-:8] = M_currenta1_q[0+7-:8];
          io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        end
        if (M_secondmove_q) begin
          M_currenta2_d = M_currenta2_q >> 1'h1;
          M_counter2_d = M_counter2_q + 1'h1;
          M_secondmove_d = 1'h0;
          io_led[8+7-:8] = M_currenta1_q[0+7-:8];
          io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        end
        if (M_counter1_q > 3'h7) begin
          M_win1_d = M_win1_q + 1'h1;
          if (M_win1_q == 4'he) begin
            M_state_d = WINONE_state;
          end
          io_led[16+6+0-:1] = 1'h1;
          M_random_next = 1'h1;
          M_currenta1_d[8+7-:8] = M_random_num[0+7-:8];
          M_counter1_d = 1'h0;
        end
        if (M_counter2_q > 3'h7) begin
          M_win2_d = M_win2_q + 1'h1;
          if (M_win2_q == 4'he) begin
            M_state_d = WINTWO_state;
          end
          io_led[16+7+0-:1] = 1'h1;
          M_random_next = 1'h1;
          M_currenta2_d[8+7-:8] = M_random_num[8+7-:8];
          M_counter2_d = 1'h0;
        end
        if (M_movecount1_q[26+0-:1]) begin
          M_movecount1_d = 1'h0;
          M_delay1_d = 1'h0;
        end
        if (M_movecount2_q[26+0-:1]) begin
          M_movecount2_d = 1'h0;
          M_delay2_d = 1'h0;
        end
        M_alumod_alufn = 6'h35;
        M_alumod_a = 16'h0000;
        M_alumod_b = {14'h0000, M_lives2_q[1+0-:1], M_lives1_q[1+0-:1]};
        if (M_alumod_alu[0+0-:1] == 1'h1) begin
          M_state_d = END_state;
        end
        io_led[8+7-:8] = M_currenta1_q[0+7-:8];
        io_led[0+7-:8] = M_currenta2_q[0+7-:8];
      end
      FIRSTPRESSONE_state: begin
        M_alumod_alufn = 6'h18;
        M_alumod_a = M_currenta1_q;
        M_alumod_b = 16'h0001;
        if (M_alumod_alu[0+0-:1] == 1'h1) begin
          M_firstmove_d = 1'h1;
        end else begin
          M_delay1_d = 1'h1;
          M_lives1_d = M_lives1_q + 1'h1;
        end
        io_led[8+7-:8] = M_currenta1_q[0+7-:8];
        io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        M_state_d = PLAY_state;
      end
      FIRSTPRESSZERO_state: begin
        M_alumod_alufn = 6'h1e;
        M_alumod_a = M_currenta1_q;
        M_alumod_b = 16'h0000;
        if (M_alumod_alu[0+0-:1] == 1'h0) begin
          M_firstmove_d = 1'h1;
        end else begin
          M_delay1_d = 1'h1;
          M_lives1_d = M_lives1_q + 1'h1;
        end
        io_led[8+7-:8] = M_currenta1_q[0+7-:8];
        io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        M_state_d = PLAY_state;
      end
      SECONDPRESSONE_state: begin
        M_alumod_alufn = 6'h18;
        M_alumod_a = M_currenta2_q;
        M_alumod_b = 16'h0001;
        if (M_alumod_alu[0+0-:1] == 1'h1) begin
          M_secondmove_d = 1'h1;
        end else begin
          M_delay2_d = 1'h1;
          M_lives2_d = M_lives2_q + 1'h1;
        end
        io_led[8+7-:8] = M_currenta1_q[0+7-:8];
        io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        M_state_d = PLAY_state;
      end
      SECONDPRESSZERO_state: begin
        M_alumod_alufn = 6'h1e;
        M_alumod_a = M_currenta2_q;
        M_alumod_b = 16'h0000;
        if (M_alumod_alu[0+0-:1] == 1'h0) begin
          M_secondmove_d = 1'h1;
        end else begin
          M_delay2_d = 1'h1;
          M_lives2_d = M_lives2_q + 1'h1;
        end
        io_led[8+7-:8] = M_currenta1_q[0+7-:8];
        io_led[0+7-:8] = M_currenta2_q[0+7-:8];
        M_state_d = PLAY_state;
      end
      END_state: begin
        if (M_lives1_q[1+0-:1]) begin
          M_currenta2_d = 32'hffffffff;
          M_currenta1_d = 32'h00000000;
          M_lives1_d = 2'h3;
          M_lives2_d = 1'h0;
        end
        if (M_lives2_q[1+0-:1]) begin
          M_currenta1_d = 32'hffffffff;
          M_currenta2_d = 32'h00000000;
          M_lives2_d = 2'h3;
          M_lives1_d = 1'h0;
        end
        if (M_er_out) begin
          M_state_d = START_state;
        end
      end
      WINONE_state: begin
        M_currenta1_d = 32'hffffffff;
        M_currenta2_d = 32'h00000000;
        M_lives1_d = 1'h0;
        M_lives2_d = 2'h3;
        if (M_er_out) begin
          M_state_d = START_state;
        end
      end
      WINTWO_state: begin
        M_currenta2_d = 32'hffffffff;
        M_currenta1_d = 32'h00000000;
        M_lives2_d = 1'h0;
        M_lives1_d = 2'h3;
        if (M_er_out) begin
          M_state_d = START_state;
        end
      end
    endcase
    io_led[8+7-:8] = M_currenta1_q[0+7-:8];
    io_led[0+7-:8] = M_currenta2_q[0+7-:8];
    io_led[16+0+0-:1] = M_delay1_q;
    io_led[16+1+0-:1] = M_delay2_q;
    io_led[16+4+3-:4] = M_lives2_q;
    M_rgbled1_ledinput = M_currenta1_q[0+7-:8];
    M_rgbled2_ledinput = M_currenta2_q[0+7-:8];
    M_rgbwinner1_ledinput = M_currenta1_q[0+7-:8];
    M_rgbwinner2_ledinput = M_currenta2_q[0+7-:8];
    strip1 = M_rgbled1_led;
    strip2 = M_rgbled2_led;
    M_rgblives1_ledinput = M_lives1_q;
    M_rgblives2_ledinput = M_lives2_q;
    strip3 = M_rgblives1_led;
    strip4 = M_rgblives2_led;
    if ((M_lives2_q == 2'h3 && M_lives1_q == 1'h0) || (M_lives2_q == 1'h0 && M_lives1_q == 2'h3)) begin
      strip1 = M_rgbwinner1_led;
      strip2 = M_rgbwinner2_led;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter1_q <= 1'h0;
      M_counter2_q <= 1'h0;
      M_movecount1_q <= 1'h0;
      M_movecount2_q <= 1'h0;
      M_currenta1_q <= 1'h0;
      M_currenta2_q <= 1'h0;
      M_secondmove_q <= 1'h0;
      M_firstmove_q <= 1'h0;
      M_delay1_q <= 1'h0;
      M_delay2_q <= 1'h0;
      M_lives1_q <= 1'h0;
      M_lives2_q <= 1'h0;
      M_win1_q <= 1'h0;
      M_win2_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter1_q <= M_counter1_d;
      M_counter2_q <= M_counter2_d;
      M_movecount1_q <= M_movecount1_d;
      M_movecount2_q <= M_movecount2_d;
      M_currenta1_q <= M_currenta1_d;
      M_currenta2_q <= M_currenta2_d;
      M_secondmove_q <= M_secondmove_d;
      M_firstmove_q <= M_firstmove_d;
      M_delay1_q <= M_delay1_d;
      M_delay2_q <= M_delay2_d;
      M_lives1_q <= M_lives1_d;
      M_lives2_q <= M_lives2_d;
      M_win1_q <= M_win1_d;
      M_win2_q <= M_win2_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
