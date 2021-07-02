import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/app_provider.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackerView extends StatefulWidget {
  @override
  _TrackerViewState createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  late AppController appController;

  Country? get selectedCountry => appController.selectedCountry;

  _TrackerViewState() {
    appController = appProvider.get<AppController>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/countries');
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Observer(
                          builder: (context) {
                            return ClipOval(
                              child: Image.asset(
                                'assets/images/flags/${selectedCountry!.code}.png',
                                width: 32,
                                height: 32,
                              ),
                            );
                          },
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Color(0xFFCFE3FC),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/doctor.png',
                        height: 160,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Know safety tips and precautions from top doctors',
                                  style: GoogleFonts.questrial(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 20,
                                width: 48,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final url =
                                        'https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    }
                                    print("SDAASDASd");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF9156EC),
                                    shape: StadiumBorder(),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
