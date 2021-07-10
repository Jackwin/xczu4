module top (

);
wire        clk_200;
wire        axis_clk;
wire        s_axis_tlast;
wire        s_axis_tvalid;
wire [15:0] s_axis_tdata;
wire        s_axis_tready;
wire        sys_arstn;
wire        cfg_ctrl;
wire        cfg_ctrl_r;
wire        data_gen_start;
wire [94:0] gpio_vec;

design_1 design_1_wrapper (
    .clk_200(clk_200),
    .axis_clk(axis_clk),
    .sys_arstn(sys_arstn),
    .GPIO_0_tri_o(gpio_vec),
    .irq_ext(gpio_vec[1]),
    .S_AXIS_1_tdata(s_axis_tdata),
    .S_AXIS_1_tlast(s_axis_tlast),
    .S_AXIS_1_tready(s_axis_tready),
    .S_AXIS_1_tvalid(s_axis_tvalid)
);


always @(posedge axis_clk) begin
    cfg_ctrl_r <= gpio_vec[0];
    data_gen_start <= ~cfg_ctrl_r & gpio_vec[0];
end

axi_data_gen # (
    .DATA_WIDTH(64),
    .LENGTH_WIDTH(9)
)axi_data_gen_inst (
    .clk(axis_clk),
    .rst(~sys_arstn),
    .i_start(data_gen_start),
    .i_length(9'h0280),
    .i_ready(s_axis_tready),
    .o_data(s_axis_tdata),
    .o_valid(s_axis_tvalid),
    .o_keep(),
    .o_last(s_axis_tlast)
);

// Recommend you the anchor tool in VScode to remind you what to do.
// https://marketplace.visualstudio.com/items?itemName=ExodiusStudios.comment-anchors
// TODO 
// ANCHOR this is an anchor comment
// Note
// FIXME
// REVIEW
// STUB

endmodule