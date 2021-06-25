# FOR LOOP

# $a0=0;
# For($t0=10; $t0=$t0-1) do {$a0+$t0}

		li 	$a0,0 		# $a0=0
		li 	$t0,10 		# Initialize loop counter to 10

loop:		add 	$a0,$a0,$t0
		addi 	$t0,$t0,-1	# Decrement loop counter
		bgtz	$t0,loop	# If($t0>0) Branch to loop	