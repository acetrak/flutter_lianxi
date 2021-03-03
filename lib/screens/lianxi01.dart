import 'package:flutter/material.dart';

class Lianxi01 extends StatefulWidget {
  final double drawerWidth = 250;

  @override
  _Lianxi01State createState() => _Lianxi01State();
}

class _Lianxi01State extends State<Lianxi01> with TickerProviderStateMixin {
  ScrollController scrollController;
  AnimationController animationController;

  double scrolloffset = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 0), vsync: this);
    scrollController = ScrollController(initialScrollOffset: widget.drawerWidth);

    scrollController.addListener(() {

      if (scrollController.offset <= 0) {
        if (scrolloffset != 1.0) {
          setState(() {
            scrolloffset = 1.0;
          });
        }
        animationController.animateTo(0.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
      } else if (scrollController.offset > 0 && scrollController.offset < widget.drawerWidth.floor()) {
        animationController.animateTo((scrollController.offset * 100 / (widget.drawerWidth)) / 100, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
      } else {
        if (scrolloffset != 0.0) {
          setState(() {
            scrolloffset = 0.0;
          });
        }
        animationController.animateTo(1.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
      }
    });
  }

  void handleToggleDrawer() {
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('练习'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            this.handleToggleDrawer();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
            child: Row(
              children: [
                SizedBox(
                  width: widget.drawerWidth,
                  height: double.infinity,
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.translationValues(scrollController.offset, 0.0, 0.0),
                        child: Container(
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text('邮箱'),
                                leading: Icon(
                                  Icons.add,
                                ),
                              ),
                              ListTile(
                                title: Text('账号'),
                                leading: Icon(
                                  Icons.ac_unit_outlined,
                                ),
                              ),
                              ListTile(
                                title: Text('探索'),
                                leading: Icon(
                                  Icons.account_circle_sharp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 14),
                    ],
                  ),
                  width: size.width,
                  height: double.infinity,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: double.infinity,
      color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
