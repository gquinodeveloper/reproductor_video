import 'package:flutter/material.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class PlayList extends StatelessWidget {
  //const PlayList({Key? key}) : super(key: key);

  //final ScrollController? controller = ScrollController();
  //List<ExampleSection> sectionList = getExampleSections();
  @override
  Widget build(BuildContext context) {
    /* return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.0,
            color: Colors.red,
          ),
          /* CustomScrollView(
            slivers: _sliverList(50, 10),
          ), */
          /* Container(
            child: _sliverList(50, 10),
          ), */
        ],
      ),
    ); */
    /* return CustomScrollView(
      slivers: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: CircleAvatar(),
        ),
      ),
    ); */
    /* return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Material(
            color: Colors.grey[300],
            child: StickyHeaderBuilder(
              //overlapHeaders: true,
              //controller: controller, // Optional
              builder: (BuildContext context, double stuckAmount) {
                stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                return Container(
                  height: 50.0,
                  //margin: EdgeInsets.symmetric(vertical: 55.0),
                  color:
                      Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Header #$index',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              content: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Column(
                  children: List.generate(
                    5,
                    (index) => Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: CircleAvatar(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: 10,
      ),
    ); */

    /*  return ExpandableListView(
      builder: SliverExpandableChildDelegate<String, ExampleSection>(
        sectionList: sectionList,
        headerBuilder: (context, sectionIndex, index) =>
            Text("Header #$sectionIndex"),
        itemBuilder: (context, sectionIndex, itemIndex, index) {
          String item = sectionList[sectionIndex].items[itemIndex];
          return ListTile(
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            title: Text(item),
          );
        },
      ),
    ); */

    /* return SliverExpandableList(
      builder: SliverExpandableChildDelegate<String, ExampleSection>(
        sectionList: sectionList,
        headerBuilder: _buildHeader,
        itemBuilder: (context, sectionIndex, itemIndex, index) {
          String item = sectionList[sectionIndex].items[itemIndex];
          return ListTile(
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            title: Text(item),
          );
        },
      ),
    ); */

    /* return SliverStickyHeader(
      header: new Container(
        height: 60.0,
        color: Colors.lightBlue,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: new Text(
          'Header #0',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: new SliverList(
        delegate: new SliverChildBuilderDelegate(
          (context, i) => new ListTile(
            leading: new CircleAvatar(
              child: new Text('0'),
            ),
            title: new Text('List tile #$i'),
          ),
          childCount: 4,
        ),
      ),
    ); */

    /* return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          /* return SliverStickyHeader(
            header: new Container(
              height: 60.0,
              color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: new Text(
                'Header #0',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            sliver: new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (context, i) => new ListTile(
                  leading: new CircleAvatar(
                    child: new Text('0'),
                  ),
                  title: new Text('List tile #$i'),
                ),
                childCount: 4,
              ),
            ),
          ); */
        },
        childCount: 10,
      ),
    ); */

    return SliverStickyHeader(
      header: new Container(
        height: 60.0,
        color: Colors.lightBlue,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: new Text(
          'Header #0',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: new SliverList(
        delegate: new SliverChildBuilderDelegate(
          (context, i) => new ListTile(
            leading: new CircleAvatar(
              child: new Text('0'),
            ),
            title: new Text('List tile #$i'),
          ),
          childCount: 4,
        ),
      ),
    );
  }

/*   Widget _buildHeader(BuildContext context, int sectionIndex, int index) {
    ExampleSection section = sectionList[sectionIndex];
    return InkWell(
        child: Container(
            color: Colors.lightBlue,
            height: 48,
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              section.header,
              style: TextStyle(color: Colors.white),
            )),
        onTap: () {
          //toggle section expand state
          section.setSectionExpanded(!section.isSectionExpanded());
          /* setState(() {
          
          }); */
        });
  } */

/*   static List<ExampleSection> getExampleSections(
      [int sectionSize = 10, int itemSize = 8]) {
    var sections = List<ExampleSection>.empty(growable: true);
    for (int i = 0; i < sectionSize; i++) {
      var section = ExampleSection()
        ..header = "Header#$i"
        ..items = List.generate(itemSize, (index) => "ListTile #$index")
        ..expanded = true;
      sections.add(section);
    }
    return sections;
  } */
}
/* 
class ExampleSection implements ExpandableListSection<String> {
  //store expand state.
  late bool expanded;

  //return item model list.
  late List<String> items;

  //example header, optional
  late String header;

  @override
  List<String> getItems() {
    return items;
  }

  @override
  bool isSectionExpanded() {
    return expanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }
} */

class Persona {}

class Example3 extends StatelessWidget {
  const Example3({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: controller == null,
      controller: controller,
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Material(
          color: Colors.grey[300],
          child: StickyHeaderBuilder(
            //overlapHeaders: true,
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                //margin: EdgeInsets.symmetric(vertical: 55.0),
                color:
                    Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            content: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                children: List.generate(
                  8,
                  (index) => Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: CircleAvatar(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
