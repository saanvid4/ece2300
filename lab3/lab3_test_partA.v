/*  lab3_test_partA.v
    ECE/ENGRD 2300, Fall 2015
    
    Author: Saugata Ghose, Skand Hurkat
	 modified: KK Yu
    Last modified: October 10, 2014
    
    Description: Skeleton test bench for reaction time game circuit.
*/

//`define INLABA

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
  integer i;
  integer previousState;

  
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

  
  // CLK50: generate a 10 MHz clock (rising edge does not start until
  //   50 ticks (50 ns) into simulation, and each clock cycle lasts for
  //   100 ticks (100 ns)
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
     
    // wait at the beginning to make sure that we don't start on a rising clock edge -
    //    this guarantees that we give the flip-flops enough setup time
    #50;
    
    // start TEST CASES here
    
    
`ifdef INLABA
    
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
    $display("MSIM> LAB PART A TEST CASES ");
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
   

   $display("MSIM> ");
    $display("MSIM> TEST 1: DETAILED FSM FUNCTIONALITY");
    $display("MSIM> ==================================");
    $display("MSIM> ");

    // reset circuit
    RESET = 1'b1;
    
    #101;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // test to see if NEXT is ignored during reset
    NEXT = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> NEXT is correctly ignored during reset. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: NEXT not ignored during reset. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // test to see if state stays the same when reset is brought low
    NEXT = 1'b1;
    RESET = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Waiting at initial state with no signals asserted is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Waiting at initial state with no signals asserted is incorrect. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // test to see if PLAYER_A input affects the state
    PLAYER_A = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_A to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Setting PLAYER_A to 0 (active) incorrectly changed the outputs. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // test to see if PLAYER_B input affects the state
    PLAYER_B = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_A and PLAYER_B to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Setting PLAYER_A and PLAYER_B to 0 (active) incorrectly changed the state. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // bring PLAYER_A back high (inactive)
    PLAYER_A = 1'b1;
    
    #100;  // wait a cycle to observe results
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Setting PLAYER_B to 0 (active) correctly has no effect on initial state. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Setting PLAYER_B to 0 (active) incorrectly changed the state. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    // bring PLAYER_B back high (inactive)
    PLAYER_B = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Waiting at initial state with no signals asserted is correct. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Waiting at initial state with no signals asserted is incorrect. STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
        
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd150 && ADDRESS == 3'b110) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 300 (ADDRESS = %3b, should be 110). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd550 && ADDRESS == 3'b111) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 550 (ADDRESS = %3b, should be 111). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b000) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd700 && ADDRESS == 3'b001) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 700 (ADDRESS = %3b, should be 001). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd350 && ADDRESS == 3'b010) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 350 (ADDRESS = %3b, should be 010). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd500 && ADDRESS == 3'b011) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 500 (ADDRESS = %3b, should be 011). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd650 && ADDRESS == 3'b100) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 650 (ADDRESS = %3b, should be 100). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd300 && ADDRESS == 3'b101) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 300 (ADDRESS = %3b, should be 101). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd150 && ADDRESS == 3'b110) begin
      $display("MSIM> Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: DATA from prandom is %3d, should be 150 (ADDRESS = %3b, should be 110). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // assert NEXT to advance to next state
    NEXT = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 150 cycles...");
    
    for(i = 0; i < 150; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
       $display("MSIM> ERROR: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
      end

      #100;  // wait a cycle to observe result
    end
    
    if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 150-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Error with signaling after 150-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result
    
    if(STATE == previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Not properly waiting while signaling. STATE = %2d (should be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    #100;  // wait a cycle to observe result
    
    if(STATE == previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting while signaling. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Not properly waiting while signaling. STATE = %2d (should be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // simulate Player B reacting
    PLAYER_B = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE != previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point/win to Player B when active-low button pressed. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Error with giving point/win to Player B when active-low button pressed. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly waiting after win. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Not properly waiting after win. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // simulate Player A reacting
    PLAYER_A = 1'b0;
    
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly unaffected by Player A after win. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Should not be affected by Player A after win. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // simulate Player B releasing button
    PLAYER_B = 1'b1;
    
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly unaffected by Player B releasing button after win. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Should not be affected by Player B releasing button after win. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // simulate Player B releasing button
    PLAYER_A = 1'b1;
    
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly unaffected by Player A releasing button after win. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Should not be affected by Player A releasing button after win. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // check if letting NEXT go has any effect
    NEXT = 1'b1;
    
    #100;  // wait a cycle to observe result

    if(STATE == previousState && SCORE_A == 4'b0 && SCORE_B == 4'b1 && WINNER == 4'hB && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly unaffected by NEXT button after win. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Should not be affected by NEXT button after win. STATE = %2d (should be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 1), WINNER = %1h (exp. b), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    $display("MSIM> ");
    $display("MSIM> TEST 2: RESTARTING THE FSM AND CHECKING FOR TIES");
    $display("MSIM> ================================================");
    $display("MSIM> ");

    // reset circuit
    RESET = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // assert NEXT to advance to next state
    NEXT = 1'b0;
    RESET = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // bring NEXT back up; should not have any effect
    NEXT = 1'b1;
    
    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result

    $display("MSIM> Beginning to countdown for 200 cycles...");
    
    for(i = 0; i < 200; i = i + 1) begin
      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
       $display("MSIM> ERROR: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
      end

      #100;  // wait a cycle to observe result
    end
    
    if(STATE != previousState && SIGNAL == 1'b1 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly signaled after 200-cycle countdown. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Error with signaling after 200-cycle countdown. STATE = %2d (should not be %2d), SIGNAL = %1b (expected 1), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end

    // simulate Players A and B reacting immediately
    PLAYER_A = 1'b0;
    PLAYER_B = 1'b0;
    
    previousState = STATE;  // save state to check advancement
    #100;  // wait a cycle to observe result
    
    if(STATE != previousState && SCORE_A == 4'b1 && SCORE_B == 4'b0 && WINNER == 4'hA && FALSE_START == 1'b0) begin
      $display("MSIM> Correctly gave point/win to Player A when both buttons pressed simultaneously. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Error with giving point/win to Player A when both buttons pressed simultaneously. STATE = %2d (should not be %2d), SIGNAL = %1b (don't care), SCORE_A = %1h (exp. 1), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. a), FALSE_START = %1b (exp. 0)", STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // reset buttons now that test is complete
    NEXT = 1'b1;
    PLAYER_A = 1'b1;
    PLAYER_B = 1'b1;
    
    $display("MSIM> ");
    $display("MSIM> TEST 3: RESETTING THE FSM MIDWAY");
    $display("MSIM> ================================");
    $display("MSIM> ");

    // reset circuit
    RESET = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    // bring RESET low
    RESET = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd700 && ADDRESS == 3'b001) begin
      $display("MSIM> Waiting after reset is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Waiting after reset is incorrect. DATA from prandom is %3d, should be 700 (ADDRESS = %3b, should be 001). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
   // assert NEXT to advance to next state
    NEXT = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(STATE != 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0) begin
      $display("MSIM> Asserting active-low NEXT advances states correctly. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Asserting active-low NEXT does not advance state correctly. STATE = %2d, SIGNAL = %1b (expected 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    previousState = STATE;  // save state to check advancement
    $display("MSIM> Beginning to countdown for 700 cycles (but will reset after 434)...");
    
    for(i = 0; i < 434; i = i + 1) begin
      #100;  // wait a cycle to observe result

      if(STATE != previousState || SIGNAL != 1'b0 || SCORE_A != 4'b0 || SCORE_B != 4'b0 || WINNER != 4'h0 && FALSE_START == 1'b0) begin
       $display("MSIM> ERROR: Countdown is incorrect, or may have changed states. %3d cycles in, STATE = %2d (expected %2d), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", i, STATE, previousState, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
      end
    end
    
    // assert RESET
    RESET = 1'b1;

    #100;  // wait a cycle to observe result
    
    if(STATE == 4'b0 && SIGNAL == 1'b0 && SCORE_A == 4'b0 && SCORE_B == 4'b0 && WINNER == 4'h0 && FALSE_START == 1'b0 && DATA == 10'd200 && ADDRESS == 3'b0) begin
      $display("MSIM> Reset in the middle of FSM operation is correct. Reading delay of %3d (DATA at ADDRESS %3b) correctly from prandom. STATE = %2d, SIGNAL = %1b, SCORE_A = %1h, SCORE_B = %1h, WINNER = %1h, FALSE_START = %1b", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    else begin
      $display("MSIM> ERROR: Reset in the middle of FSM operation is incorrect. DATA from prandom is %3d, should be 200 (ADDRESS = %3b, should be 000). STATE = %2d (expected 0), SIGNAL = %1b (exp. 0), SCORE_A = %1h (exp. 0), SCORE_B = %1h (exp. 0), WINNER = %1h (exp. 0), FALSE_START = %1b (exp. 0)", DATA, ADDRESS, STATE, SIGNAL, SCORE_A, SCORE_B, WINNER, FALSE_START);
    end
    
    $stop;
`else
    
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
    $display("MSIM> PRELAB A TEST CASES");
    $display("MSIM>");
    $display("MSIM> ===============================================================");
    $display("MSIM>");
   
    numTestsPassed = 0;
    
    
    /* TESTS
       1. address_generator reset
       2. address_generator increment
       3. address_generator restart
    */
    
    
    $display("MSIM> ");
    $display("MSIM> TEST 1: ADDRESS_GENERATOR RESET FUNCTIONALITY");
    $display("MSIM> =============================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // reset circuit
    RESET = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. ADDRESS (value in register) should be 000, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. ADDRESS (value in register) should be 000, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. ADDRESS (value in register) should be 000, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 1 PASSED");
    end
    else begin
      $display("MSIM> TEST 1 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 2: ADDRESS_GENERATOR SEQUENCE CHECK");
    $display("MSIM> ========================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
    
    // enable and start running
    RESET = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b1) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 001, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b10) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 010, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b11) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 011, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b100) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 100, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b101) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 101, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b110) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 110, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b111) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 111, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b0) begin
      $display("MSIM> Counter increment and wrap around is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment and wrap around is incorrect. ADDRESS (value in register) should be 000, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b1) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 001, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b10) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 010, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

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
    $display("MSIM> TEST 3: ADDRESS_GENERATOR RESTART");
    $display("MSIM> =================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // reset circuit
    RESET = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b0) begin
      $display("MSIM> Reset is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. ADDRESS (value in register) should be 000, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end
    
    // enable and start running
    RESET = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b1) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 001, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    #100;  // wait a cycle to observe result
    
    if(ADDRESS == 3'b10) begin
      $display("MSIM> Counter increment is correct, ADDRESS (value in register) now %3b", ADDRESS);
    end
    else begin
      $display("MSIM> ERROR: Counter increment is incorrect. ADDRESS (value in register) should be 010, but is %3b", ADDRESS);
      currentTestCorrect = 0;
    end

    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 3 PASSED");
    end
    else begin
      $display("MSIM> TEST 3 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    
    
    $display("MSIM> ");
    $display("MSIM> TEST 4: COUNTDOWN RESET FUNCTIONALITY");
    $display("MSIM> =====================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // reset circuit
    RESET = 1'b1;
    TEST_LOAD = 1'b0;
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b1) begin
      $display("MSIM> Reset is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DONE (countdown output) should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b1) begin
      $display("MSIM> Reset is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DONE (countdown output) should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    // test to see if load is ignored during reset
    TEST_LOAD = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b1) begin
      $display("MSIM> Reset while load asserted is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Reset while load asserted is incorrect. DONE (countdown output) should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b1) begin
      $display("MSIM> Reset is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DONE (countdown output) should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 4 PASSED");
    end
    else begin
      $display("MSIM> TEST 4 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 5: COUNTDOWN LOAD AND COUNT");
    $display("MSIM> ================================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // enable circuit
    RESET = 1'b0;
    
    if(SIGNAL == 1'b1 && DATA == 10'd200) begin
      $display("MSIM> Ready to load, DATA now %3d, DONE now %1b", DATA, SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Not ready to load. DATA should be 200, but is %3d; DONE should be 1, but is %1b", DATA, SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0 && DATA == 10'd700) begin
      $display("MSIM> Load looks correct, DATA now %3d, DONE now %1b", DATA, SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Load is incorrect. DATA should be 700, but is %3d; DONE should be 0, but is %1b", DATA, SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0 && DATA == 10'd350) begin
      $display("MSIM> Load looks correct (read, DATA now %3d, DONE now %1b", DATA, SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Load is incorrect. DATA should be 350, but is %3d; DONE should be 0, but is %1b", DATA, SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    // should have loaded prandom entry 2 (350-cycle countdown); start counting
    TEST_LOAD = 1'b0;
    
    $display("MSIM> Beginning to countdown for 350 cycles...");
    
    for(i = 0; i < 350; i = i + 1) begin
      if(SIGNAL == 1'b1) begin
        $display("MSIM> ERROR: Countdown is incorrect. %3d cycles in, DONE should still be 0, but is %1b", i, SIGNAL);
        currentTestCorrect = 0;
      end

      #100;  // wait a cycle to observe result
    end

    if(SIGNAL == 1'b1) begin
      $display("MSIM> After 350 cycles, countdown is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: After 350 cycles, countdown is incorrect. DONE should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0) begin
      $display("MSIM> Countdown is correct, DOWN now back to %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Countdown is incorrect. DONE should be back to 0, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0) begin
      $display("MSIM> Countdown is correct, DONE now back to %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Countdown is incorrect. DONE should be back to 0, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 2;
      $display("MSIM> TEST 5 PASSED");
    end
    else begin
      $display("MSIM> TEST 5 FAILED (-2 pt)");
    end
    $display("MSIM> ");
    

    $display("MSIM> ");
    $display("MSIM> TEST 6: COUNTDOWN COUNT AGAIN");
    $display("MSIM> =============================");
    $display("MSIM> ");
    
    currentTestCorrect = 1;
   
    // reset circuit
    RESET = 1'b1;
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b1) begin
      $display("MSIM> Reset is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Reset is incorrect. DONE (countdown output) should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    // enable circuit and load first value
    RESET = 1'b0;
    TEST_LOAD = 1'b1;
    
    if(SIGNAL == 1'b1 && DATA == 10'd200) begin
      $display("MSIM> Ready to load, DATA now %3d, DONE now %1b", DATA, SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Not ready to load. DATA should be 200, is %3d; DONE should be 1, is %1b", DATA, SIGNAL);
      currentTestCorrect = 0;
    end
        
    #100;  // wait a cycle to observe result
    
    // should have loaded prandom entry 0 (200-cycle countdown); start counting
    TEST_LOAD = 1'b0;
    
    $display("MSIM> Beginning to countdown for 200 cycles...");
    
    for(i = 0; i < 200; i = i + 1) begin
      if(SIGNAL == 1'b1) begin
        $display("MSIM> ERROR: Countdown is incorrect. %3d cycles in, DONE should still be 0, but is %1b", i, SIGNAL);
        currentTestCorrect = 0;
      end

      #100;  // wait a cycle to observe result
    end

    if(SIGNAL == 1'b1) begin
      $display("MSIM> After 200 cycles, countdown is correct, DONE (countdown output) now %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: After 200 cycles, countdown is incorrect. DONE should be 1, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0) begin
      $display("MSIM> Countdown is correct, DONE now back to %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Countdown is incorrect. DONE should be back to 0, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    #100;  // wait a cycle to observe result
    
    if(SIGNAL == 1'b0) begin
      $display("MSIM> Countdown is correct, DONE now back to %1b", SIGNAL);
    end
    else begin
      $display("MSIM> ERROR: Countdown is incorrect. DONE should be back to 0, but is %1b", SIGNAL);
      currentTestCorrect = 0;
    end
    
    $display("MSIM> ");
    if(currentTestCorrect == 1) begin
      numTestsPassed = numTestsPassed + 1;
      $display("MSIM> TEST 6 PASSED");
    end
    else begin
      $display("MSIM> TEST 6 FAILED (-1 pt)");
    end
    $display("MSIM> ");
    

    // print final score
    $display("MSIM> ");
    $display("MSIM> PreLab 3a Score: %2d / 7", numTestsPassed);
     
    // Since the clock (see above) always keeps alternating, the test bench will never run out
    // of things to do.  As a result, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
`endif
  end 

endmodule
