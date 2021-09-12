import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class google_font extends StatefulWidget {
  const google_font({Key? key}) : super(key: key);

  @override
  _google_fontState createState() => _google_fontState();
}

class _google_fontState extends State<google_font> {
  String font = 'Sarabun';
  setFont(String f) {
    setState(() {
      font = f;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('THAI FONT VIEWER'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/aa.jpg"),
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.multiply),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'พระจันทร์สวยมาตั้งนานแล้ว',
                              style: GoogleFonts.getFont(
                                (font),
                                color: Colors.white,
                                fontSize: 55,
                              ),
                            ),
                          ],
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Font: $font',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),

                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setFont('Sarabun');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: Text('Sarabun',
                                style: GoogleFonts.sarabun(fontSize: 18.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setFont('Srisakdi');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: Text('Srisakdi',
                                style: GoogleFonts.srisakdi(fontSize: 18.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setFont('Itim');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: Text('Itim',
                                style: GoogleFonts.itim(fontSize: 18.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setFont('Mitr');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: Text('Mitr',
                                style: GoogleFonts.mitr(fontSize: 18.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setFont('Mali');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                            ),
                            child: Text('Mali',
                                style: GoogleFonts.mali(fontSize: 18.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
