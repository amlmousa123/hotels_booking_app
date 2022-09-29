
import 'package:flutter/material.dart';

import '../Widgets/Edit_Profile_widget.dart';

class profile2 extends StatelessWidget {
  const profile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Amanda",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile()),
                      );
                    }, child: Text("View and Edit Profile",
                          style: TextStyle(color: Colors.grey, fontSize: 16)),)

                  ],
                ),
                Spacer(),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg'),
                  radius: 40,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Invite Friends",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.supervisor_account,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Crdit & Coupons",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Help Center",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.help_center,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.payment,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(thickness: 0.5, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Setting",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
