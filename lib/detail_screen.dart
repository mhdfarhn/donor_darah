import 'package:donor_darah/model/volunteer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Volunteer volunteer;

  const DetailScreen({Key? key, required this.volunteer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor Darah')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    volunteer.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    volunteer.name,
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.bloodtype,
                    size: 28.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    volunteer.bloodType,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    volunteer.gender == 'Laki-laki' ? Icons.male : Icons.female,
                    size: 28.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    volunteer.gender,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.tag,
                    size: 28.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    '${volunteer.age} tahun',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.home,
                    size: 28.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    volunteer.address,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.phone,
                    size: 28.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    volunteer.phoneNumber,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.phone),
        onPressed: () async {
          launchUrl(Uri.parse('tel:${volunteer.phoneNumber}'));
        },
      ),
    );
  }
}
