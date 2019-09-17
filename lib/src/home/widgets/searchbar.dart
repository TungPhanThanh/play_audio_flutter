import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.0,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Search music...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Icon(
            Icons.mic,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }
}
