###########################################################
# Assignment #: 3
#  Name: Matthew Groholski
#  ASU email: mgrohols@asu.edu
#  Course: CSE/EEE230, TTh 3PM
#  Description: -write a MIPS assembly language program to: 
#               -perform arithmetic and logical operations on variables 
#               -use syscall operations to display integers and strings on the console window 
#               -use syscall operations to read integers from the keyboard.
###########################################################
.data
m1: .asciiz "Enter a value:\n"
m2: .asciiz "Enter another value:\n"
m3: .asciiz "Enter one more value:\n"
m4: .asciiz "num2+num4="
m5: .asciiz "\nnum4-num1="
m6: .asciiz "\nnum2*num3="
m7: .asciiz "\nnum1/num4="
m8: .asciiz "\nnum4 mod num3="
m9: .asciiz "\n((num3 / num2) - 7) * (num4 mod num1)="
.text
.globl main

main:
    #Prints the first prompt
    li $v0, 4
    la $a0, m1
    syscall
    
    #Reads in first number
    li $v0, 5
    syscall
    move $t0, $v0

    #Prints and reads the second
    li $v0, 4
    la $a0, m2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    #Prints and reads the third
    li $v0, 4
    la $a0, m3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    #Prints and reads the fourth
    li $v0, 4
    la $a0, m3
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    #num2+num4
    li $v0, 4
    la $a0, m4
    syscall 
    li $v0, 1
    add $a0, $t1, $t3
    syscall

    #num4-num1
    li $v0, 4
    la $a0, m5
    syscall
    li $v0, 1
    sub $a0, $t3, $t0
    syscall

    #num2*num3
    li $v0, 4
    la $a0, m6
    syscall
    li $v0, 1
    mult $t1, $t2
    mflo $a0
    syscall

    #num1/num4
    li $v0, 4
    la $a0, m7
    syscall
    li $v0, 1
    div $t0, $t3
    mflo $a0
    syscall

    #num4 mod num3
    li $v0, 4
    la $a0, m8
    syscall
    li $v0, 1
    div $t3, $t2
    mfhi $a0
    syscall

    #final arith
    li $v0, 4
    la $a0, m9
    syscall
    li $v0, 1
    div $t2, $t1
    mflo $a1
    addi $a1, $a1, -7
    div $t3, $t0
    mfhi $a2
    mult $a1, $a2
    mflo $a0
    syscall

    jr $ra