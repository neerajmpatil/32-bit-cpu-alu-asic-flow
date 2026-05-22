module stimulus;

parameter T = 20;

reg [31:0] dataIn;
reg [1:0] opsel, outsel;
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
    #1000  $shm_close();
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
    // Store operations
    store(5'd0, 32'h0920_1919);
    store(5'd1, 32'h7777_8888);
    store(5'd2, 32'h8888_7777);
    store(5'd3, 32'h0101_0101);
    store(5'd4, 32'h1010_1010);
    store(5'd5, 32'hFFFF_FFFF);
    store(5'd6, 32'h0011_2233);
    store(5'd7, 32'h3322_1100);
    store(5'd8, 32'h1203_1818);
    store(5'd9, 32'h0704_1776);
    store(5'd10, 32'h0304_1837);

    // Add and Subtract operations
    operate(5'd1, 5'd2, 2'b00); // ADD [1][2]
    operate(5'd4, 5'd3, 2'b00); // ADD [4][3]
    operate(5'd7, 5'd6, 2'b00); // ADD [7][6]
    operate(5'd2, 5'd5, 2'b01); // SUB [2][5]
    operate(5'd1, 5'd4, 2'b00); // ADD [1][4]
    operate(5'd2, 5'd1, 2'b01); // SUB [2][1]
    operate(5'd6, 5'd3, 2'b01); // SUB [6][3]

    // Read operations
    read(5'd1);
    read(5'd0);
    read(5'd8);
    read(5'd9);
    read(5'd10);
    read(5'd2);
    read(5'd3);
    read(5'd6);
    read(5'd5);
end

// Task for store operation
task store;
    input [4:0] address;
    input [31:0] data;
    begin
        #(T*2)
        addressA = 5'b00000;
        addressB = address;
        dataIn = data;
        opsel = 2'b01;
        outsel = 2'b00;
        asel = 0;
        bsel = 0;
        oen = 1;
    end
endtask

// Task for add/subtract operation
task operate;
    input [4:0] addr1, addr2;
    input [1:0] operation;
    begin
        #(T*2)
        addressA = addr1;
        addressB = addr2;
        dataIn = 32'd0;
        opsel = operation;
        outsel = 2'b01;
        asel = 1;
        bsel = 1;
        oen = 1;
    end
endtask

// Task for read operation
task read;
    input [4:0] address;
    begin
        #(T*2)
        addressA = address;
        addressB = address;
        dataIn = 32'd0;
        opsel = 2'b01;
        outsel = 2'b00;
        asel = 1;
        bsel = 0;
        oen = 1;
    end
endtask

endmodule
