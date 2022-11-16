module sigdelay #(
        parameter A_WIDTH = 9,
                  D_WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic                 wr,
    input logic                 rd,
    input logic [D_WIDTH-1:0]   mic_signal,
    // input logic [A_WIDTH-1:0]   incr,
    input logic [A_WIDTH-1:0]   offset,
    output logic [D_WIDTH-1:0]  delayed_signal
);

logic [A_WIDTH-1:0]             address;

counter addrCounter (
    .clk(clk),
    .rst(rst),
    .en(en),
    .incr(1),
    .count(address)
);

ram2ports ram (
    .clk(clk),
    .addr(address),
    .wr_en(wr),
    .rd_en(rd),
    .offset(offset),
    .din(mic_signal),
    .dout(delayed_signal)
);

endmodule
