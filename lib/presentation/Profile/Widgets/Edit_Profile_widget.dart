import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController Controller_name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController DateOfBirth = TextEditingController();
  TextEditingController Address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg'),
                          ))),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                         // width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: Controller_name,
              decoration: InputDecoration(
                  labelText: "UserName",
                  labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

                  ),
            ),
            TextField(
              controller: Controller_name,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Controller_name,
              decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Controller_name,
              decoration: InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Controller_name,
              decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
          ],
        ),
      ),
    );
  }
}
