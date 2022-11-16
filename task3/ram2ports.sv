module ram2ports #(
    parameter ADDRESS_WIDTH = 9,
              DATA_WIDTH = 8
)(
    input logic                       clk,
    input logic                       wr_en,
    input logic                       rd_en,
    input logic  [ADDRESS_WIDTH-1:0]  offset, 
    input logic  [ADDRESS_WIDTH-1:0]  addr,
    input logic  [DATA_WIDTH-1:0]     din,
    output logic [DATA_WIDTH-1:0]     dout
);

logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];


always_ff @(posedge clk) begin
    if (wr_en == 1'b1)
    ram_array[addr + offset] <= din;
    if (rd_en == 1'b1)
    dout <= ram_array [addr];
    end
    
endmodule
