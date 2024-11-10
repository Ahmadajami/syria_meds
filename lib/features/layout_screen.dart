import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:syria_meds/core/routing/menu/menu_model.dart';
import 'package:syria_meds/core/routing/routes.dart';

import 'package:syria_meds/features/auth/presentation/login.dart';
import 'package:syria_meds/features/home/presentation/home.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  MenuItem currentItem=MenuItems.home;
  final ZoomDrawerController z = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
        angle: 0.0,
        controller: z,
        borderRadius: 40.0,
        menuBackgroundColor: Theme.of(context).primaryColor,
        menuScreen: MenuScreen(
            currentItem:currentItem,
            onSelectedItem:(item){
              setState(() {
                currentItem=item;
              });
            }
        ),
        mainScreen: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                onPressed: (){z.toggle!();},
                icon: const Icon(Icons.menu)),),
          body: AppRoutes.getScreen(currentItem),
        ),
        androidCloseOnBackTap: true,
        mainScreenTapClose: true,
      );
  }
}


class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuScreen({super.key, required this.currentItem, required this.onSelectedItem});

  Widget buildMenuItem(MenuItem item)=> ListTile(
    selectedColor: Colors.white,
    selectedTileColor: Colors.black26,
    selected: item== currentItem,
    minLeadingWidth: 20.0,
    leading: Icon(item.icon,color: item == currentItem ? Colors.black : Colors.white,),
    title: Text(item.name,style:  TextStyle(fontSize: 20.0,color: item == currentItem ? Colors.black: Colors.white),),
    onTap: (){onSelectedItem(item);},
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ...MenuItems.all.map(buildMenuItem),
              const Spacer(),

            ],
          )),
    );
  }
}