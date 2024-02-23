// ignore_for_file: use_build_context_synchronously

import 'package:best_rent/controllers/user_controller.dart';
import 'package:best_rent/views/screens/pick_date_time.dart';
import 'package:flutter/material.dart';

class UserLocationPage extends StatefulWidget {
  const UserLocationPage({super.key});

  @override
  _UserLocationPageState createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  final UserController _userController = userController;
  final List<String> _cities = [
    'Paris',
    'Marseille',
    'Genève',
    'Lyon',
    'Londres'
  ];
  String? _mySearchCity;
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
        title: const Text('Position'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_locationMessage),
          ),
          // Boutton pour utiliser la position actuelle
          ElevatedButton(
            onPressed: () async {
              await _userController.updateCoordinatesFromDevice();
              await _updateLocationDisplay();
              String? cityName = await _userController.user.coordinatesToCity();
              if (cityName != null) {
                List<String> cityListInfo =
                    await _userController.getInfoCity(cityName);
                String contentDialog = 'Ville : $cityName\n';
                if (cityListInfo[1].isNotEmpty) {
                  contentDialog += 'Code postal : ${cityListInfo[1]}\n';
                }
                if (cityListInfo[2].isNotEmpty) {
                  contentDialog += 'Region : ${cityListInfo[2]}\n';
                }
                if (cityListInfo[3].isNotEmpty) {
                  contentDialog += 'Pays : ${cityListInfo[3]}';
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Votre localisation est ici : $cityName'),
                      content: Text(contentDialog),
                    );
                  },
                );
              }
              // Attendre 1 seconde
              await Future.delayed(const Duration(seconds: 2));
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PickUpDateTimeScreen()));
            },
            child: const Text('Utiliser ma position actuelle'),
          ),
          // Saisie de la ville
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: _mySearchCity ?? 'Saisissez votre ville',
                helperText: 'Saisissez une ville',
              ),
              onChanged: (value) => setState(() {
                _mySearchCity = value;
              }),
              onSubmitted: (value) async {
                await _userController.updateCoordinatesFromCity(value);
                _mySearchCity = await _userController.user.coordinatesToCity();
                await _updateLocationDisplay();
              },
            ),
          ),
          // Liste des villes en suggestion
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
                    setState(() {
                      _mySearchCity = _cities[index];
                    });
                  },
                );
              },
            ),
          ),
          // Boutton de validation
          ElevatedButton(
            onPressed: () async {
              String? cityName = await _userController.user.coordinatesToCity();
              if (cityName != null) {
                List<String> cityListInfo =
                    await _userController.getInfoCity(cityName);
                String contentDialog = 'Ville : $cityName\n';
                if (cityListInfo.isNotEmpty && cityListInfo[1].isNotEmpty) {
                  contentDialog += 'Code postal : ${cityListInfo[1]}\n';
                }
                if (cityListInfo.isNotEmpty && cityListInfo[2].isNotEmpty) {
                  contentDialog += 'Region : ${cityListInfo[2]}\n';
                }
                if (cityListInfo.isNotEmpty && cityListInfo[3].isNotEmpty) {
                  contentDialog += 'Pays : ${cityListInfo[3]}';
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Votre localisation est ici : $cityName'),
                      content: Text(contentDialog),
                    );
                  },
                );
              }
              // Attendre 1 seconde
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PickUpDateTimeScreen()));
            },
            child: const Text('Valider'),
          )
        ],
      ),
    );
  }
}
