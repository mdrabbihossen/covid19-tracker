import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String countryName;

  const DetailsScreen({
    Key? key,
    required this.countryName,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Details'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.countryName),
          ],
        ),
      ),
    );
  }
}
