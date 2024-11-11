import 'package:flutter/material.dart';
import 'package:syria_meds/common/widgets/app_bar.dart';
import 'package:syria_meds/features/home/presentation/widgets/list_card.dart';
import 'package:syria_meds/features/home/presentation/widgets/sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    /*Widget gg() {
      return Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 10.0,
        borderOnForeground: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "https://picsum.photos/300",
                      errorWidget: (context, url, error) => const Center(
                        child: Text.rich(
                            softWrap: true,
                            TextSpan(text: "Something Went Wrong", children: [
                              WidgetSpan(
                                  baseline: TextBaseline.alphabetic,
                                  child: Icon(Icons.error))
                            ])),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(text: "Product One"),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      );
    }*/

    return Scaffold(
        appBar: const MyAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Welcome Back Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome Back!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  //Spacer
                  SizedBox(
                    height: height * 0.01,
                    width: double.infinity,
                  ),
                  //Best Selling Header
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
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined)),
                        )
                      ],
                    ),
                  ),
                  //List View
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: SizedBox(
                      height: height * 0.30,
                      width: width,
                      child: ListView.builder(
                        physics: const PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ListCard(
                              desc:
                                  "descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc",
                              price: index * (index * 10),
                              name: "Product $index",
                              width: width,
                              height: height);
                        },
                      ),
                    ),
                  )
                ],
              ),
              const DraggableSheet()
            ],
          ),
        ));
  }
}
