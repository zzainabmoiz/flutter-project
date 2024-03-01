import 'package:flutter/material.dart';

class reuseablecontainer extends StatelessWidget {
  const reuseablecontainer({
    super.key,
    required this.ContainerColor,
    required this.ContainerText,
    required this.Imageurl
  });
final String? ContainerText;
final Color ContainerColor;
final String Imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      height: 160,

      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          image:  DecorationImage(image: NetworkImage(Imageurl),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
          fit: BoxFit.cover),
          color: ContainerColor

      ),
      child: ContainerText == null ? Text('') : Text(ContainerText!, style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        backgroundColor: Colors.black

      ),) ,
    );
  }
}
