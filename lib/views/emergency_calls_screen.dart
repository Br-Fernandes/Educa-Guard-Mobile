import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmergencyCallsScreen extends StatelessWidget {
  const EmergencyCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.system_security_update_warning_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bombeiros",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            SizedBox(width: 25,),
                            Text('193',style: TextStyle(fontSize: 30),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SAMU",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            SizedBox(width: 25,),
                            Text('192',style: TextStyle(fontSize: 30),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Polícia Militar",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            SizedBox(width: 25,),
                            Text('(64)3465-1190',style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
