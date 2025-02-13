import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ["1", "2", "3","4"];
    return ChangeNotifierProvider(
      create: (context) {
        //viewmodel
      },
      child: Consumer(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Text(items[index]);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
