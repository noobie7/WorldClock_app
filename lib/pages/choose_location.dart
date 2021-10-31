import 'package:flutter/material.dart';
import 'package:worldtime_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('London','uk.png','Europe/London' ),
    WorldTime('Athens','greece.png','Europe/Berlin' ),
    WorldTime('Cairo','egypt.png','Africa/Cairo' ),
    WorldTime('Nairobi','kenya.png','Africa/Nairobi' ),
    WorldTime('Chicago','usa.png','America/Chicago' ),
    WorldTime('New York','usa.png','America/New_York' ),
    WorldTime('Seoul','south_korea.png','Asia/Seoul' ),
    WorldTime('Jakarta','indonesia.png','Asia/Jakarta' ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                elevation: 0.0,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comforta',
                      fontSize: 24.0,
                    ),
                  ),
                  tileColor: Colors.indigoAccent,



                ),
              ),
            );
          }
      ),
    );
  }
}