#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Аргументы не даны."
    exit 1
fi

args=0
while [[ -n $1 ]]
do
    case $1 in
    -f) if [[ -z $2 ]]; then
        echo "Не передан файл в входными данными."
    else
        echo "Найден файл с данными $2."
        input=$2
        args=$(($args+1))
        shift
    fi;;
    -o) if [[ -z $2 ]]; then 
        echo "Не передан файл выходных данных."
    else
        echo "Найден файл вывода $2."
        output=$2
        args=$(($args+1))
        shift
    fi;;
    -t) if [[ -z $2 ]]; then 
        echo "Не указано число бюджетных мест."
    else
        echo "Кол-во бюджетных мест: $2."
        budgets=$2
        args=$(($args+1))
        shift
    fi;;
    *) echo "Неизвестный аргумент $1."
    shift;;
    esac
    shift
done 

if [[ $args -lt 3 ]]; then
    echo "Не передан один из аргументов..."
    exit 1
fi