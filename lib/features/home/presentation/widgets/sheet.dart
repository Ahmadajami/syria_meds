import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 1.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15)
              ],
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: const Center(
                          child: FaIcon(FontAwesomeIcons.chevronUp)),
                    ),
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
                        color: Colors.blue[100 * (index % 9)],
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
