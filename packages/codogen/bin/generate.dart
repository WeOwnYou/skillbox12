
import 'src/generator.dart';

Future<void> main (List<String> args) async{
  late int varNumber;
  if(args.isNotEmpty){
    try{
      varNumber = int.parse(args[0]);
    }on FormatException{
      return;
    }
  }else{
    varNumber = 10;
  }
  Generator().run(varNumber: varNumber);
}
