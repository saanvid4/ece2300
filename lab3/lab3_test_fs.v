/*  lab3_test_fs.v
    ECE/ENGRD 2300, Spring 2014

    Author: Saugata Ghose, Skand Hurkat
    Last modified: October 15, 2014

    Description: Skeleton test bench for Part B of reaction time game circuit.
*/

// sets the granularity at which we simulate
`timescale 1 ns / 1 ps

// name of the top-level module; for us it should always be <module name>_test
// this top-level module should have no inputs or outputs; only internal signals are needed
module lab3_test();

  // for all of your input pins, declare them as type reg, and name them identically to the pins
  reg        CLK;
  reg        RESET;
  reg        NEXT;
  reg        PLAYER_A;
  reg        PLAYER_B;
  reg        TEST_LOAD;

  // for all of your output pins, declare them as type wire so ModelSim can display them
  wire       SIGNAL;
  wire [3:0] SCORE_A;
  wire [3:0] SCORE_B;
  wire [3:0] WINNER;
  wire [3:0] STATE;
  wire       FALSE_START;
  wire [2:0] ADDRESS;
  wire [9:0] DATA;

  // variables - internal state that can be used for statistics such as
  //   counters, but are not visible outside the test bench
  integer currentTestCorrect;
  integer numTestsPassed;
  integer currentLoopFailed;
  integer i;
  integer previousState;
  integer FSM_TYPE;
  // FSM TYPES
  // 0: FSM signals immediately at end of countdown
  // 1: FSM waits 1 cycle after end of countdown to begin
  // signalling
  // Other types that we may have missed


  // declare a sub-circuit instance (Unit Under Test) of the circuit that you designed
  // make sure to include all ports you want to see, and connect them to the variables above
  lab3 UUT(
    .CLK(CLK),
    .RESET(RESET),
    .NEXT(NEXT),
    .PLAYER_A(PLAYER_A),
    .PLAYER_B(PLAYER_B),
    .TEST_LOAD(TEST_LOAD),
    .SIGNAL(SIGNAL),
    .SCORE_A(SCORE_A),
    .SCORE_B(SCORE_B),
    .WINNER(WINNER),
    .STATE(STATE),
    .FALSE_START(FALSE_START),
    .ADDRESS(ADDRESS),
    .DATA(DATA) // remember - no comma after the last port
  );

  // ALL of the initial and always blocks below will work in parallel.
  //   Starting at time t = 0, they will all start counting the number
  //   of ticks.


  // CLK: generate a 50 MHz clock (rising edge does not start until
  //   10 ticks (10 ns) into simulation, and each clock cycle lasts for
  //   20 ticks (20 ns)
  initial begin
    CLK = 1'b0;
    forever begin
      #50
      CLK = ~CLK;
    end
  end

  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by delays that are multiples of #100, so we can see
  //    the output for at least one cycle (since we chose a 10 MHz clock)
  initial
  begin
    // Initial values
    RESET    = 1'b0;
    NEXT     = 1'b1;
    PLAYER_A = 1'b1;
    PLAYER_B = 1'b1;
    FSM_TYPE = 0;

    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #25;

    // start TEST CASES here

    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
    $display("MSIM> TEST CASES only for False Start implementation in Part B");
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");


    numTestsPassed = 0;


    /* TESTS
       1. detecting false starts
       2. restarting the FSM and checking for false start ties
       3. restarting the FSM and checking for a proper false start countdown
    */


    $display("MSIM> ");
    $display("MSIM> TEST 1: DETECTING FALSE STARTS");
    $display("MSIM> ==============================");
    $display("MSIM> ");

    currentTestCorrect = 1;

    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 82: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 83: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // test to see if NEXT is ignored during reset
    NEXT = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> NEXT is correctly ignored during reset. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 84: NEXT not ignored during reset. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // test to see if state stays the same when reset is brought low
    NEXT = 1'b1;
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Waiting at initial state with no signals asserted is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 85: Waiting at initial state with no signals asserted is incorrect. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // test to see if PLAYER_A input affects the state
    PLAYER_A = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_A to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 86: Setting PLAYER_A to 0 (active) incorrectly changed the outputs. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // test to see if PLAYER_B input affects the state
    PLAYER_B = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_A and PLAYER_B to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 87: Setting PLAYER_A and PLAYER_B to 0 (active) incorrectly changed the state. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring PLAYER_A back high (inactive)
    PLAYER_A = 1'b1;

    #100;  // wait a cycle to observe results

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_B to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 88: Setting PLAYER_B to 0 (active) incorrectly changed the state. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring PLAYER_B back high (inactive)
    PLAYER_B = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Waiting at initial state with no signals asserted is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 89: Waiting at initial state with no signals asserted is incorrect. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd150 && ADDRESS == 3'b110) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 90: DATA from prandom is %3d, should be 150 (ADDRESS = %3b, should be 110). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd550 && ADDRESS == 3'b111) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 91: DATA from prandom is %3d, should be 550 (ADDRESS = %3b, should be 111). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b000) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 92: DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd700 && ADDRESS == 3'b001) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 93: DATA from prandom is %3d, should be 700 (ADDRESS = %3b, should be 001). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd350 && ADDRESS == 3'b010) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 94: DATA from prandom is %3d, should be 350 (ADDRESS = %3b, should be 010). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd500 && ADDRESS == 3'b011) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 95: DATA from prandom is %3d, should be 500 (ADDRESS = %3b, should be 011). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd650 && ADDRESS == 3'b100) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 96: DATA from prandom is %3d, should be 650 (ADDRESS = %3b, should be 100). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd300 && ADDRESS == 3'b101) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 97: DATA from prandom is %3d, should be 300 (ADDRESS = %3b, should be 101). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd150 && ADDRESS == 3'b110) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 98: DATA from prandom is %3d, should be 150 (ADDRESS = %3b, should be 110). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 99: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // let go of NEXT
    NEXT = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 150 cycles...");

    for(i = 0; i < 150; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentTestCorrect == 1)  
          $display("MSIM> ERROR 100: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentTestCorrect = 0; 
      end

      #100;  // wait a cycle to observe result
    end

    if(STATE != previousState && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
		if(SIGNAL == 1'b1) begin
      $display("MSIM> Correctly signaled after 150-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
		end
		else begin
			$display("MSIM> Not signaled after 150-cycle countdown. Waiting one cycle to check signal again");
			#100;
			if(SIGNAL == 1'b1) begin
      $display("MSIM> Correctly signaled after 150-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
      			FSM_TYPE = 1;
      			end
			else begin
			      currentTestCorrect = 0;
			      $display("MSIM> ERROR 101: Error with signaling after 150-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
			end
		end
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 101: Error with signaling after 150-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 102: Not properly waiting while signaling. STATE = %2d, SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 8 cycles to skip to just before end of false start period...");

    #800;  // wait eight cycles

    if(STATE == previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 103: Not properly waiting while signaling. STATE = %2d (should be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B reacting
    PLAYER_B = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point/win to Player A when Player B false starts. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 104: Error with giving point/win to Player A when Player B false starts. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly waiting after false start. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 105: Not properly waiting after false start. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A reacting
    PLAYER_A = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly unaffected by Player A after Player B's false start. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 106: Should not be affected by Player A after Player B's false start. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B releasing button
    PLAYER_B = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly unaffected by Player B releasing button after false start. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 107: Should not be affected by Player B releasing button after false start. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A releasing button
    PLAYER_A = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly unaffected by Player A releasing button after false start. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 108: Should not be affected by Player A releasing button after false start. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // check if pressing NEXT has any effect
    NEXT = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly unaffected by NEXT button after false start. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 109: Should not be affected by NEXT button after false start. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 2;
      $display("MSIM> TEST 1 PASSED");
    end
    else begin
      $display("MSIM> TEST 1 FAILED (-2 pt)");
    end
    $display("MSIM> ");



    $display("MSIM> ");
    $display("MSIM> TEST 2: RESTARTING THE FSM AND CHECKING FOR FALSE START TIES");
    $display("MSIM> ============================================================");
    $display("MSIM> ");

    currentTestCorrect = 1;

    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 110: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 111: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 200 cycles (but will trigger a false start after 79)...");

    for(i = 0; i < 79; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentTestCorrect == 1)
          $display("MSIM> ERROR 112: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentTestCorrect = 0;
      end

      #100;  // wait a cycle to observe result
    end

    // simulate Players A and B reacting immediately
    PLAYER_A = 1'b0;
    PLAYER_B = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point/win to Player B when both players false start simultaneously. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 113: Error with giving point/win to Player B when both players false start simultaneously. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset buttons now that test is complete
    NEXT = 1'b1;
    PLAYER_A = 1'b1;
    PLAYER_B = 1'b1;

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 2 PASSED");
    end
    else begin
      $display("MSIM> TEST 2 FAILED (-1 pt)");
    end
    $display("MSIM> ");



    $display("MSIM> ");
    $display("MSIM> TEST 3: RESETTING THE FSM AND PLAYING A NON FALSE START GAME");
    $display("MSIM> ============================================================");
    $display("MSIM> ");

    currentTestCorrect = 1;

    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 114: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 115: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 200 cycles...");

    for(i = 0; i < 200; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentTestCorrect == 1)
          $display("MSIM> ERROR 116: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentTestCorrect = 0;
      end

      #100;  // wait a cycle to observe result
    end

    if(FSM_TYPE == 1) begin
	    // Need to wait one more cycle to observe signal
	#100;
    end

    if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 200-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 117: Error with signaling after 200-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 118: Not properly waiting while signaling. STATE = %2d, SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 10 cycles to skip to just after end of false start period...");

    #1000;  // wait ten cycles

    // simulate Players A and B reacting immediately
    PLAYER_A = 1'b0;
    PLAYER_B = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point/win to Player A when both buttons pressed simultaneously after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      currentTestCorrect = 0;
      $display("MSIM> ERROR 119: Error with giving point/win to Player A when both buttons pressed simultaneously after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset buttons now that test is complete
    NEXT = 1'b1;
    PLAYER_A = 1'b1;
    PLAYER_B = 1'b1;

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 3 PASSED");
    end
    else begin
      $display("MSIM> TEST 3 FAILED (-1 pt)");
    end
    $display("MSIM> ");


    // print final score
    //$display("MSIM> ");
    //$display("MSIM> PreLab 3b Score: %2d / 4", numTestsPassed);

    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
