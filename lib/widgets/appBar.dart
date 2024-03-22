import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                'review_3.png',
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Tvital',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}));
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
