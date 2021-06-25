# Este programa pide al usuario que entre 10 digitos enteros y luego muestra cual de todos resulto ser el mayor.


		.data
mensaje1:	.asciiz "Entre el primer numero:"
mensaje2:	.asciiz "Entre el segundo numero:"
mensaje3:	.asciiz "Entre el tercer numero:"
mensaje4:	.asciiz "Entre el cuarto numero:"
mensaje5:	.asciiz "Entre el quinto numero:"
mensaje6:	.asciiz "Entre el sexto numero:"
mensaje7:	.asciiz "Entre el septimo numero:"
mensaje8:	.asciiz "Entre el octavo numero:"
mensaje9:	.asciiz "Entre el noveno numero:"
mensaje10:	.asciiz "Entre el decimo numero:"
mensajeF:	.asciiz "El numero mayor es:"
array:		.word 0: 10
size:		.word 10

		.text
		.globl main
		
main:		 li $v0, 4    		# codigo para mostrar string
	 	 la $a0, mensaje1 	# dirreccion del mensaje 1 en a0
	 	 syscall
	 	 
	 	 li $v0, 5   		# codigo para leer enteros
	  	 syscall  		# lee el entero y coloca en $v0
	  
	  	 move array, $v0	# moviendo de v0 a t0
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje2 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t1, $v0		 
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje3 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t2, $v0		
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje4 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t3, $v0		 
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje5 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t4, $v0		
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje6 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t5, $v0		
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje7 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t6, $v0		 
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje8 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t7, $v0		 
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje9	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t8, $v0		 
	  	 
	  	 li $v0, 4    		
	 	 la $a0, mensaje10 	
	 	 syscall
	 	 
	 	 li $v0, 5   		
	  	 syscall  		
	  
	  	 move $t9, $v0		
	  	 


max: 		move $v0,$a0
		lw $v1,0($v0)
		beq $a0,$a1,ret
		move $t0,$a0

loop:		addi $t0,$t0,4
		lw $t1,0($t0)
		ble $t1,$v1,skip
		move $v0,$t0
		move $v1,$t1
		
skip:		bne $t0,$a1,loop
ret:		jr $ra
	  	 
out:		li $v0, 4    		# codigo para mostrar string, se guarda 4 en el registro
	  	la $a0, mensajeF 	# dirreccion del mensaje 3 en a0
	  	syscall
	  
	  	li $v0, 1  	# codigo para mostrar entero
	  	move $a0, $ra  	# es move para el entero
	  	syscall
	  
	  	li $v0, 10 	# codigo para terminar
	  	syscall 	# termina ejecucion
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 
	  	 