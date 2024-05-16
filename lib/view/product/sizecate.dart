import 'package:flutter/material.dart';

class SizeCategory extends StatelessWidget {
  const SizeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ClickableCategoryIcon(text: '35'),
              ClickableCategoryIcon(text: '36'),
              ClickableCategoryIcon(text: '37'),
              ClickableCategoryIcon(text: '38'),
              ClickableCategoryIcon(text: '40'),
              ClickableCategoryIcon(text: '41'),
              ClickableCategoryIcon(text: '42'),
              ClickableCategoryIcon(text: '43'),
            ],
          ),
        ),
      ],
    );
  }
}

class ClickableCategoryIcon extends StatefulWidget {
  final String text;

  const ClickableCategoryIcon({Key? key, required this.text}) : super(key: key);

  @override
  _ClickableCategoryIconState createState() => _ClickableCategoryIconState();
}

class _ClickableCategoryIconState extends State<ClickableCategoryIcon> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _isSelected ? Color.fromARGB(78, 108, 105, 105) : Color.fromARGB(53, 93, 91, 91),
                width: 1,
              ),
              color: _isSelected ? Color.fromARGB(30, 255, 86, 34) : Colors.transparent,
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: _isSelected ? Color.fromARGB(255, 237, 145, 7) : Color.fromARGB(255, 3, 2, 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
