import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../models/workout.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Workout> workouts = [
    Workout('Treino 1', [
      Exercise('Flexões', 'assets/flexao.webp',
          'Flexões são um ótimo exercício para fortalecer os músculos do peito, ombros e tríceps.'),
      Exercise('Agachamentos', 'assets/agachamento.jpg',
          'Agachamentos são eficazes para fortalecer as pernas e glúteos.'),
    ]),
    Workout('Treino 2', [
      Exercise('Prancha', 'assets/prancha.webp',
          'A prancha é um exercício de fortalecimento do núcleo.'),
      Exercise('Abdominal', 'assets/abdominal.webp',
          'O abdominal é um exercício para fortalecer os músculos abdominais.'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _handleBody(context),
    );
  }

  Widget _handleBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _handleTitle(),
          _handleSubTitle(),
          _handleVerticalWorkoutList()
        ],
      ),
    );
  }

  Widget _handleTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        "Treinos",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color.fromARGB(255, 42, 56, 68),
          fontFamily: "Din",
          fontWeight: FontWeight.w900,
          fontSize: 42,
        ),
      ),
    );
  }

  Widget _handleSubTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Text(
        "Escolha um treino e comece a se exercitar",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.612),
          fontSize: 12,
          fontFamily: "Din",
        ),
      ),
    );
  }

  Widget _handleVerticalWorkoutList() {
    return Expanded(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return _handleHorizontalWorkoutList(workouts[index]);
            }));
  }

  Widget _handleHorizontalWorkoutList(Workout workout) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: workout.exercises.length,
          itemBuilder: (context, index) {
            final exercise = workout.exercises[index];
            return SizedBox(
                width: 250,
                height: 200,
                child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, bottom: 24.0),
                    child: _handleCard(exercise)));
          }),
    );
  }

  Widget _handleCard(Exercise exercise) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(exercise.imageUrl)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              exercise.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
            child: Text(
              exercise.description,
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
