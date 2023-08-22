import 'package:flutter/material.dart';
import 'package:nextflix_clone/application/search/search_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.buttonname,
  });
  final IconData icon;
  final String buttonname;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        Text(
          buttonname,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
      },
      icon: const Icon(
        Icons.search,
        size: 30,
      ),
    );
  }
}
