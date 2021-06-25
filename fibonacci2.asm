# Luis A. Flores Carrubio (841-10-2500)
# Programa Fibonacci

		.data
arreglo:	.word  0 : 20        
size: 		.word  20             
		
		.text
		.globl main
main:
		
      		la   $s0, arreglo       
      		la   $s5, size       
      		lw   $s5, 0($s5)
      		      
      		li   $s2, 1           
      		sw   $s2, 0($s0)      
      		sw   $s2, 4($s0)      
      		addi $s1, $s5, -2     
      
      
loop: 		lw   $s3, 0($s0)      
      		lw   $s4, 4($s0)      
      		add  $s2, $s3, $s4    
      		sw   $s2, 8($s0)      
      		addi $s0, $s0, 4      
      		addi $s1, $s1, -1    
      		bgtz $s1, loop        
      
   
      		la   $a0, arreglo       
      		add  $a1, $zero, $s5  
      		jal  imprimir            

 
      		li   $v0, 10          
      		syscall               
		

      		.data
espacio:	.asciiz  " "          
mensaje:	.asciiz  "Los numeros son:\n"
      		.text
      		
imprimir:	add  $t0, $zero, $a0  
      		add  $t1, $zero, $a1  
      		la   $a0, mensaje        
      		li   $v0, 4          
      		syscall              
      
out:  		lw   $a0, 0($t0)  
      		li   $v0, 1        
      		syscall             
      
      		la   $a0, espacio      
      		li   $v0, 4         
      		syscall              
      
      		addi $t0, $t0, 4      
      		addi $t1, $t1, -1     
      		bgtz $t1, out         
      
      		jr   $ra             
