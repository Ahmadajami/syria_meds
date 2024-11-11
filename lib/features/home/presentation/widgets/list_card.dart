import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.width,
    required this.height,
    this.price,
    required this.name,
    this.imageUrl = "https://picsum.photos/300",
    required this.desc,
  });

  final double width;
  final double height;
  final dynamic price;
  final String name;
  final String imageUrl;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width * 0.60,
        child: Card(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: height * 0.15,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl: imageUrl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          name + "k",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        price.toString(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      desc),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
