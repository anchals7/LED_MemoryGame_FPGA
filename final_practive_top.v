module top (
    input wire clk,        // Clock signal
    input wire rst,        // Reset signal (active high)
    input wire [15:0] sw,  // 16 switches input
    output wire [15:0] led // 16 LEDs output
);

    // Instantiate the game logic
    led_game game(
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .led(led)
    );

endmodule