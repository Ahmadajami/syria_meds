import 'package:flutter/material.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final _sheet = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification notification) {
        //log("extent: = ${notification.extent}");
        //TODO:Animation Logic
        return false;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        builder: (BuildContext context, scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: const Center(
                        child: Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                ),
                const SliverAppBar(
                  title: Text('Category'),
                  primary: false,
                  pinned: true,
                  centerTitle: true,
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Card(
                        color: Colors.teal[100 * (index % 9)],
                        child: Stack(
                          children: [
                            const Center(
                                child: Icon(
                              color: Colors.black26,
                              Icons.sanitizer,
                              size: 80,
                            )),
                            Container(
                              color: Colors.grey.withAlpha(90),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Shampoo",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ))
                          ],
                        ),
                      );
                    },
                    childCount: 40,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
