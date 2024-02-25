// ignore_for_file: file_names

import 'package:swipeable_cards_stack/swipeable_cards_stack.dart';
import 'package:flutter/material.dart';

class Kaa extends StatefulWidget {
  const Kaa({super.key});

  @override
  State<Kaa> createState() => _KaaState();
}

class _KaaState extends State<Kaa> {
  final _cardsController = SwipeableCardsStackController();

  @override
  Widget build(BuildContext context) {
    return SwipeableCardsStack(
      cardController: _cardsController,
      context: context,
      // Add the first 3 cards (widgets)
      items: const [
        Card(
          child: Text('1'),
        ),
        Card(
          child: Text('2'),
        ),
        Card(
          child: Text('3'),
        ),
      ],
      // Get card swipe event callbacks
      onCardSwiped: (dir, index, widget) {
        // Add the next card using _cardController
        _cardsController.addItem(
          const Card(
            child: Text('Next card'),
          ),
        );

        // Take action on the swiped widget based on the direction of swipe
        // Return false to not animate cards
      },
      enableSwipeUp: true,
      enableSwipeDown: false,
    );
  }
}
