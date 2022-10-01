import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../busieness_logic/ProfileCubit/cubit.dart';

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
  final ImagePicker _picker = ImagePicker();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<ProfileCubit>(context).getprofileinfo("dHlbidFF9j1tptoFhvFM8VlQzqrW428SwVULIoqwvSwamZJ1B0csMMr13xvT");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<ProfileCubit>(context).updateprofileinfo("dHlbidFF9j1tptoFhvFM8VlQzqrW428SwVULIoqwvSwamZJ1B0csMMr13xvT", Controller_name.text, Email.text,


                (  BlocProvider.of<ProfileCubit>(context).image)!);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Edit Profile",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Center(
              child: Stack(
                children: [

                  InkWell(

                    child: Container(
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
                              image:

                              NetworkImage(
                                  (  BlocProvider.of<ProfileCubit>(context).profile_info.data?.image)!),
                            ))),
                    onTap: ()async{
                      BlocProvider.of<ProfileCubit>(context).pickImage();

                    },
                  ),
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
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: Controller_name,
              decoration: const InputDecoration(
                  labelText: "UserName",
                  labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

                  ),
            ),
            TextField(
              controller: Email,
              decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Phone,
              decoration: const InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: DateOfBirth,
              decoration: const InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            TextField(
              controller: Address,
              decoration: const InputDecoration(
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
