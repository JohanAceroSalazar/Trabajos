package main

import "fmt"

type Atributos struct {
	Nombre string
	edad   int
}

func NewAtributos(nombre string, edad int) Atributos {
	return Atributos{Nombre: nombre, edad: edad}
}

func (a Atributos) Caminar() {
	fmt.Printf("%s está caminando en el parque y tiene %d años\n", a.Nombre, a.edad)
}

type Coche struct {
	Marca     string
	color     string
	Velocidad int
}

func NewCoche(marca string, color string, velocidad int) Coche {
	return Coche{Marca: marca, color: color, Velocidad: velocidad}
}

func (c Coche) Acelerar() {
	fmt.Printf("El %s de color %s va a %d km/h\n", c.Marca, c.color, c.Velocidad)
}

type Libro struct {
	Titulo  string
	autor   string
	Paginas int
}

func NewLibro(titulo string, autor string, paginas int) Libro {
	return Libro{Titulo: titulo, autor: autor, Paginas: paginas}
}

func (l Libro) MostrarInfo() {
	fmt.Printf("El libro '%s' fue escrito por %s y tiene %d páginas.\n", l.Titulo, l.autor, l.Paginas)
}

type Celular struct {
	Marca  string
	modelo string
	Precio float64
}

func NewCelular(marca string, modelo string, precio float64) Celular {
	return Celular{Marca: marca, modelo: modelo, Precio: precio}
}

func (c Celular) MostrarDatos() {
	fmt.Printf("Celular %s modelo %s cuesta $%.2f\n", c.Marca, c.modelo, c.Precio)
}

func main() {
	p1 := NewAtributos("Johan", 18)
	p1.Caminar()

	c1 := NewCoche("Audi", "rojo", 300)
	c1.Acelerar()

	l1 := NewLibro("Don Quijote", "Gabriel Garcia", 280)
	l1.MostrarInfo()

	c2 := NewCelular("Samsung", "15", 1500000)
	c2.MostrarDatos()
}