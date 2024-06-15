module tb_CLA();

    // Signals
    reg [3:0] A, B;
    reg SEL;
    wire [3:0] SUM;
    wire C_OUT;
	 wire OVERFLOW ;
	 

    // Instantiate the module under test
    CLA uut (
        .sum(SUM),
        .c_out(C_OUT),
        .a(A),
        .b(B),
        .SEL(SEL),
		  .overflow(OVERFLOW)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 4'b1010;  // Example initial values
        B = 4'b0110;
        SEL = 0;  // Start with addition
        
        // Print initial state

        // Test scenario 1: Addition
        #10;
        A = 4'b1111;
        B = 4'b0001;
        SEL = 0;
        $monitor($time, " ns: SEL=%b, A=%b, B=%b, SUM=%b, C_OUT=%b, OVERFLOW = %b", SEL, A, B, SUM, C_OUT, OVERFLOW);
        
        // Test scenario 2: Subtraction with borrow
        #10;
        A = 4'b1001;
        B = 4'b1100;
        SEL = 1;

        // Test scenario 3: Subtraction without borrow
        #10;
        A = 4'b1011;
        B = 4'b0010;
        SEL = 1;

        // Add more test scenarios as needed
        
        // Finish simulation after a delay
        #10;
        $finish;
    end

endmodule
