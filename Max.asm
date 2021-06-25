# Luis A. Flores Carrubio (841-10-2500)
# Comparar y mostrar el numero mayor

		.data
		
arreglo:	.word 0       
str: 		.byte 0x0A 0x0 
mensaje1:	.asciiz "Ponga la cantidad del arreglo : "
mensaje2:	.asciiz "Ponga los numeros del arreglo : \n"
mensaje3:	.asciiz "Escoge una opcion: \npresiona l para obtener el numero mas grande \npresiona 2 para obtener el numero mas pequeno "
mensaje4:	.asciiz "El numero mas grande es:  "
mensaje5:	.asciiz "El numero mas pequeno es:  "
mensaje6:	.asciiz "Su eleccion es incorrecta, por favor intentelo de nuevo \n  "
mensaje7:	.asciiz "\t\t\t\t\nGracias."


		.text
		.globl main

main:      	li $v0, 4 
      		la $a0, mensaje1
      		syscall
      		li $v0, 5 
      		syscall

      		move $s3, $v0 
      		move $t0, $v0 
      		move $t1, $v0 
      		li $v0, 4 
      		la $a0,mensaje2
      		syscall

      		la $t3, arreglo 


nivel1:		beq $zero, $t0, out 
      		li $v0, 5
      		syscall

      		sw $v0, 0($t3) 
      		addi $t3, $t3, 4 
      		addi $t0, $t0,-1 
      		j nivel1


out:		lw $t3, arreglo
      		la $s0, arreglo 
      		move $s1,$t3 
      		move $s2,$t3 

nivel2:		beq $t1,$zero, out2 
      		slt $t0, $s1, $t3 
     		beq $t0 ,$zero, more
      		move $s1, $t3 
      		j here




more:		slt $t0, $t3, $s2
      		beq $t0 ,$zero, here
      		move $s2,$t3
      		j here



here:		addi $s0, $s0, 4
      		lw $t3, 0($s0) 
      		addi $t1, $t1 ,-1
      		j nivel2


out2:		li $v0, 4 
      		la $a0, mensaje3
      		syscall

      		li $s6,1 
      		li $s7,2 
      		li $v0,5 
      		syscall

      		beq $s6,$v0,maximo 
      		beq $s7,$v0,minimo 
      		li $v0, 4 
      		la $a0, mensaje6
      		syscall
      		j out2

maximo:		li $v0, 4 
      		la $a0, mensaje4
      		syscall
      		li $v0, 1 
      		move $a0, $s1
      		syscall
      		j exit

minimo:		li $v0, 4 
      		la $a0, mensaje5
      		syscall
      		li $v0, 1 
      		move $a0, $s2
      		syscall
      		j exit

exit:		li $v0, 4 
      		la $a0, str
      		syscall
      		li $v0, 4 
      		la $a0, mensaje7
      		syscall
      		li $v0, 10
      		syscall 
