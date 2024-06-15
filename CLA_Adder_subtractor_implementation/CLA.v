module CLA(sum, c_out, a, b, SEL,overflow);//SEL for choose subtraction or addition
input [3:0] a, b ;
input SEL;
output reg [3:0] sum ;
output reg c_out, overflow;
reg p0, p1, p2, p3 ;
reg g0, g1, g2, g3 ;
reg [3:0] b_mod ;
reg c_in ;



always @(*)
begin
	 overflow = 0; // initially 
    if (SEL)
    begin
        b_mod = ~b;
        c_in = 1 ;
        // Generate the propagate and generate signals
        p0 = a[0]^b_mod[0];
        p1 = a[1]^b_mod[1];
        p2 = a[2]^b_mod[2];
        p3 = a[3]^b_mod[3] ;
        g0 = a[0]&b_mod[0];
        g1 = a[1]&b_mod[1];
        g2 = a[2]&b_mod[2];
        g3 = a[3]&b_mod[3] ;
        sum[0] = p0^c_in;
        sum[1] = p1^((p0&c_in)|g0);
        sum[2] = p2^((p1&p0&c_in)|(p1&g0)|g1);
        sum[3] = p3^((p2&p1&p0&c_in)|(p2&p1&g0)|(p2&g1)|g2) ;
        c_out = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c_in);
    end
    else
    begin
        c_in = 0 ;
        p0 = a[0]^b[0];
        p1 = a[1]^b[1];
        p2 = a[2]^b[2];
        p3 = a[3]^b[3] ;
        g0 = a[0]&b[0];
        g1 = a[1]&b[1];
        g2 = a[2]&b[2];
        g3 = a[3]&b[3] ;
        sum[0] = p0^c_in;
        sum[1] = p1^((p0&c_in)|g0);
        sum[2] = p2^((p1&p0&c_in)|(p1&g0)|g1);
        sum[3] = p3^((p2&p1&p0&c_in)|(p2&p1&g0)|(p2&g1)|g2) ;
        c_out = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c_in);
    end
	 if (sum[3] != a [3])
    begin 
		  overflow = 1 ;
        $monitor("Overflow has occured");
    end  
end 

endmodule