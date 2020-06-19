#!/bin/bash

echo -n "Введите три стороны треугольника через пробел: "

read a b c

re='^[0-9]+([.][0-9]+)?$'

if ! [[ $a =~ $re && $b =~ $re && $c =~ $re ]]; then
        echo "Ошибка ввода! Необходимо ввести не более и не менее 3х чисел!" >&2
        exit 1
fi

if [ $a -le 0 -o $b -le 0 -o $c -le 0 ]; then
        echo "Числа должны быть больше 0" >&2
        exit 1
fi

let ab=$a+$b
let bc=$b+$c
let ac=$a+$c

if ! [ $ab -gt $c -a $bc -gt $a -a $ac -gt $b ]; then
        echo "Числа $a $b $c не могут быть сторонами треугольника" >&2
        exit 1
fi

if [ $a -eq $b -a $b -eq $c -a $a -eq $c ]; then
        echo "Равносторонний треугольник"
        exit 0
fi

if [ $a -eq $b -o $b -eq $c -o $a -eq $c ]; then 
        echo "Равнобедренный треугольник"
        exit 0
fi

echo "Разносторонний треугольник"

exit 0
