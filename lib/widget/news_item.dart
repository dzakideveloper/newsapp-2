// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/screen/detailpage.dart';
import 'package:newsapp/utils/utils.dart';
//import untuk time a go
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //*agar view bisa di click atau di tekan maka kita bungkus dengan GestureDetector
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(article: article)));
      },

      //untuk membuat tampilan card pada list
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: edgeDetail),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                //untuk menampilkan gambar
                //dan bisa kita kasih border radius
                child: ClipRRect(
                  //memberikan lengkungan pada gambar
                  borderRadius: BorderRadius.circular(18),
                  //ambil gambar menggunakan image.network dan mengambil dari urlToImage di article
                  child: Image.network(
                    article.urlToImage,
                    height: 80,
                    width: 80,
                    //untuk mengatur gambar tidak memiliki padding
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //memberikan jarak
              const SizedBox(width: 5),
              //untuk memenuhi atau mengisi ruangan kosong
              Expanded(
                child: Container(
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //untuk menampilkan judul
                      Text(
                        article.title,
                        //memberikan maxlines
                        maxLines: 2,
                        //menghindari overflow
                        overflow: TextOverflow.ellipsis,
                        //untuk mengatur font dan ukuran
                        style: titleArticle.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      //untuk menampilkan waktu atau tanggal
                      Row(
                        children: [
                          const Icon(
                            //untuk menampilkan icon
                            Icons.calendar_today_outlined,
                            size: 12,
                          ),
                          const SizedBox(width: 3),
                          //untuk menampilkan waktu dan tanggal
                          Container(
                              width: 70,
                              child: Text(
                                  timeUntil(
                                      DateTime.parse(article.publishedAt)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      authorDateArticle.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        //untuk menampilkan penulis
                        children: [
                          //untuk menampilkan icon
                          const Icon(Icons.person, size: 12),
                          const SizedBox(width: 3),
                          Container(
                              width: 70,
                              //untuk menampilkan nama penulis
                              child: Text(article.author,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      authorDateArticle.copyWith(fontSize: 12)))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//untuk mengambil jam terbaru dan data dari title
String timeUntil(DateTime parse) {
  //coba ubah en menjadi id
  return timeago.format(parse, allowFromNow: true, locale: 'id');
}
