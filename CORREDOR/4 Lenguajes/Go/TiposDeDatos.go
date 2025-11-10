package main

import "fmt"

func main() {

	var edad byte = 25
	var año int16 = 2025
	var poblacion int = 500000
	var distancia int64 = 9876543210
	var letra rune = 'A' // rune representa un carácter Unicode

	fmt.Println("Tipos Enteros")
	fmt.Println("Edad:", edad)
	fmt.Println("Año:", año)
	fmt.Println("Población:", poblacion)
	fmt.Println("Distancia:", distancia)
	fmt.Printf("Letra: %c\n", letra)

	var precio float32 = 19.99
	var peso float64 = 70.45
	fmt.Println("\nTipos Decimales")
	fmt.Println("Precio:", precio)
	fmt.Println("Peso:", peso)

	nombre := "Johan"
	saludo := "Hola, ¿cómo estás?"
	curso := "Programación en Go"
	ciudad := "Bogotá"
	frase := "El conocimiento es poder"

	fmt.Println("Tipo Texto")
	fmt.Println(nombre)
	fmt.Println(saludo)
	fmt.Println(curso)
	fmt.Println(ciudad)
	fmt.Println(frase)

	esMayorDeEdad := true
	tieneLicencia := false
	aprobado := true
	encendido := false
	accesoPermitido := true

	fmt.Println("Tipo Booleano")
	fmt.Println("Mayor de edad:", esMayorDeEdad)
	fmt.Println("Tiene licencia:", tieneLicencia)
	fmt.Println("Aprobado:", aprobado)
	fmt.Println("Encendido:", encendido)
	fmt.Println("Acceso permitido:", accesoPermitido)

	binario1 := byte(0b1010)
	binario2 := byte(0b1100)
	binario3 := int(0b1111)
	binario4 := int(0b100000)
	binario5 := "101010"

	fmt.Println("Tipo Binario")
	fmt.Println("Binario 1:", binario1)
	fmt.Println("Binario 2:", binario2)
	fmt.Println("Binario 3:", binario3)
	fmt.Println("Binario 4:", binario4)
	fmt.Println("Binario 5 (texto):", binario5)
}