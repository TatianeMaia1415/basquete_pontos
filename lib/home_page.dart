import 'package:flutter/material.dart';
import 'package:basquete_pontos/score_button.dart';
import 'l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score1 = 0;
  int _score2 = 0;
  int _lastPlay = 0;

  void _addPoints(int team, int points) {
    setState(() {
      if (team == 1) {
        _score1 += points;
      } else {
        _score2 += points;
      }
      _lastPlay = team == 1 ? points : -points;
    });
  }

  void _undoLastPlay() {
    setState(() {
      if (_lastPlay > 0) {
        _score1 -= _lastPlay;
      } else {
        _score2 += _lastPlay;
      }
      _lastPlay = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const team1Color = Colors.orange;
    const team2Color = Colors.blue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.appTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(l10n.team1,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: team1Color, fontWeight: FontWeight.bold)),
                      Text('$_score1',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: team1Color, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('X', style: Theme.of(context).textTheme.displaySmall),
                  Column(
                    children: [
                      Text(l10n.team2,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: team2Color, fontWeight: FontWeight.bold)),
                      Text('$_score2',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: team2Color, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Botões Time 1
            Text(l10n.team1,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: team1Color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreButton(
                  label: l10n.freeThrow,
                  icon: Icons.looks_one,
                  color: team1Color,
                  onPressed: () => _addPoints(1, 1),
                ),
                ScoreButton(
                  label: l10n.twoPoints,
                  icon: Icons.looks_two,
                  color: team1Color,
                  onPressed: () => _addPoints(1, 2),
                ),
                ScoreButton(
                  label: l10n.threePoints,
                  icon: Icons.looks_3,
                  color: team1Color,
                  onPressed: () => _addPoints(1, 3),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Botões Time 2
            Text(l10n.team2,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: team2Color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreButton(
                  label: l10n.freeThrow,
                  icon: Icons.looks_one,
                  color: team2Color,
                  onPressed: () => _addPoints(2, 1),
                ),
                ScoreButton(
                  label: l10n.twoPoints,
                  icon: Icons.looks_two,
                  color: team2Color,
                  onPressed: () => _addPoints(2, 2),
                ),
                ScoreButton(
                  label: l10n.threePoints,
                  icon: Icons.looks_3,
                  color: team2Color,
                  onPressed: () => _addPoints(2, 3),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Botão Voltar Lance
            ScoreButton(
              label: l10n.undoLastPlay,
              icon: Icons.undo,
              color: Colors.grey,
              onPressed: _undoLastPlay,
              enabled: _lastPlay != 0,
            ),
          ],
        ),
      ),
    );
  }
}