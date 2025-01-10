# LED_MemoryGame_FPGA
LED Memory Game played with the FPGA programmed in Verilog

Project Collaborator: Gila Kohanbash

This FPGA project was inspired by this memory game:
https://freesimon.org/#google_vignette
In this interactive game, the user is shown a series of lights and then given the chance
to replicate the light sequence. If they successfully enter the right colored sequence,
they move on to the next round, otherwise they fail and start over. We decided to adapt
this idea to fit our FPGA board.

Implementation Details
- State Diagram Logic
    - The main verilog design file has all the state actions. There is an assigned local parameter for each identified state, which holds the actions of its own case as described in the state diagram above. The case and the reset are in an always at posedge clock block 
      and there is a separate always block for incrementing the slow clock divider.
    - The game's behavior is defined using a state machine with different states representing various stages of the game. Each state is encoded using local parameters for readability and clarity.
    - The game logic operates on a clock signal (clk) and includes a reset signal (rst) to initialize the game state. A slow clock (slow_clk) is derived from the main clock to control the timing of state transitions and other game actions. It helps create delays and 
      timing constraints for the game's progression. The always @(posedge slow_clk) block implements the core game logic. It defines the behavior for each state, including LED patterns, timer management, player response validation, and state transitions. A timer
      variable tracks the elapsed time within each state. It increments on each slow clock cycle and is used to control the duration of LED patterns and the time available for player response.
    - After presenting an LED pattern, the game enters a response wait state (RESPONSE_WAIT_X), during which the player must activate specific switches (sw) to indicate their response. The player's response is validated within a predefined time window, and the game 
      transitions to either a success state (indicating a correct response) or a fail state (indicating an incorrect or timed-out response). The game progresses through multiple levels (FLASH_X, CHECK_X, RESPONSE_WAIT_X, SUCCESS_X, FAIL_X), each with its own LED patterns 
      and response validation criteria. As the player advances through levels, the LED patterns become more complex, and the response time may vary. Upon successfully completing the final level (SUCCESS_4), the game flashes all LEDs twice to indicate successful completion.
- Top Design
    - The top design file includes declarations of three input and one output, along with the state diagram verilog module declaration. The three wire inputs used are for the board clock, reset signal, and switches input. The output wire is for the 16 LEDs.
- XDC File
    - The .xdc file, mostly influenced by the previous labs contains the relevant pin names needed for the sixteen LEDs and the sixteen switches.

