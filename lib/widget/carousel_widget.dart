// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/screen/detailpage.dart';
import 'package:newsapp/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  const CarouselWidget(this.articleList, {Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  //
  late List<Widget> imageSlider;

  @override
  void initState() {
    //disini kita ingin membuat list image slider
    //kemudian kita akan mengambil data dari article list
    //untuk mengkonversi data article ke widget image slider
    //kita dapat menggunakan method map dan toList dengan method map
    //kita dapat menggunakan setiap string untuk menghasilkan widget image slider baru
    //dan dengan methode tolist
    //anda dapat mengkoversi obejek Iterable yang di kembalikan oleh method map
    //ke dalam list widget
    imageSlider = widget.articleList.map((article) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            //untuk membuka halaman detail
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(article: article)));
        },
        //untuk membuat tampilan card pada carousel
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                //untuk mengatur ukuran gambar
                decoration: BoxDecoration(
                  //untuk mengatur gambar
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        //untuk mengambil gambar dari article
                        //?kenapa kita menggunakan NetworkImage?
                        //*karena kita ingin menggunakan gambar yang ada di internet
                        image: NetworkImage(article.urlToImage))),
              ),
              Container(
                //untuk membuat tampilan overlay pada card
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      //untuk mengatur warna overlay
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [
                          0.1,
                          0.9
                        ],
                        colors: [
                          //mengatur opacity overlay
                          Colors.black.withOpacity(0.8),
                          Colors.white.withOpacity(0.1),
                        ])),
              ),
              //agar kita bisa kustom tampilan pada card
              Positioned(
                //untuk membuat tampilan text pada card
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: titleArticleHeadline.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.author,
                        style: authorDateArticleHeadline.copyWith(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(autoPlay: true, viewportFraction: 1
              // enlargeCenterPage: true,
              )),
    );
  }
}
