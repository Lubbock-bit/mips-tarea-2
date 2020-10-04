.data

.text
.globl main

main:
#Settea los argumentos
li $a0, 1 #c = 1
li $a2, 5  #n = (numero a factorear)
li $a3, 1 #f = 1

jal fact # llama a fact

exit: # Sale del programa
li $v0, 10
syscall

fact:
loop:
bgt $a0, $a2, print # if c >= n jump print(sale del loop)

#  f = f * c;
mult  $a3, $a0  #Multiplica a3, a0
mflo  $a3   # lo guarda en v0

addi  $a0, $a0, 1  # Suma 1 a C cada vez que se itera el ciclo
j loop #reitera el ciclo

print:
# Imprime F
move $a0, $a3 # Guarda a3 en a0 para imprimir F
li $v0, 1 # Carga 1 en v0 (instruccion para imprimir un int)
syscall # Imprime F
move $v0, $a0 # Devuelve v0

jr $ra # return F (v0)
