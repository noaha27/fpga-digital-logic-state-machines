
module moore_fsm (
    input wire clk,
    input wire reset,
    input wire x,
    output wire y
);
    reg [1:0] state;
    localparam S0 = 2'd0, S1 = 2'd1,
               S2 = 2'd2, S3 = 2'd3;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            case (state)
                S0: state <= x ? S1 : S0;
                S1: state <= x ? S1 : S2;
                S2: state <= x ? S3 : S0;
                S3: state <= x ? S1 : S2;
                default: state <= S0;
            endcase
    end

    assign y = (state == S3);
endmodule
