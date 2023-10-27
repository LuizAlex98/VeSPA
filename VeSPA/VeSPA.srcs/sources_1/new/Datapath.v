`timescale 1ns / 1ps
`include "DATA_FORMATS.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 12:48:00 AM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Definição de opcode e condition codes

//Declaração de parâmetros globais

//Declaração de elementos de armazenamento no ISA
module Datapath(
        input clk,
        input rst,
        
        input ir_load,       
        input pc_load,
        input pc_inc, // Verificar se o program counter salta para a próxima instrução
        //input branch_bit, //Verificar que tipo de valor de offset o program counter irá receber para saltar
        
       
        
        input reg_write,
        input reg_read,
        //input [2:0]IRmux,
        //put readLoad,
        //input readWrite,
        
        //input control_bit_subt,
        //input control_bit_immd,
        //input [WIDTH-1:0]data_from_alu,
        //input data_from_reg,
                
        output [4:0]opcode,   
        output reg [31:0]operand1,
        output reg [31:0]operand2,
        output reg [31:0]result
       );
    
    parameter WIDTH = 32;  //width of the data bus
    parameter NUMREGS = 32; //number of the registers of the ISA
    parameter MEMSIZE = (1<<13); //memory size

    
    
   //ELEMENTOS DE ARMAZENAMENTO DO ISA 
    reg [WIDTH-1:0]MEM [0:MEMSIZE-1]; // ARRAY DE 8 BITS 
    reg [WIDTH-1:0]R [0:NUMREGS-1];
    reg [WIDTH-1:0]PC;
    reg [WIDTH-1:0]IR;
    reg C; 
    reg V;
    reg Z;
    reg N;

assign opcode = IR[31:27]; //decode
assign rsdt = IR[26:22];
assign rs1 = IR[21:17];
assign rs2 = IR[15:11];

//assign IMM_OP = IR[16];
//assign immed23 = IR[22:0];
//assign immed22 = IR[21:0];
//assign immed17 = IR[16:0];
//assign immed16 = IR[15:0];
//assign cond = IR[26:23];

//Ciclo principal do fetch-execute
always@(posedge clk)
begin
//    MEM[0] = 32'b0000100011000010000100000000000; // ADD
//    MEM[1] = 32'b0001000011000010000100000000000; // SUB
//    R[1] = 'd5;
//    R[2] = 'd4;
    if(pc_inc && ir_load) //fetch
    begin
    
    IR = MEM[PC];
    PC = PC + 1;
    end
    
    else if(reg_read) //Operação aritmética ou lógica
    begin
    operand1 <= R[rs1]; //passagem do valor do registo com endereço 'rs1' para a saída operand1
    operand2 <= R[rs2]; //passagem do valor do registo com endereço 'rs2' para a saída operand2
    //////////////////////////////////////////////////////////////////////////////////////////
     case (opcode)    
    `ADD: begin result = operand1 + operand2; end
    `SUB: begin result = operand1 - operand2; end
    `OR: begin result = operand1 | operand2; end
    `XOR: begin result = operand1 ^ operand2; end
    `AND: begin result = operand1 & operand2; end
    `NOT: begin result = ~operand1; end
    `CMP: begin Z = (operand1 - operand2) ? 1'b0 : 1'b1; end 
        endcase
    if(opcode != `CMP) begin //uma vez que a instrução compare não guarda valor na variavel 'result',
    // é nessário criar esta condição para o valor result da operação anterior não afetar o registo após a instrução compare
        Z = ~(|result[31:0]); //Colocar bit Z = 1, caso o result = 0
        end
     //////////////////////////////////////////////////////////////////////////////////////// 
    end
    
    else if(reg_write)
    begin
    R[rsdt] <= result;
    end
    
end

//ARITMETIC_LOGIC_UNITY ALU(clk,rst,operand1,operand2,opcode,reg_write,result,Z,C,N,V);

endmodule
//Definições de funções e tarefas

//Funções e operações auxiliares




//Ciclo principal do fetch-execute


//Definições de funções e tarefas


//Funções e operações auxiliares

