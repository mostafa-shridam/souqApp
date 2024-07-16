import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'data',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}

class Bulider extends StatelessWidget {
  const Bulider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'data',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
