# comentarios
# sumados.asm (asm es la extension de assembly)
# El programa suma dos enteros entrados por el usuario y muestra el resultado
# en el .data van variables y en el .txt instrucciones
# .asciiz = string
# globl significa q el main se puede invocar afuera del programa, osea q el JVM lo ejecute 
# li = loadImidiate
#la = load address
#syscall llamada al sistema operativo.. busca lo q esta en v0 




          .data
mensaje1: .asciiz "Entre el primer numero: "
mensaje2: .asciiz "Entre el segundo numero: "
mensaje3: .asciiz "La suma es: "
      
          .text
	  .globl main
	  
	  
main:	  li $v0, 4    # codigo para mostrar string, se guarda 4 en el registro
	  la $a0, mensaje1 # dirreccion del mensaje 1 en a0
	  syscall
	  
	  li $v0, 5   # codigo para leer enteros
	  syscall  # lee el entero y coloca en $v0
	  
	  move $t0, $v0 # moviendo de v0 a t0
	  
	  li $v0, 4    # codigo para mostrar string, se guarda 4 en el registro
	  la $a0, mensaje2 # dirreccion del mensaje 2 en a0
	  syscall
	  
	  li $v0, 5   # codigo para leer enteros
	  syscall  # lee el entero y coloca en $v0
	  
	  move $t1, $v0 # moviendo de v0 a t1
	  
	  add $t2, $t1, $t0 # se guarda el resultado en t2
	  
	  li $v0, 4    # codigo para mostrar string, se guarda 4 en el registro
	  la $a0, mensaje3 # dirreccion del mensaje 3 en a0
	  syscall
	  
	  li $v0, 1  # codigo para mostrar entero
	  move $a0, $t2  # es move para el entero
	  syscall
	  
	  li $v0, 10 # codigo para terminar
	  syscall # termina ejecucion
