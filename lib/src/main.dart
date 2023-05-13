import 'package:coolstuff_market/firebase_options.dart';
import 'package:coolstuff_market/src/repository/authentication/authentication_repository.dart';
import 'package:coolstuff_market/src/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/welcome/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
    );
  }
}



class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key:key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
     // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: const Text('Bienvenido'), leading: const Icon (Icons.ondemand_video),),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add_shopping_cart), onPressed: (){},),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Heading", style: Theme.of(context).textTheme.headline2,),
            Text("Sub heading", style: Theme.of(context).textTheme.subtitle2,),
            Text("Paragraph", style: Theme.of(context).textTheme.bodyText1,),
            ElevatedButton(onPressed: (){}, child: const Text("Elevated Button"),),
            OutlinedButton(onPressed: (){}, child: const Text("Outlined Button"),),
            const Padding(padding: EdgeInsets.all(20.0),
              child: Image(image: AssetImage("assets/images/books.png"))
            ),
      
          ],
        ),
      ),
    );
  }

}
