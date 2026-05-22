module stimulus;

parameter T = 20;

reg [31:0] dataIn;
reg [1:0] opsel;
reg [2:0] outsel;
reg [4:0] addressA, addressB;
reg asel, bsel, oen, clk;

wire [31:0] outPut;
wire over;


integer handle3,desc3;

// Instantiate the design block counter
cpu proj(addressA, addressB, dataIn, asel,bsel, clk, opsel, outsel, oen, outPut, over);
initial
begin
clk = 1'b1;
forever #T  clk = ~clk;
end

initial
 begin
handle3 = $fopen ("stim_proj.out");
  $shm_open("shm.db",1);
  $shm_probe(stimulus,"AS");
  #1200  $shm_close();
  #1 $finish;
  end


always
begin
desc3=handle3;
#1 $fdisplay(desc3, $time,"clk=%b, addressA=%d, addressB=%d, dataIn=%d, opsel=%d, outsel=%d, asel=%d, bsel=%d, oen=%d, OUT=%d", clk, addressA, addressB, dataIn, opsel, outsel,asel, bsel, oen, outPut);

end

 // Stimulate the Input Signals
initial
 begin

// 1. store [0] = 0920_1919 

#T

addressA = 5'b00000;

addressB = 5'b00000;

dataIn = 32'h0920_1919;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 2. store [1] = 7777_8888

addressA=5'b00000;

addressB= 5'b00001;

dataIn = 32'h7777_8888;

opsel = 2'b01;

outsel = 3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 3. store [2] = 8888_7777

addressA = 5'b00000;

addressB = 5'b00010;

dataIn = 32'h8888_7777;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 4. store [3] = 0101_0101

addressA = 5'b00000;

addressB = 5'b00011;

dataIn = 32'h0101_0101;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)

// 5. Store [4] = 1010_1010

addressA = 5'b00000;

addressB = 5'b00100;

dataIn = 32'h1010_1010;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 6. Store [5] = FFFF_FFFF

addressA = 5'b00000;

addressB = 5'b00101;

dataIn = 32'hFFFF_FFFF;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 7. Store [6] = 0011_2233

addressA = 5'b00000;

addressB = 5'b00110;

dataIn = 32'h0011_2233;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)

// 8. Store [7] = 3322_1100 

addressA = 5'b00000;

addressB = 5'b00111;

dataIn = 32'h3322_1100;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 9. Store [8] = 1203_1818

addressA = 5'b00000;

addressB = 5'b01000;

dataIn = 32'h1203_1818;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 10. Store [9] = 0704_1776

addressA = 5'b00000;

addressB = 5'b01001;

dataIn = 32'h0704_1776;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)


// 11. Store [10] = 0304_1837

addressA = 5'b00000;

addressB = 5'b01010;

dataIn = 32'h0304_1837;

opsel = 2'b01;

outsel =3'b000;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)




//12. ADD [1][2] = [7777_8888] + [8888_7777] = FFFFFFFF	
addressA = 5'd1;

addressB = 5'd2;

dataIn = 32'd0;

opsel = 2'b00;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//13. ADD [4][3] = [1010_1010] + [0101_0101] = 11111111   	
addressA = 5'd4;

addressB = 5'd3;

dataIn = 32'd0;

opsel = 2'b00;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//14. ADD [7][6] = [3322_1100] + [0011_2233] = 33333333  	
addressA = 5'd7;

addressB = 5'd6;

dataIn = 32'd0;

opsel = 2'b00;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)



//15. CMP  [2][5] = [8888_7777] [FFFF_FFFF] 
addressA = 5'd2;

addressB = 5'd5;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b100;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//16. ADD [1][4] = 7777_8888 + 1010_1010 = 87879898  
addressA = 5'd1;

addressB = 5'd4;

dataIn = 32'd0;

opsel = 2'b00;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//17. SUB [2][1] = 8888_7777 - 7777_8888 = 1110EEEF
addressA = 5'd2;

addressB = 5'd1;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//18. SUB [6][3] = [0011_2233]-[0101_0101] = -EFDECE
addressA = 5'd6;

addressB = 5'd3;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b001;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


//19. READ [1] = 7777_8888  
addressA = 5'd1;

addressB = 5'd1;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//20. READ  [0] = 0920_1919
addressA = 5'd0;

addressB = 5'd0;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//21. READ [8] = [1203_1818]  
addressA = 5'd8;

addressB = 5'd8;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//22. READ [9] =  0704_1776   
addressA = 5'd9;

addressB = 5'd9;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//23. READ [10] =  0304_1837 
addressA = 5'd10;

addressB = 5'd10;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//24. READ [2] = 8888_7777   
addressA = 5'd2;

addressB = 5'd2;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//25. READ [3] = 0101_0101 
addressA = 5'd3;

addressB = 5'd3;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//26. READ [6] = 0011_2233
addressA = 5'd6;

addressB = 5'd6;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//27. READ [5] =  FFFF_FFFF    
addressA = 5'd5;

addressB = 5'd5;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


// 28. CMP [1][3] = [7777_8888][8888_7777]

addressA = 5'd1;

addressB = 5'd3;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b100;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


// 29. CMP [5][4] = [FFFF_FFFF][1010_1010]

addressA = 5'd5;

addressB = 5'd4;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b100;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


// 30. CMP [10][9] =  [0304_1837][0704_1776]

addressA = 5'd10;

addressB = 5'd9;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b100;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)


// 31. READ [5] = FFFF_FFFF  

addressA = 5'd5;

addressB = 5'd5;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//32. READ  [3] = 0101_0101   
addressA = 5'd3;

addressB = 5'd3;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//33. READ [4] = 1010_1010   
addressA = 5'd4;

addressB = 5'd4;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)


//21. READ [9] =  0704_1776  
addressA = 5'd9;

addressB = 5'd9;

dataIn = 32'd0;

opsel = 2'b01;

outsel =3'b000;

asel = 1;

bsel = 0;

oen = 1;



end
endmodule
