import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO 3: buat empty screen
class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 20: Menambahkan image empty screen
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/empty_background.png',
            ),
            height: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO 24: Menambahkan text di bawah image empty screen
          Text(
            'task masih kosong...',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
