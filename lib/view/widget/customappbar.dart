import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.titleappbar, this.onPressedSearch, required this.onPressedIconFavorite, this.onChanged, required this.mycontroller}) : super(key: key);
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(child: TextFormField(
          onChanged: onChanged,
          controller: mycontroller,
          decoration: InputDecoration(
              prefixIcon: IconButton(onPressed: onPressedSearch, icon: Icon(Icons.search)),
              hintText: titleappbar,
              hintStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]
          ),
        )
            ),
        SizedBox(width: 10),

        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
