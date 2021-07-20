import 'dart:io';

import 'package:flutter/material.dart';


class Competitor {
  String username;
  String comment;
  bool isWin;
   File img;
  Competitor(this.username,this.comment,this.isWin,this.img);
}