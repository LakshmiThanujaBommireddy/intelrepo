module atm_tb;
    reg clk = 0;
    reg rst = 0;
    reg [4:0] pin = 1234;
    reg [7:0] amount = 1000;
    reg face = 1;
    wire [7:0] old_balance;
    wire [7:0] new_balance;
    wire mini_statement;
    atm atm(
        .clk(clk),
        .rst(rst),
        .pin(pin),
        .amount(amount),
        .face(face),
        .old_balance(old_balance),
        .new_balance(new_balance),
        .mini_statement(mini_statement)
    );
    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #1000 $finish;
    end
    always #1 clk = ~clk;
endmodule