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
  int _lastPlay = 0; // 0 = nenhum lance ainda

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(l10n.team1,
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('$_score1',
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
                Text('X', style: Theme.of(context).textTheme.displaySmall),
                Column(
                  children: [
                    Text(l10n.team2,
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('$_score2',
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Botões Time 1
            Text(l10n.team1,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreButton(
                  label: l10n.freeThrow,
                  onPressed: () => _addPoints(1, 1),
                ),
                ScoreButton(
                  label: l10n.twoPoints,
                  onPressed: () => _addPoints(1, 2),
                ),
                ScoreButton(
                  label: l10n.threePoints,
                  onPressed: () => _addPoints(1, 3),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Botões Time 2
            Text(l10n.team2,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreButton(
                  label: l10n.freeThrow,
                  onPressed: () => _addPoints(2, 1),
                ),
                ScoreButton(
                  label: l10n.twoPoints,
                  onPressed: () => _addPoints(2, 2),
                ),
                ScoreButton(
                  label: l10n.threePoints,
                  onPressed: () => _addPoints(2, 3),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Botão Voltar Lance
            ScoreButton(
              label: l10n.undoLastPlay,
              onPressed: _undoLastPlay,
              enabled: _lastPlay != 0,
            ),
          ],
        ),
      ),
    );
  }
}