import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/user/user.dart';
import 'package:project/data/repositories/user_repository.dart';
import '../widgets/profile/profile_field.dart';
import '../widgets/profile/profile_pic.dart';

class ProfileRoute extends StatefulWidget {
  static const routeName = "profileRoute";
  ProfileRoute({Key? key}) : super(key: key);

  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  late Future<User> user =
      RepositoryProvider.of<UserRepositories>(context).getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data as User;
          return Scaffold(
            appBar: AppBar(
              title: Text('PROFILE'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: PreferredSize(
                  child: Container(
                    color: Colors.grey,
                    height: 0.3,
                  ),
                  preferredSize: Size.fromHeight(1.0)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProfilePic(user.profileImage!),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${user.email}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Field('Full Name', '${user.firstName} ${user.lastName}'),
                  Field('Email', '${user.email}'),
                  Field('Date Joined', '${user.dateCreated!.substring(0, 10)}'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('something went wrong'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
