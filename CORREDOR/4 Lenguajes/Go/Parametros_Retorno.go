package main

import "fmt"

// ----- Estructura ParametrosRetorno -----
type ParametrosRetorno struct{}

func (p ParametrosRetorno) Multiplicar(x int, y int) int {
	return x * y
}

func (p ParametrosRetorno) Division(x int, y int) int {
	return x / y
}

func (p ParametrosRetorno) Suma(x int, y int) int {
	return x + y
}

func (p ParametrosRetorno) Resta(x int, y int) int {
	return x - y
}

func main() {
	calc := ParametrosRetorno{}

	resultado := calc.Multiplicar(4, 2)
	fmt.Println("La multiplicación es:", resultado)

	resultado2 := calc.Division(40, 10)
	fmt.Println("La división es:", resultado2)

	resultado3 := calc.Suma(8, 15)
	fmt.Println("La suma es:", resultado3)

	resultado4 := calc.Resta(15, 20)
	fmt.Println("La resta es:", resultado4)
}