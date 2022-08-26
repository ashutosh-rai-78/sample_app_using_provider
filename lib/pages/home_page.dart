import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app_using_provider/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ChangeNotifierProvider<HomePageProvider>(
            // creating instance of homepageprovider.
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      provider.eligibilityMessage.toString(),
                      style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.greenAccent
                              : Colors.redAccent),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter your age",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      onChanged: (value) {
                        provider.checkEligibility(int.parse(value));
                        print(value);
                        print(provider.eligibilityMessage.toString());
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
