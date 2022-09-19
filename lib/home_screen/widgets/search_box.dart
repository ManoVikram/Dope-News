import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../blocs/bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    final NewsBloc bloc = BlocProvider.of<NewsBloc>(context, listen: false);

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
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          bloc.add(SearchNews(searchTerm: _searchController.text));
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Color(0xFF3D3D3D),
          ),
          suffixIcon: GestureDetector(
            child: GestureDetector(
              onTap: () {
                bloc.add(SearchNews(searchTerm: _searchController.text));
              },
              child: const Icon(
                Icons.search,
                color: Color(0xFF3D3D3D),
              ),
            ),
          ),
          suffixIconColor: const Color(0xFF3D3D3D),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36.0,
            minWidth: 36.0,
          ),
        ),
      ),
    );
  }
}
