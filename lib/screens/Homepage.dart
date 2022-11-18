import 'package:change_notifier_provider/providers/HomepageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
            child: ChangeNotifierProvider<HomepageProvider>(
          create: (context) => HomepageProvider(),
          child: Consumer<HomepageProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your age',
                      label: Text('Age'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onChanged: (text) => provider.checkEligibility(text.trim()),
                  ),
                  SizedBox(height: 30),
                  provider.isEligible != null
                      ? Text(
                          provider.eligibilityMessage,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: provider.isEligible == true
                                  ? Colors.green
                                  : Colors.red),
                        )
                      : Text(''),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
