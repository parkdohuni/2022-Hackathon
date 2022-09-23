import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;

Future<List<String>> dust() async{

  var airPollution = <String>[];

  final response =await http.get(Uri.parse('https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8C%80%EA%B5%AC+%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80&oquery=%EB%8C%80%EA%B5%AC+%EB%8F%99%EA%B5%AC+%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80&tqi=hyYHjdprvmZssO7ThZhssssssaV-033067'));
  dom.Document document = parse.parse(response.body);

  final airpol = document.getElementsByClassName('value');

  airPollution = airpol
           .map((element) => element.getElementsByTagName('em')[0].innerHtml)
           .toList();

  return airPollution;
  }
