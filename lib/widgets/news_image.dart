import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension IsValidUrl on String {
  Future<bool> isImageValid() async {
    try {
      final response = await Dio().head(this);
      return response.statusCode == 200;
    } catch (s) {
      print('$this IsValidUrl extension :$s');
      return false;
    }
  }
}

class NewsImage extends StatefulWidget {
  const NewsImage({
    super.key,
    required this.imagePath,
  });
  final String? imagePath;

  @override
  State<NewsImage> createState() => _NewsImageState();
}

class _NewsImageState extends State<NewsImage> {
  bool? isValid;
  @override
  void initState() {
    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      widget.imagePath!.isImageValid().then((value) {
        if (mounted) {
          setState(() {
            isValid = value;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget fallBack = const ImageContainer(
        child: Icon(
      Icons.newspaper,
      color: Colors.white,
    ));
    if (widget.imagePath != null && isValid != null && isValid == true) {
      return ImageContainer(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CachedNetworkImage(
            key: ValueKey(widget.imagePath),
            imageUrl: widget.imagePath!,
            fit: BoxFit.cover,
          ),
        ),
      ));
    } else {
      return fallBack;
    }
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepOrange,
            Colors.yellow,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
