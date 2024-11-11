import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syria_meds/common/widgets/app_bar.dart';
import 'package:syria_meds/features/home/presentation/widgets/sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: const MyAppBar(),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome Back!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Selling",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Card(
                        elevation: 10.0,
                        borderOnForeground: false,
                        child: IconButton(
                            tooltip: "View More",
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 10.0,
                          borderOnForeground: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://picsum.photos/900/300",
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Text.rich(
                                        softWrap: true,
                                        TextSpan(
                                            text: "Something Went Wrong",
                                            children: [
                                              WidgetSpan(
                                                  baseline:
                                                      TextBaseline.alphabetic,
                                                  child: Icon(Icons.error))
                                            ])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(text: "Product One"),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 10.0,
                          borderOnForeground: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: "https://picsum.photos/900/300",
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Text.rich(
                                          softWrap: true,
                                          TextSpan(
                                              text: "Something Went Wrong",
                                              children: [
                                                WidgetSpan(
                                                    baseline:
                                                        TextBaseline.alphabetic,
                                                    child: Icon(Icons.error))
                                              ])),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(text: "Product One"),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const DraggableSheet(),
          ],
        ));
  }
}
