import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie2/provider/searchprovider.dart';
import 'package:provider/provider.dart';

import '../provider/moviesprovider.dart';

class SearchField extends StatefulWidget {
  SearchField({required this.padding} );
late final EdgeInsetsGeometry padding;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: widget.padding,
    child: TextFormField(
      onChanged: (query){
        Provider.of<Search>(context,listen: false).searchData(text: query);
      },
      decoration: InputDecoration(
        fillColor: Colors.white30,
        filled: true,
        suffixIcon: Icon(Icons.mic,color: Colors.grey,),
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        labelText: 'Search',
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(20)
        )
      ),
    )
    );
  }
}
