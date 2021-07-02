import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/tracker/components/info_card_component.dart';
import 'package:covid_tracker/app/tracker/tracker_controller.dart';
import 'package:covid_tracker/domain/cases/cases_entity.dart';
import 'package:covid_tracker/domain/country/country_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackerView extends StatefulWidget {
  @override
  _TrackerViewState createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  late AppController appController;
  late TrackerController trackerController;

  Country get selectedCountry => appController.selectedCountry!;

  Cases? get cases => trackerController.cases;

  _TrackerViewState() {
    appController = GetIt.I.get<AppController>();
    trackerController = GetIt.I.get<TrackerController>();
  }

  void _openCovidTips() async {
    final url =
        'https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
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
                                'assets/images/flags/${selectedCountry.code}.png',
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
                                    height: 1.3,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 20,
                                width: 48,
                                child: ElevatedButton(
                                  onPressed: _openCovidTips,
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
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (context) => InfoCard(
                      title: 'Confirmed',
                      number: cases?.confirmed ?? 0,
                      textColor: Colors.red[800],
                      backgroundColor: Colors.red[50],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Observer(
                    builder: (context) => InfoCard(
                      title: 'Deceased',
                      number: cases?.deceased ?? 0,
                      textColor: Colors.grey[800],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (context) => InfoCard(
                      title: 'Recovered',
                      number: cases?.recovered ?? 0,
                      textColor: Colors.green[800],
                      backgroundColor: Colors.green[50],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Observer(
                    builder: (context) => InfoCard(
                      title: 'Total pop.',
                      number: selectedCountry.population,
                      textColor: Colors.blue[800],
                      backgroundColor: Colors.blue[50],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
