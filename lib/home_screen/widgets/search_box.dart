import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        controller: _searchController,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Color(0xFF3D3D3D),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFF3D3D3D),
          ),
          suffixIconColor: Color(0xFF3D3D3D),
          suffixIconConstraints: BoxConstraints(
            minHeight: 36.0,
            minWidth: 36.0,
          ),
        ),
      ),
    );
  }
}
