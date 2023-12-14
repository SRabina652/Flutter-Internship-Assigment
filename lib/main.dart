import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Athlete {
  final String name;
  final String level;

  Athlete({required this.name, required this.level});
}

class MyApp extends StatelessWidget {
  final List<Athlete> athletes = [
    Athlete(name: 'Abhishek', level: 'Basic'),
    Athlete(name: 'Tarun', level: 'Intermediate'),
    Athlete(name: 'Mohan', level: 'Advanced'),
    Athlete(name: 'Mohan', level: 'Intermediate'),
    Athlete(name: 'Raja', level: 'Basic'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Athletes List'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              LevelSection(athletes: athletes, level: 'Basic'),
              LevelSection(athletes: athletes, level: 'Intermediate'),
              LevelSection(athletes: athletes, level: 'Advanced'),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelSection extends StatelessWidget {
  final List<Athlete> athletes;
  final String level;

  LevelSection({required this.athletes, required this.level});

  @override
  Widget build(BuildContext context) {
    List<Athlete> filteredAthletes =
    athletes.where((athlete) => athlete.level == level).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 50.0, // Set the height as needed
          width: 200.0,
          child: ListView.builder(
            itemCount: filteredAthletes.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(filteredAthletes[index].name),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
