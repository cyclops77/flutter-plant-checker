import 'package:flutter/material.dart';

class Pharagraph1 extends StatelessWidget {
  final String teks;
  final Color warna;
  // final TextStyle()

  Pharagraph1({
    @required this.teks,
    @required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${teks}", 
      style: TextStyle(
        letterSpacing: 2,
        fontSize: 35,
        color: warna,
        fontFamily: 'Varela',
      ),
    );
  }
}


class Pharagraph2 extends StatelessWidget {
  final String teks;
  final Color warna;
  // final TextStyle()

  Pharagraph2({
    @required this.teks,
    @required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${teks}", 
      style: TextStyle(
        fontSize: 25,
        color: warna,
        fontFamily: 'Varela',
      ),
    );
  }
}


class Pharagraph6 extends StatelessWidget {
  final String teks;
  final Color warna;
  // final TextStyle()

  Pharagraph6({
    @required this.teks,
    @required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${teks}", 
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17.5,
        fontWeight: FontWeight.w100,
        color: warna,
        fontFamily: 'Varela',
      ),
    );
  }
}

class Pharagraph6B extends StatelessWidget {
  final String teks;
  final Color warna;
  // final TextStyle()

  Pharagraph6B({
    @required this.teks,
    @required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${teks}", 
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17.5,
        fontWeight: FontWeight.bold,
        color: warna,
        fontFamily: 'Varela',
      ),
    );
  }
}

