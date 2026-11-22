
module mealy_fsm (
    input wire clk,
    input wire reset,
    input wire x,
    output reg y
);
    reg [1:0] state;
    localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            case (state)
                S0: state <= x ? S1 : S0;
                S1: state <= x ? S1 : S2;
                S2: state <= x ? S1 : S0;
                default: state <= S0;
            endcase
    end

    always @(*) begin
        y = (state == S2) && x;
    end
endmodule

