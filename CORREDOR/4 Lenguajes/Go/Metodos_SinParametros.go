package main

import "fmt"

// ----- Estructura MetodosSinParametros -----
type MetodosSinParametros struct{}

func (m MetodosSinParametros) Arrancar() {
	fmt.Println("El coche ha arrancado.")
}

func (m MetodosSinParametros) Detener() {
	fmt.Println("El coche se ha detenido.")
}

type Persona struct{}

func (p Persona) Saludar() {
	fmt.Println("Hola, mucho gusto!")
}

func (p Persona) Dormir() {
	fmt.Println("La persona está durmiendo...")
}

type Perro struct{}

func (pe Perro) Comer() {
	fmt.Println("El perro está comiendo su comida.")
}

func (pe Perro) Ladrar() {
	fmt.Println("El perro está ladrando ¡Guau guau!")
}

func main() {
	mp := MetodosSinParametros{}
	mp.Arrancar()
	mp.Detener()

	p := Persona{}
	p.Saludar()
	p.Dormir()

	pe := Perro{}
	pe.Comer()
	pe.Ladrar()
}