import 'package:fisioflow/widgets/gradientBackground.dart';
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
    Workout('Treinos A', [
      Exercise('Flexões', 'assets/flexao.webp',
          'Flexões são um ótimo exercício para fortalecer os músculos do peito, ombros e tríceps.'),
      Exercise('Agachamentos', 'assets/agachamento.jpg',
          'Agachamentos são eficazes para fortalecer as pernas e glúteos.'),
    ]),
    Workout('Treinos AB', [
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
    return GradientBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_handleVerticalWorkoutList()],
      ),
    );
  }

  Widget _handleTitle(String workout) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        workout,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontFamily: "Din",
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _handleVerticalWorkoutList() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12.0),
              child: Container(
                color: Colors.white.withOpacity(0.5),
                height: 350,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _handleTitle(workout.name),
                      _handleHorizontalWorkoutList(workouts[index])
                    ]),
              ),
            );
          }),
    ));
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
                    padding: const EdgeInsets.all(12),
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
