import 'package:fisioflow/widgets/gradientBackground.dart';
import 'package:flutter/material.dart';

import '../models/exercise.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  final List<Exercise> items = [
    Exercise('Flexões', 'assets/flexao.webp',
        'Flexões são um ótimo exercício para fortalecer os músculos do peito, ombros e tríceps.'),
    Exercise('Agachamentos', 'assets/agachamento.jpg',
        'Agachamentos são eficazes para fortalecer as pernas e glúteos.'),
    Exercise('Prancha', 'assets/prancha.webp',
        'A prancha é um exercício de fortalecimento do núcleo.'),
    Exercise('Abdominal', 'assets/abdominal.webp',
        'O abdominal é um exercício para fortalecer os músculos abdominais.'),
    Exercise('Flexões', 'assets/flexao.webp',
        'Flexões são um ótimo exercício para fortalecer os músculos do peito, ombros e tríceps.'),
    Exercise('Agachamentos', 'assets/agachamento.jpg',
        'Agachamentos são eficazes para fortalecer as pernas e glúteos.'),
    Exercise('Prancha', 'assets/prancha.webp',
        'A prancha é um exercício de fortalecimento do núcleo.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _handleBody(),
      ]),
    );
  }

  Widget _handleBody() {
    return Expanded(child: GradientBackground(child: _handleList()));
  }

  Widget _handleList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final exercise = items[index];
        return _handleCard(exercise);
      },
    );
  }

  Widget _handleCard(Exercise exercise) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(exercise.imageUrl),
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                        Text(
                          exercise.description,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('COMEÇAR'),
                  onPressed: () {},
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
              ],
            )
          ],
        ),
      ),
    );
  }
}
