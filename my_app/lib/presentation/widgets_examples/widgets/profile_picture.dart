import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
            height: 230,
            width: 200,
            // color: Colors.blue,
            // Mit Hilfe des Stack Widget kann man Widget uebereinander platzieren
            // Im Stack richtet man die Widgets mit Align und Positioned aus
            child: Stack(children: [
              SizedBox(
                height: 200,
                child: CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage("assets/images/selfie.jpg"),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Flutter Freelancer",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Rubik",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("TU Dortmund Student",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Rubik",
                              color: Colors.white)),
                    ],
                  )),
                ),
              )
            ])),
      ),
    );
  }
}
