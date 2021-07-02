import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int number;
  final Color? textColor;
  final Color? backgroundColor;

  const InfoCard({
    required this.title,
    required this.number,
    this.textColor,
    this.backgroundColor,
  });

  String _formatNumber(int number) {
    final formatter = NumberFormat.decimalPattern('en_US');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              _formatNumber(number),
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
