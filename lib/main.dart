import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speed Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpeedCalculator(),
    );
  }
}

class SpeedCalculator extends StatefulWidget {
  @override
  _SpeedCalculatorState createState() => _SpeedCalculatorState();
}

class _SpeedCalculatorState extends State<SpeedCalculator> {
  final TextEditingController _jarakController = TextEditingController();
  final TextEditingController _speedPlanController = TextEditingController();
  final TextEditingController _fixTimeController = TextEditingController();
  final TextEditingController _qtyTruckAktualController =
      TextEditingController();

  String _resultJarak = "";
  String _resultSpeedPlan = "";
  String _resultQtyTruck = "";
  String _resultMF = "";
  String _resultSpeedSeharusnya = "";
  String _resultMFAktual = "";

  String _selectedHauler = "CAT 789 class";
  final Map<String, double> _haulerCapacity = {
    "CAT 789 class": 87.0,
    "CAT 785 class": 62.0,
    "CAT 777 class": 42.0,
  };

  int _currentIndex = 0;

  double parseInput(String input) {
    return double.tryParse(input.replaceAll(',', '.')) ?? 0.0;
  }

  double getCtLoader(double capHauler) {
    switch (capHauler.toInt()) {
      case 87:
        return 2.9;
      case 62:
        return 2.4;
      case 42:
        return 2.9;
      default:
        return 2.9;
    }
  }

  void calculate() {
    final double jarak = parseInput(_jarakController.text);
    final double speedPlan = parseInput(_speedPlanController.text);
    final double fixTime = parseInput(_fixTimeController.text);
    final double capHauler = _haulerCapacity[_selectedHauler] ?? 87.0;
    final double ctLoader = getCtLoader(capHauler);

    final double travelTime = (jarak * 2 / speedPlan) * 60;
    final double ctHauler = travelTime + fixTime;
    final double qtyTruck = ctHauler / ctLoader;
    final double ptyLoader = (60 / ctLoader) * capHauler;
    final double ptyHauler = (60 / ctHauler) * capHauler;
    final double mf = (ptyHauler * qtyTruck) / ptyLoader;

    setState(() {
      _resultJarak = jarak.toStringAsFixed(2);
      _resultSpeedPlan = speedPlan.toStringAsFixed(2);
      _resultQtyTruck = qtyTruck.toStringAsFixed(1);
      _resultMF = mf.toStringAsFixed(2);
    });
  }

  void calculateAktual() {
    final double jarak = parseInput(_jarakController.text);
    final double speedPlan = parseInput(_speedPlanController.text);
    final double qtyTruckAktual = parseInput(_qtyTruckAktualController.text);
    final double fixTime = parseInput(_fixTimeController.text);
    final double capHauler = _haulerCapacity[_selectedHauler] ?? 87.0;
    final double ctLoader = getCtLoader(capHauler);

    final double travelTime = (jarak * 2 / speedPlan) * 60;
    final double ctHauler = travelTime + fixTime;
    final double qtyTruck = ctHauler / ctLoader;
    final double ptyLoader = (60 / ctLoader) * capHauler;
    final double ptyHauler = (60 / ctHauler) * capHauler;
    final double mfAktual = (ptyHauler * qtyTruckAktual) / ptyLoader;
    final double speedSeharusnya =
        (jarak * 2) / ((ctLoader * qtyTruckAktual - fixTime) / 60);

    setState(() {
      _resultSpeedSeharusnya = speedSeharusnya.toStringAsFixed(1);
      _resultMFAktual = mfAktual.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Speed BUMA IPR'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/img/logo_buma_tabang.png',
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedHauler,
                items: _haulerCapacity.keys.map((String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedHauler = newValue ?? "CAT 789 class";
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Type Hauler',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _jarakController,
                decoration: InputDecoration(
                  labelText: 'Jarak (km)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _speedPlanController,
                decoration: InputDecoration(
                  labelText: 'Speed Plan (km/h)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _fixTimeController,
                decoration: InputDecoration(
                  labelText: 'Fix Time (menit)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Hasil:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Jarak: $_resultJarak km'),
              Text('Speed Plan: $_resultSpeedPlan km/h'),
              Text('Qty Truck: $_resultQtyTruck'),
              Text('MF: $_resultMF'),
              SizedBox(height: 20),
              TextField(
                controller: _qtyTruckAktualController,
                decoration: InputDecoration(
                  labelText: 'Qty Truck Aktual',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Hasil Aktual:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Speed Seharusnya: $_resultSpeedSeharusnya km/h'),
              Text('MF Aktual: $_resultMFAktual'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) calculate();
            if (index == 1) calculateAktual();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Hitung',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Hitung Aktual',
          ),
        ],
      ),
    );
  }
}
