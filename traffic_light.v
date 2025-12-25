module traffic_light(state,count,clk,rst);
input clk,rst;
output reg[3:0]count;
output reg[2:0]state;
// Output signals for the lights

parameter [2:0] north_G= 3'b000,north_Y=3'b001,  
                east_G=3'b010,east_Y=3'b011,
                south_G =3'b100,south_Y=3'b101,
                west_G=3'b110 ,west_Y=3'b111;



always @(posedge clk or posedge rst) begin 
    if (rst) begin
        state <= north_G;
        count <= 4'b0000;
    end 
    else begin 
        case(state)
        // north-------------------
            north_G: begin
                if(count == 4'b1111) begin
                    count <= 4'b0000;
                    state <= north_Y;
                end else begin
                    count <= count + 1;
                    state <= north_G;
                end
            end
            north_Y: begin
                if(count == 4'b0100) begin
                    count <= 4'b0000;
                    state <= east_G;
                end else begin
                    count <= count + 1;
                    state <= north_Y;
                end
            end
            // east---------------- 
            east_G: begin
                if(count == 4'b1111) begin
                    count <= 4'b0000;
                    state <= east_Y;
                end else begin
                    count <= count + 1;
                    state <= east_G;
                end
            end 
            east_Y: begin
                if(count == 4'b0100) begin
                    count <= 4'b0000;
                    state <=south_G ;
                end else begin
                    count <= count + 1;
                    state <= east_Y;
                end
            end
            south_G: begin
                if(count == 4'b1111) begin
                    count <= 4'b0000;
                    state <= south_Y;
                end else begin
                    count <= count + 1;
                    state <= south_G;
                end
            end
            south_Y: begin
                if(count == 4'b0100) begin
                    count <= 4'b0000;
                    state <=west_G ;
                end else begin
                    count <= count + 1;
                    state <= south_Y;
                end
            end
            west_G: begin
                if(count == 4'b1111) begin
                    count <= 4'b0000;
                    state <= west_Y;
                end else begin
                    count <= count + 1;
                    state <= west_G;
                end
            end
            west_Y: begin
                if(count == 4'b0100) begin
                    count <= 4'b0000;
                    state <=north_G ;
                end else begin
                    count <= count + 1;
                    state <= west_Y;
                end
            end
            default: state <= north_G; 
        endcase
    end
end
endmodule