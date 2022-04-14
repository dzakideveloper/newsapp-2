// ignore_for_file: sized_box_for_whitespace

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/service/data_service.dart';
import 'news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  const TabBarMenu(this.article, {Key? key}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabMenuBarState();
}

//kita akan menggunakan single ticker provider state mixin jika kita memiliki satu animasi
class _TabMenuBarState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  //untuk mengatur tab yang aktif
  late TabController _tabController;
  //kita akan menggunakan late untuk mengatur tab controller
  //karena kita akan menggunakan widget tab bar
  final List<Tab> myTabs = const <Tab>[
    //list tab yang akan ditampilkan
    Tab(text: 'Business'),
    Tab(text: 'Entertainment'),
    Tab(text: 'General'),
    Tab(text: 'Health'),
    Tab(text: 'Science'),
    Tab(text: 'Sports'),
    Tab(text: 'Technology'),
  ];

  @override
  void initState() {
    //animasi tab
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    //untuk menghapus controller tab
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //sama saja seperti var news = News();
    News news = News();
    return Container(
      //agar dia responsive dengan layar yang di gunakan user
      //maka kita akan menggunakan MediaQuery.of(context).size.height
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            tabs: myTabs,
            controller: _tabController,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            //untuk mengatur warna tab yang aktif atau tidak aktif
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BubbleTabIndicator(
                //kita akan menggunakan bubble tab indicator
                indicatorColor: Colors.black,
                //kita akan menggunakan color black
                indicatorHeight: 30,
                //kita akan menggunakan height 30
                tabBarIndicatorSize: TabBarIndicatorSize.tab),
            //agar bisa di scroll
            isScrollable: true,
          ),
          const SizedBox(height: 10),
          //kenapa menggunakan expanded? 
          //karena kita akan menggunakan listview untuk menampilkan data
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                //disini kita menggunakan future builder untuk menampilkan data
                return FutureBuilder(
                  future: news.getNewsByCategory(tab.text.toString()),
                  builder: (context, snapshot) => snapshot.data != null
                      ? _listNewsCategory(snapshot.data as List<Article>)
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> articles) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => NewsItem(article: articles[index]),
        itemCount: articles.length,
      ),
    );
  }
}
