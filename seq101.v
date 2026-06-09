module seq101(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [1:0]state;

always@(posedge clk or posedge rst)
begin
    if (rst)begin
        state<=2'b00;
        y<=1'b0;
end
else begin
case (state)
2'b00:  begin
    y<=1'b0;
    if (x)  
        state<=2'b01;
        else 
        state<=2'b00;
end
2'b01: begin 
    y<=1'b0;
    if (x)
    state<=2'b01;
    else
    state<=2'b10;
end
2'b10: begin
    if (x) begin
    y<=1'b1;
    state<=2'b00; end
    else begin
    y<=1'b0;
    state<=2'b00; end
end
default: begin
    state<=2'b00;
    y<=1'b0;
end
endcase 
end
end
endmodule