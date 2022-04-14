import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double edgeHome = 30;
double edgeDetail = 24;

//style untuk font / textstyle
TextStyle titleHome = GoogleFonts.poppins(
    color:const Color(0xff091f33),
    fontWeight: FontWeight.w700,
    fontSize: 36
);

TextStyle titleArticle = GoogleFonts.poppins(
    color:const Color(0xff091f33),
    fontWeight: FontWeight.w500
);

TextStyle titleArticleHeadline = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w500
);

TextStyle authorDateArticle = GoogleFonts.poppins(
    color: Colors.black.withOpacity(0.5),
    fontWeight: FontWeight.w500
);

TextStyle authorDateArticleHeadline = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w500
);

TextStyle detailArticle = GoogleFonts.poppins(
  color:const Color(0xff091f33),
  fontWeight: FontWeight.w400,
);

TextStyle categoryTitle = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500
);