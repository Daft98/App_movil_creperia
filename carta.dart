class Carta {
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;
  const Carta(
      {required this.id,
      required this.nombre,
      required this.precio,
      required this.imagen,
      required this.descripcion});
}

final crepes = [
  const Carta(
      id: 1,
      nombre: "#1",
      precio: 2.00,
      imagen: "ic_c1.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 2,
      nombre: "#2",
      precio: 2.50,
      imagen: "ic_c2.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 3,
      nombre: "#3",
      precio: 2.25,
      imagen: "ic_c3.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 4,
      nombre: "#5",
      precio: 2.50,
      imagen: "ic_c5.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 5,
      nombre: "#6",
      precio: 2.25,
      imagen: "ic_c6.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 6,
      nombre: "#8",
      precio: 2.50,
      imagen: "ic_c8.jpg",
      descripcion: "Preparado..."),
];
final waffles = [
  const Carta(
      id: 7,
      nombre: "#4",
      precio: 2.00,
      imagen: "ic_c4.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 8,
      nombre: "#9",
      precio: 2.00,
      imagen: "ic_c9.jpg",
      descripcion: "Preparado..."),
  const Carta(
      id: 9,
      nombre: "#10",
      precio: 2.00,
      imagen: "ic_c10.jpg",
      descripcion: "Preparado..."),
];
final gelatos = [
  const Carta(
      id: 10,
      nombre: "#7",
      precio: 2.10,
      imagen: "ic_c7.jpg",
      descripcion: "Preparado..."),
];
