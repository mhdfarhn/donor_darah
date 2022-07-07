import 'package:donor_darah/detail_screen.dart';
import 'package:donor_darah/model/volunteer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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

class VolunteerList extends StatefulWidget {
  const VolunteerList({Key? key}) : super(key: key);

  @override
  State<VolunteerList> createState() => _VolunteerListState();
}

class _VolunteerListState extends State<VolunteerList> {
  late List<Volunteer> _filteredVolunteers;

  @override
  void initState() {
    _filteredVolunteers = volunteerList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Volunteer> results = [];
    if (enteredKeyword.isEmpty) {
      results = volunteerList;
    } else {
      results = volunteerList
          .where((volunteer) => volunteer.bloodType
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredVolunteers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              labelText: 'Cari Golongan Darah',
              suffix: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: _filteredVolunteers.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredVolunteers.length,
                    itemBuilder: (context, index) {
                      final Volunteer volunteer = _filteredVolunteers[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
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
                                    backgroundImage:
                                        NetworkImage(volunteer.imageUrl),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          volunteer.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                            '${volunteer.gender}, ${volunteer.age} tahun'),
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
                  )
                : const Text(
                    'Pendonor dengan golongan darah tersebut tidak tersedia.',
                    style: TextStyle(fontSize: 16.0),
                  ),
          ),
        ],
      ),
    );
  }
}
