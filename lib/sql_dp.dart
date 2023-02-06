import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class sql_dp{
  Database? database;
  intialDb() async{


//open database
  database= await openDatabase('calculator.db',  version:  1,onCreate:(database , version) async{
//create table
   await database.execute('CREATE TABLE result (id INTEGER  PRIMARY KEY,res REAL)  ');
   print("Database is created ");
 }


     ,
     onOpen: (database){
       print("Database is opened");
     }
      );


  }


 select( String Sql) async{



       List<Map> res= await database!.rawQuery(Sql);
       return res;



}
insert( String Sql) async{

  int res= await database!.rawInsert(Sql);
  return null;




  }

  delete( String Sql) async{

    int res= await database!.rawDelete(Sql);

    return res;
  }

}