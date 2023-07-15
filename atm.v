module atm(
    input clk,
    input rst,
    input [4:0] pin,
    input [7:0] amount,
    input face,
    output reg [7:0] old_balance,
    output reg [7:0] new_balance,
    output reg mini_statement
);
    reg [7:0] balance = 1000;
    reg [3:0] pin_count = 0;
    reg locked = 0;
    always @(posedge clk) begin
        if (rst) begin
            pin_count <= 0;
            locked <= 0;
            old_balance <= balance;
            new_balance <= balance;
            mini_statement <= 0;
        end else begin
            if (locked) begin
                new_balance <= balance;
                mini_statement <= 0;
            end else begin
                if (pin == 1234 && pin_count < 3) begin
                    pin_count <= pin_count + 1;
                    new_balance <= balance - amount;
                    mini_statement <= 1;
                end else if (pin != 1234 && pin_count < 3) begin
                    pin_count <= pin_count + 1;
                end else if (pin != 1234 && pin_count == 3) begin
                    locked <= 1;
                end
            end
        end
    end
endmodule