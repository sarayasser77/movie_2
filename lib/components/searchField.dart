import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({required this.padding} );
late final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding,
    child: TextFormField(
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
