import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodel/homeViewModel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [

                      TextButton(
                          onPressed: () {
                            print("click");
                            provider.load();
                            provider.connect();
                          },
                          child: const Text("load"))
                    ],
                  ),
                ),
                Center(
                  child: provider.isProgress ? CircularProgressIndicator() : Text(provider.serverTime),
                ),
                // StreamBuilder(
                //     stream: _channel.stream,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Text(snapshot.data);
                //       } else {
                //         return Container();
                //       }
                //     })
              ],
            );
          },
        ),
      ),
    );
  }
}
