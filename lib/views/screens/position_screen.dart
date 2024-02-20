import 'package:best_rent/controllers/user_controller.dart';
import 'package:best_rent/models/user.dart';
import 'package:best_rent/views/screens/pick_up_datetime_screen.dart';
import 'package:flutter/material.dart';

class UserLocationPage extends StatefulWidget {
  const UserLocationPage({super.key});

  @override
  _UserLocationPageState createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  final UserController _userController =
      UserController(User(longitude: 0.0, latitude: 0.0));
  final List<String> _cities = [
    'Paris',
    'Marseille',
    'Genève',
    'Lyon',
    'Londres'
  ];
  String _locationMessage = '';

  Future<void> _updateLocationDisplay() async {
    String cityName =
        await _userController.user.coordinatesToCity() ?? 'Ville inconnue';
    setState(() {
      _locationMessage =
          'Longitude: ${_userController.user.longitude}, Latitude: ${_userController.user.latitude}, Ma ville : $cityName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mise à jour de la localisation'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_locationMessage),
          ),
          ElevatedButton(
            onPressed: () async {
              await _userController.updateCoordinatesFromDevice();
              await _updateLocationDisplay();
            },
            child: const Text('Utiliser ma position actuelle'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_cities[index]),
                  onTap: () async {
                    await _userController
                        .updateCoordinatesFromCity(_cities[index]);
                    await _updateLocationDisplay();
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PickUpDateTimeScreen()));
            },
            child: const Text('Valider'),
          )
        ],
      ),
    );
  }
}
