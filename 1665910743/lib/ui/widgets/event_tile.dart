import 'dart:io';

import 'package:flutter/material.dart';

import '../../extensions/date_extension.dart';

class EventTile extends StatelessWidget {
  final String title;
  final DateTime date;
  final bool favorite;
  final File? image;
  final bool isSelected;
  final Icon? icon;

  EventTile({
    Key? key,
    required this.title,
    required this.date,
    required this.favorite,
    required this.isSelected,
    this.image,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black38
                  : Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: const Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.7)
              : Theme.of(context).primaryColor),
      child: (image != null)
          ? _TileWithImage(
              image: image,
              title: title,
              formattedDate: date.mmddyy(),
              favorite: favorite,
            )
          : _TileWithoutImage(
              title: title,
              formattedDate: date.mmddyy(),
              favorite: favorite,
              icon: icon),
    );
  }
}

class _TileWithoutImage extends StatelessWidget {
  final String title;
  final String _formattedDate;
  final bool favorite;
  final Icon? icon;
  const _TileWithoutImage({
    Key? key,
    required this.title,
    required String formattedDate,
    required this.favorite,
    this.icon,
  })  : _formattedDate = formattedDate,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        (icon != null)
            ? Icon(
                icon!.icon,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 50,
              )
            : const SizedBox(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formattedDate,
                  style: const TextStyle(fontSize: 10),
                ),
                favorite
                    ? const Icon(
                        Icons.star,
                        size: 10,
                      )
                    : const Icon(
                        Icons.star_border,
                        size: 10,
                      ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _TileWithImage extends StatelessWidget {
  const _TileWithImage({
    Key? key,
    required this.image,
    required this.title,
    required String formattedDate,
    required this.favorite,
  })  : _formattedDate = formattedDate,
        super(key: key);

  final File? image;
  final String title;
  final String _formattedDate;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.file(
          image!,
          fit: BoxFit.cover,
          width: 70,
          height: 70,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, overflow: TextOverflow.fade),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formattedDate,
                  style: const TextStyle(fontSize: 10),
                ),
                favorite
                    ? const Icon(
                        Icons.star,
                        size: 10,
                      )
                    : const Icon(
                        Icons.star_border,
                        size: 10,
                      ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
