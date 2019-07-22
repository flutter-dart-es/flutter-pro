import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurante {
  final String id;
  final String titulo;
  final String subtitulo;
  final String direccion;
  final String photourl;
  final num precioTransporte;

  Restaurante({this.id, this.titulo, this.subtitulo, this.direccion,
      this.photourl, this.precioTransporte});

  Restaurante.fromSnapshot(DocumentSnapshot snapshot):
      id = snapshot.documentID,
      titulo = snapshot['titulo'],
      subtitulo = snapshot['subtitulo'],
      direccion = snapshot['direccion'],
      photourl = snapshot['photourl'],
      precioTransporte = snapshot['precio_transporte'];

}