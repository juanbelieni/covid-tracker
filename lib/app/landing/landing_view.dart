import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFCFE3FC),
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/family.png',
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Be aware',
                    style: GoogleFonts.questrial(fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Stay healthy',
                    style: GoogleFonts.questrial(fontSize: 36),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to COVID-19 information portal.',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'GET STARTED',
                        style: GoogleFonts.questrial(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 16),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/countries');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF9156EC),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
