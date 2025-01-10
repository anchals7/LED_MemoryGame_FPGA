module led_game (
    input clk,
    input rst,
    input [15:0] sw,
    output reg [15:0] led
);

    // State encoding
    localparam WAIT = 0, 
				FLASH_1 = 1, CHECK_1 = 2, RESPONSE_WAIT_1 = 3, SUCCESS_1 = 4, FAIL_1 = 5, 
			    FLASH_2 = 6, CHECK_2 = 7, RESPONSE_WAIT_2 = 8, SUCCESS_2 = 9, FAIL_2 = 10, 
			    FLASH_3 = 11, CHECK_3 = 12, RESPONSE_WAIT_3 = 13, SUCCESS_3 = 14, FAIL_3 = 15,
			    FLASH_4 = 16, CHECK_4 = 17, RESPONSE_WAIT_4 = 18, SUCCESS_4 = 19, FAIL_4 = 20;
    reg [3:0] state = WAIT; //changed from [2:0] to [3:0] to make room for more states
    reg [25:0] timer = 0; // Timer for delay
	
	reg [24:0] slow_clk_divider = 0;
	wire slow_clk;
	
	always @(posedge clk) 
	begin
    slow_clk_divider <= slow_clk_divider + 1;
	end
	assign slow_clk = slow_clk_divider[24]; // Approximately 1.5 Hz if clk is 100 MHz

    // Game logic
    always @(posedge slow_clk) begin
        if (~rst) 
			begin
		
            state <= WAIT;
            timer <= 0;
			led <= 16'b1111111111111111; //All LEDs on to signal were in reset
			end 
		else 
			begin
            case (state)
                WAIT: 
				begin
                    timer <= timer + 1;
                    if (timer > 3) begin // adjust this based on your clock frequency
                        state <= FLASH_1;
                        timer <= 0;
						//timer <= timer + 1;
                        led <= 16'b0000000000000000; // LEDs 2, 6, and 9 are on
                    end
                end
                FLASH_1: 
				begin
                    timer <= timer + 1;
                    if (timer >= 4) begin // adjust this based on your clock frequency
                        state <= CHECK_1;
                        //timer <= 0;
						timer <= timer + 1;
                        led <= 16'b0000000000000000;
                    end
                end
                CHECK_1: 
				begin
				led <= 16'b0000000001000100;
					timer <= timer + 1;
					
					if (timer >= 5) 
						begin
						state <= RESPONSE_WAIT_1;
						timer <= 0;
						end

                end
				
				RESPONSE_WAIT_1: 
				begin
				
				timer <= timer + 1;
				
				if (timer >= 10) //user has 10 slow clock cycles to responds
					begin
					
					if (sw[2] && sw[6]) 
						begin
                        state <= SUCCESS_1;
						end
                    else 
						begin
						state <= FAIL_1;
						end
					//timer <= 0;
					end
				
				end
                SUCCESS_1: begin
                    led <= 16'hFFFF; // Flash all LEDs to signal next round
                    state <= FLASH_2;
                end
                FAIL_1: begin
				led <= 16'b0000000000000000;
                end
				
				FLASH_2:
				begin
                led <= 16'b0000000010110010; // LEDs 1, 4, 5, 7 are on
                timer <= timer + 1;
                if (timer >= 4) 
					begin
                        state <= CHECK_2;
						timer <= timer + 1;
                        //timer <= 0;
					end
                end
                CHECK_2: begin
                    timer <= timer + 1;
                    if (timer >= 5) 
						begin
                        state <= RESPONSE_WAIT_2;
                        timer <= 0;
						end
                end
				
				
				
				//more states for second round
				RESPONSE_WAIT_2: 
				begin
                    timer <= timer + 1;
                    if (timer >= 10) //give player time to respond but also must be fast
					begin
                        if (sw[1] && sw[4] && sw[5] && sw[7] && !sw[2] && !sw[6]) 
							begin
                            state <= SUCCESS_2;
							
							end
                        else 
							begin
                            state <= FAIL_2;
							end
                        
                       // timer <= 0;
                    end
                end
				
				SUCCESS_2: begin
                    led <= 16'hFFFF; // Flash all LEDs twice
					state <= FLASH_3;
					timer <= timer + 1;
					//led <= 16'b1100000000000000;
                end
                FAIL_2: begin
				led <= 16'b0000000000000000;
                   // led <= 16'hFFFF; // All LEDs on forever
				end
				
				
				//Third round 								
				FLASH_3:
				begin
                led <= 16'b0010000100101010; // LEDs 1, 3, 5, 8, 13 are on
                timer <= timer + 1;
                if (timer >= 4) 
					begin
                        state <= CHECK_3;
						timer <= timer + 1;
                        //timer <= 0;
					end
                end
                CHECK_3: begin
                    timer <= timer + 1;
                    if (timer >= 5) 
						begin
                        state <= RESPONSE_WAIT_3;
                        timer <= 0;
						end
                end
				

				//more states for third round
				RESPONSE_WAIT_3: 
				begin
                    timer <= timer + 1;
                    if (timer >= 10) //give player time to respond but also must be fast
					begin
                        if (sw[1] && sw[3] && sw[5] && sw[8] && sw[13] && !sw[4] && !sw[7]) 
							begin
                            state <= SUCCESS_3;
							
							end
                        else 
							begin
                            state <= FAIL_3;
							end
                        
                       // timer <= 0;
                    end
                end
				
				SUCCESS_3: begin
                    led <= 16'hFFFF; // Flash all LEDs twice
					state <= FLASH_4;
					timer <= timer + 1;
					//led <= 16'b1100000000000000;
                end
                FAIL_3: begin
				led <= 16'b0000000000000000;
                   // led <= 16'hFFFF; // All LEDs on forever
				end
				
			
			//Level four (final round)
			FLASH_4:
				begin
                led <= 16'b1101001010000011; // LEDs 0, 1, 7, 9, 12, 14, 15
                timer <= timer + 1;
                if (timer >= 4) 
					begin
                        state <= CHECK_4;
						timer <= timer + 1;
                        //timer <= 0;
					end
                end
                CHECK_4: begin
                    timer <= timer + 1;
                    if (timer >= 5) 
						begin
                        state <= RESPONSE_WAIT_4;
                        timer <= 0;
						end
                end
				

				//more states for third round
				RESPONSE_WAIT_4: 
				begin
                    timer <= timer + 1;
                    if (timer >= 10) //give player time to respond but also must be fast
					begin
					//make sure switches from previous round are not on 
                        if (sw[0] && sw[1] && sw[7] && sw[9] && sw[12] && sw[14] && sw[15] && !sw[3] && !sw[5] && !sw[13]) 
							begin
                            state <= SUCCESS_4;
							end
                        else 
							begin
                            state <= FAIL_4;
							end
                        
                       // timer <= 0;
                    end
                end
				
				SUCCESS_4: begin
                    led <= 16'hFFFF; // Flash all LEDs twice
					//led <= 16'b1100000000000000;
                end
                FAIL_4: begin
				led <= 16'b0000000000000000;
                   // led <= 16'hFFFF; // All LEDs on forever
				end
				
				
				
				
				
				
				
				
            endcase
        end
    end

endmodule
