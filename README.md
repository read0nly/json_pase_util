# json_pase_util

A util to format dynamic data type 


## Using

`dependencies:
   json_pase_util: *.*.*`

`import 'package:json_pase_util/json_pase_util.dart'

class Person {
  String name;
  int sex;
  double money;
  List<Sport> sports;
  Sport favorite;

  Person({this.name, this.sex, this.money, this.sports, this.favorite});

  factory Person.fromJson(Map<String, dynamic> json) {
  
    return Person(
      // filterNull default:true    "name":"null" -> name = ""
      name: JsonParseUtil.parseStr(json['name'], filterNull: true),
      //  parse "sex":1 -> 1 , "sex":"1" -> 1 ,"sex":null -> 0,"sex":"null" -> 0
      sex: JsonParseUtil.parseInt(json['sex'], defaultValue: 0),
      //  parse "money":1 -> 1 , "money":"1" -> 1 ,"money":null -> 0,"money":"null" -> 0
      money: JsonParseUtil.parseDouble(json['money'], defaultValue: 0),
      sports: JsonParseUtil.parseList<Sport>(
          json['sports'], (e) => Sport.fromJson(e)),
      favorite: JsonParseUtil.parseObject<Sport>(
          json['favorite'], (e) => Sport.fromJson(e)),
    );
    
  }
}
`