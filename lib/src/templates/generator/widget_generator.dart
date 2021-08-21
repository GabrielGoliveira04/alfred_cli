import 'package:alfred_cli/src/models/widget_generated.dart';

String componentGenerator(WidgetGenerated obj) => obj.haveWidgetBehaviour
    ? ''' 
import 'package:flutter/material.dart';


class The${obj.name}Widget extends StatelessWidget with WidgetBehaviour{

  const The${obj.name}Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(loading: false, context: context);
  }


  @override
  Widget onLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget onRegular(BuildContext context) {
    return Container();
  }
}


'''
    : ''' 
import 'package:flutter/material.dart';


class The${obj.name}Widget extends StatelessWidget{

  const The${obj.name}Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

''';

String testGenerator(WidgetGenerated obj) => '''
//import 'package:flutter/material.dart';
//import 'package:flutter_test/flutter_test.dart';

//void main() {
 //group("Test ${obj.name}", () {
    
  //});
//}

 ''';
