module top (

);
wire        clk_200;
wire        s_axis_tlast;
wire        s_axis_tvalid;
wire [15:0] s_axis_tdata;
wire        s_axis_tready;
wire        sys_arstn;

design_1 design_1_wrapper (
    .clk_200(clk_200),
    .sys_arstn(sys_arstn),
    .S_AXIS_1_tdata(s_axis_tdata),
    .S_AXIS_1_tlast(s_axis_tlast),
    .S_AXIS_1_tready(s_axis_tready),
    .S_AXIS_1_tvalid(s_axis_tvalid)
);

endmodule