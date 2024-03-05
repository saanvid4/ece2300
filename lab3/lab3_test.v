`ifndef __lab3_TEST_PARTB_INCLUDED__
`define __lab3_TEST_PARTB_INCLUDED__

/*  lab3_test_partB.v
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
  integer numTestsFailed;
  integer currentLoopFailed;
  integer i;
  integer previousState;
  integer timer;

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
  $dumpvars;
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

    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #25;

    // start TEST CASES here

    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
    $display("MSIM> PART B LAB TEST CASES");
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");

    numTestsFailed = 0;
	 
	 $display("MSIM> ");
    $display("MSIM> TEST 1: REGULAR GAME A WINS");
    $display("MSIM> ===========================");
    $display("MSIM> ");
	 
	 // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 0: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 1: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 200 cycles...");

    currentLoopFailed = 0;
    for(i = 0; i < 200; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 2: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 200-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 3: Error with signaling after 200-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 4: Not properly waiting while signaling. STATE = %2d, SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    $display("MSIM> Advancing 10 cycles to skip to just after end of false start period...");

    #1000;  // wait ten cycles

    // simulate Player A reacting immediately
    PLAYER_A = 1'b0;

    previousState = STATE;  // save state to check advancement
    #200;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player A when button pressed after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 5: Error with giving point to Player A when button pressed after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b000) begin
      $display("MSIM> Waiting after end of round is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 6: Waiting after end of round is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd700 && ADDRESS == 3'b001) begin
      $display("MSIM> Waiting after end of round is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 7: Waiting after end of round is incorrect. DATA from prandom is %3d, should be 700 (ADDRESS = %3b, should be 001). STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A releasing button
    PLAYER_A = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd350 && ADDRESS == 3'b010) begin
      $display("MSIM> Waiting after end of round is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 8: Waiting after end of round is incorrect. DATA from prandom is %3d, should be 350 (ADDRESS = %3b, should be 010). STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 9: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 350 cycles...");

    currentLoopFailed = 0;
    for(i = 0; i < 350; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b1 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 10: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end
      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end

    if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 350-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 11: Error with signaling after 350-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(SIGNAL == 1'b1 && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 12: Not properly waiting while signaling. STATE = %2d, SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 20 cycles to skip false start period...");
	 
	 #2000;
	 
	 // simulate Player B pressing the button
    PLAYER_B = 1'b0;

    previousState = STATE;  // save state to check advancement
    #200;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'b1 && SCORE_B == 4'b1 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player B when button pressed after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 13: Error with giving point to Player B when button pressed after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

	 // Remember current timer data and state
    previousState = STATE;
	 timer = DATA;
	 
	 // press NEXT immediately
	 NEXT = 1'b0;
    #100;  // wait a cycle to observe result
	 
	 if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'b1 && SCORE_B == 4'b1 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Transition after next is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 14: Transition after next is incorrect. STATE = %2d (should not be %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 // bring PLAYER_B back up; should not have any effect
	 PLAYER_B = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for %3d cycles...", timer - 2);

    currentLoopFailed = 0;
    for(i = 0; i < timer-2; i = i + 2) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b1 || SCORE_B != 4'b1 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 15: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #200;  // wait 2 cycles to observe result
    end
	 
    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end	 
	 
	 #200;  // wait two cycles to observe result

	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b1 && SCORE_B == 4'b1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 16: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
	 
	 $display("MSIM> Advancing 10 cycles to skip false start period...");
	 
	 #1000;
	 
	 // Both players press at the same time
	 PLAYER_A = 1'b0;
	 PLAYER_B = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement
    
	 #200;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'd2 && SCORE_B == 4'd1 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player A when button pressed by both A and B after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 17: Error with giving point to Player A when button pressed by both A and B after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;
	 timer = DATA;
	 
	 PLAYER_A = 1'b1;
	 PLAYER_B = 1'b1;
	 
	 #100;
	 
	 // press PLAYER_A
	 PLAYER_A = 1'b0;
	 
	 #100;  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd2 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Pressing PLAYER_A after end of round correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 18: Pressing PLAYER_A after end of round should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
    PLAYER_A = 1'b1;
	 
	 // press PLAYER_B
	 PLAYER_B = 1'b0;
	 
	 #100;  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd2 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Pressing PLAYER_B after end of round correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 19: Pressing PLAYER_B after end of round should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
	 PLAYER_B = 1'b1;
	 
	 NEXT = 1'b0;
	 
    #100;  // wait a cycle to observe result

	 NEXT = 1'b1;
	 
	 for(i = 0; i < timer; i = i + 2) begin
      #200;  // wait 2 cycles to observe result
    end
	 
	 $display("MSIM> Fast-forwarding...");
	 
	 #1100
	 	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after waiting. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 20: Error with signaling after waiting. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // Both players press at the same time
	 PLAYER_A = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement
    
	 #200;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'd3 && SCORE_B == 4'd1 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player A when button pressed after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 21: Error with giving point to Player A when button pressed after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 3), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;
	 timer = DATA;
	 
	 PLAYER_A = 1'b1;
	 NEXT = 1'b0;
	 
	 #100;

	 NEXT = 1'b1;
	 
	 for(i = 0; i < timer; i = i + 2) begin
      #200;  // wait 2 cycles to observe result
    end
	 
	 #1100
	 
	 // Both players press at the same time
	 PLAYER_A = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement
    
	 #200;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'd4 && SCORE_B == 4'd1 && WINNER == 4'b0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player A when button pressed after false start period passes. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 22: Error with giving point to Player A when button pressed after false start period passes. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 4), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;
	 timer = DATA;
	 
	 PLAYER_A = 1'b1;
	 NEXT = 1'b0;	 

	 #100;

	 NEXT = 1'b1;
	 
	 for(i = 0; i < timer; i = i + 2) begin
      #200;  // wait 2 cycles to observe result
    end
	 
	 #1100
	 
	 // Both players press at the same time
	 PLAYER_A = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement
    
	 #300;  // wait two cycles to observe result after score counter is incremented

    if(STATE != previousState && SCORE_A == 4'd5 && SCORE_B == 4'd1 && WINNER == 4'ha && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly declared Player A the winner. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 23: Error with declaring Player A the winner. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 5), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;
	 timer = DATA;
	 
	 PLAYER_A = 1'b1;

	 // press NEXT
    NEXT = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'd5 && SCORE_B == 4'd1 && WINNER == 4'ha && FALSE_START == 1'b0) begin
      $display("MSIM> Pressing NEXT after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 24: Pressing NEXT after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 5), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset buttons now that test is complete
    NEXT = 1'b1;
	 
	 // press PLAYER_A
	 PLAYER_A = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd5 && SCORE_B == 4'd1 && WINNER == 4'ha && FALSE_START == 1'b0) begin
      $display("MSIM> Pressing PLAYER_A after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 25: Pressing PLAYER_A after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 5), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
    PLAYER_A = 1'b1;
	 
	 // press PLAYER_B
	 PLAYER_B = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd5 && SCORE_B == 4'd1 && WINNER == 4'ha && FALSE_START == 1'b0) begin
      $display("MSIM> Pressing PLAYER_B after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 26: Pressing PLAYER_B after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 5), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
	 PLAYER_B = 1'b1;
	 
	 
    $display("MSIM> ");
    $display("MSIM> TEST 2: FALSE STARTS B WINS");
    $display("MSIM> ============================");
    $display("MSIM> ");


    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 27: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring RESET low
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd700 && ADDRESS == 3'b001) begin
      $display("MSIM> Waiting after reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR 28: Waiting after reset is incorrect. DATA from prandom is %3d, should be 700 (ADDRESS = %3b, should be 001). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 29: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 // simulate Player A pressing button
    PLAYER_A = 1'b0;

	 // simulate Player B pressing button
    PLAYER_B = 1'b0;
	 
    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 700 cycles (but will false start immediately)...");

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point to Player B when both false start during initial countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 30: Error with giving point to Player B when button pressing tied during initial countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A releasing button
    PLAYER_A = 1'b1;
	 // simulate Player B releasing button
    PLAYER_B = 1'b1;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'd0 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      
      $display("MSIM> Waiting after end of round is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 31: Waiting after end of round is incorrect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // press PLAYER_A
	 PLAYER_A = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd0 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Pressing PLAYER_A after end of round correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 32: Pressing PLAYER_A after end of round should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
    PLAYER_A = 1'b1;
	 
	 // press PLAYER_B
	 PLAYER_B = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd0 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Pressing PLAYER_B after end of round correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 33: Pressing PLAYER_B after end of round should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
	 PLAYER_B = 1'b1;

    // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 34: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b1 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 35: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 if(STATE == previousState && SIGNAL == 1'b0 && SCORE_A == 4'd0 && SCORE_B == 4'd1 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly stay in state until timer is done. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 36: Error with staying in state until timer is done. STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // simulate Player A pressing button
    PLAYER_A = 1'b0;
	 
    previousState = STATE;  // save state to check advancement

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'd0 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point to Player B when Player A false started right before signal. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 37: Error with giving point to Player B when Player A pressed button right before signal. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A releasing button
    PLAYER_A = 1'b1;

	 // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'd0 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 38: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'd0 || SCORE_B != 4'd2 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 39: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd0 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 40: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

	 // simulate Player B pressing button
    PLAYER_B = 1'b0;
    previousState = STATE;  // save state to check advancement

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'd1 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point to Player A when Player B false started during right after signal. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 41: Error with giving point to Player A when Player B pressed button right after signal. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B releasing button
    PLAYER_B = 1'b1;

    // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'd1 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 42: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'd1 || SCORE_B != 4'd2 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 43: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd1 && SCORE_B == 4'd2 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 44: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 2), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

	 // simulate Player A pressing button
    PLAYER_A = 1'b0;
	 // simulate Player B pressing button
    PLAYER_B = 1'b0;
    previousState = STATE;  // save state to check advancement

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'd1 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point to Player B when both false started during right after signal. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 45: Error with giving point to Player B when both pressed button right after signal. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player A releasing button
    PLAYER_A = 1'b1;
	 // simulate Player B releasing button
    PLAYER_B = 1'b1;

	 // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'd1 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 46: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'd1 || SCORE_B != 4'd3 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 47: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd1 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 48: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd1 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 49: Not properly waiting while signaling. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 8 cycles so that we are still in the false start period...");

    #800;  // wait eight cycles
	 
	 if(STATE == previousState && SIGNAL == 1'b1 && SCORE_A == 4'd1 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly stay in state until timer is done. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 50: Error with staying in state until timer is done. STATE = %2d (expected %2d), SIGNAL = %1b (exp. 1), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B reacting
    PLAYER_B = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'd2 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave point to Player A when Player B false started during after signal. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 51: Error with giving point to Player A when Player B pressed button after signal. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B releasing button
    PLAYER_B = 1'b1;
	 
	 // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'd2 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 52: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'd2 || SCORE_B != 4'd3 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 53: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 54: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 55: Not properly waiting while signaling. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 9 cycles so that we are no longer in the false start period...");

    #900;  // wait nine cycles
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd3 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 56: Not properly waiting while signaling. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 3), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B reacting
    PLAYER_B = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement

    #200;  // wait two cycles to register increment

    if(STATE != previousState && SCORE_A == 4'd2 && SCORE_B == 4'd4 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point to Player B for pressing button during regular period. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 57: Error with giving point to Player B for pressing button during regular period. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 4), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Player B releasing button
    PLAYER_B = 1'b1;
	 
	 // assert NEXT to advance to next state
    NEXT = 1'b0;
	 
	 // record how many cycles the timer is set to
	 timer = DATA;

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE != previousState && SIGNAL == 1'b0 && SCORE_A == 4'd2 && SCORE_B == 4'd4 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 58: Asserting active-low NEXT does not advance state correctly. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 4), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
	 
	 previousState = STATE;  // save state to check advancement

    $display("MSIM> Beginning to countdown for %3d cycles...", timer);

    currentLoopFailed = 0;
    for(i = 0; i < timer; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'd2 || SCORE_B != 4'd4 || WINNER != 4'h0 || FALSE_START != 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 59: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 4), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #100;  // wait a cycle to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd4 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after %3d-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", timer, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 60: Error with signaling after %3d-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 4), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", timer, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
	 
	 #100;
	 
	 if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'd2 && SCORE_B == 4'd4 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 61: Not properly waiting while signaling. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 4), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 5 cycles so that we are still in the false start period...");

    #500;  // wait five cycles
	 
	 // simulate Player A reacting
    PLAYER_A = 1'b0;
    // simulate Player B reacting
    PLAYER_B = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement

    #300;  // wait three cycles to register win

    if(STATE != previousState && SCORE_A == 4'd2 && SCORE_B == 4'd5 && WINNER == 4'hb && FALSE_START == 1'b1) begin
      $display("MSIM> Correctly gave win to Player B after both players tied and false started. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 62: Error with giving win to Player B after both players tied and false started. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 5), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset buttons now that test is complete
    PLAYER_A = 1'b1;
    PLAYER_B = 1'b1;
	 
	 // press NEXT
    NEXT = 1'b0;
	 
	 previousState = STATE;  // save state to check advancement

    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'd2 && SCORE_B == 4'd5 && WINNER == 4'hb && FALSE_START == 1'b1) begin
      $display("MSIM> Pressing NEXT after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 63: Pressing NEXT after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 5), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset buttons now that test is complete
    NEXT = 1'b1;
	 
	 // press PLAYER_A
	 PLAYER_A = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd2 && SCORE_B == 4'd5 && WINNER == 4'hb && FALSE_START == 1'b1) begin
      $display("MSIM> Pressing PLAYER_A after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 64: Pressing PLAYER_A after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 5), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
    PLAYER_A = 1'b1;
	 
	 // press PLAYER_B
	 PLAYER_B = 1'b0;
	 
	 #100  // wait a cycle to observe result
	 
	 if(STATE == previousState && SCORE_A == 4'd2 && SCORE_B == 4'd5 && WINNER == 4'hb && FALSE_START == 1'b1) begin
      $display("MSIM> Pressing PLAYER_B after end of game correctly has no effect. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 65: Pressing PLAYER_B after end of game should not have any effect. STATE = %2d (expected %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 2), SCORE_B = %1h (exp. 5), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 1)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
	 
	 // reset buttons now that test is complete
	 PLAYER_B = 1'b1;
	 
	 
	 $display("MSIM> ");
    $display("MSIM> TEST 3: HOLDING DOWN NEXT, RESET IN THE MIDDLE");
    $display("MSIM> ==============================================");
    $display("MSIM> ");


    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 66: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // assert NEXT to advance to next state
    NEXT = 1'b0;
    RESET = 1'b0;

    #100;  // wait a cycle to observe result

    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 67: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 200 cycles...");

    currentLoopFailed = 0;
    for(i = 0; i < 200; i = i + 5) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
        if(currentLoopFailed == 0)
          $display("MSIM> ERROR 68: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
        currentLoopFailed = 1;
      end

      #500;  // wait 5 cycles to observe result
    end

    if(currentLoopFailed == 1) begin
      numTestsFailed = numTestsFailed + 1;
    end

    if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 200-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 69: Error with signaling after 200-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 70: Not properly waiting while signaling. STATE = %2d, SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement

    $display("MSIM> Advancing 10 cycles to skip to just after end of false start period...");

    #1000;  // wait ten cycles

    // simulate Player A reacting immediately
    PLAYER_A = 1'b0;

    previousState = STATE;  // save state to check advancement
    #100;  // wait one cycle

    // simulate Player A letting go immediately
    PLAYER_A = 1'b1;

    #1000;  // wait a while
    
    NEXT = 0;
    #100;
    
    NEXT = 1;
    #100;
    
    // simulate Player B false starting immediately
    PLAYER_B = 1'b0;

    previousState = STATE;  // save state to check advancement
    #200;  // wait two cycles to observe result after score counter is incremented

    // simulate Player B releasing button
    PLAYER_B = 1'b1;
    #100
    if(SCORE_A != 4'b0 || SCORE_B != 4'b0) begin
      $display("MSIM> Scores currently non-zero. SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 71: Scores currently zero, exp. non-zero scores. SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // reset circuit
    RESET = 1'b1;

    #100;  // wait a cycle to observe result

    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct, including blanking scores. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      numTestsFailed = numTestsFailed + 1;
      $display("MSIM> ERROR 72: Reset (with blanking of scores) is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // set reset to low
    RESET = 1'b0;

	 
    $display("MSIM> ");
    if(numTestsFailed == 0) begin
      $display("MSIM> FSM IS CORRECT        o   o");
      $display("MSIM> All checks passed!      |  ");
      $display("MSIM>                       \\___/");
    end
    else begin
      $display("MSIM> FSM IS INCORRECT      o   o");
      $display("MSIM> Checks Failed: %2d      ___  ", numTestsFailed);
      $display("MSIM>                       /   \\ ");
    end
    $display("MSIM> ");

    $stop;


    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule

`endif //__lab3_TEST_PARTB_INCLUDED__
