import 'package:donor_darah/detail_screen.dart';
import 'package:donor_darah/model/volunteer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Darah'),
      ),
      body: const VolunteerList(),
    );
  }
}

class VolunteerList extends StatelessWidget {
  const VolunteerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Volunteer volunteer = volunteerList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(volunteer: volunteer);
            }));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(volunteer.imageUrl),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            volunteer.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text('${volunteer.gender}, ${volunteer.age} tahun'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(volunteer.bloodType),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: volunteerList.length,
    );
  }
}
