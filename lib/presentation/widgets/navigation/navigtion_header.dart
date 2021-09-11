import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

Widget buildHeader(
  BuildContext context, {
  required img,
  required name,
  required email,
}) {
  var capitalizedName = name.toString().capitalize();
  return Material(
    color: Colors.transparent,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20)
          .add(EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(img),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Container(
                  child: Text(
                    capitalizedName!,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(
                    email,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
