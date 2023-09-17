import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Details'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to the Home screen'),
            )
          ],
        ),
      ),
    );
  }
}
