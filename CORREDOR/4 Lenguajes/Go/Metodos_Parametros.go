package main

import "fmt"

func sumar(a int, b int) {
	resultado := a + b
	fmt.Println("La suma es:", resultado)
}

func restar(a int, b int) {
	resultado := a - b
	fmt.Println("La resta es:", resultado)
}

func areaTriangulo(base int, altura int) {
	resultado := (base * altura) / 2
	fmt.Println("El área del triángulo es:", resultado)
}

func promedio(a int, b int, c int) {
	resultado := a + b + c
	prom := resultado / 3
	fmt.Println("El promedio es:", prom)
}

func main() {
	sumar(8, 7)
	restar(18, 5)
	areaTriangulo(8, 6)
	promedio(9, 18, 12)
}