import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc_cubit/controllers/profile_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProfileCubit(),
        child: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BlocSelector - Profile Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: "First Name"),
              onSubmitted: (value) => context.read<ProfileCubit>().changeFirstName(value),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: "Last Name"),
              onSubmitted: (value) => context.read<ProfileCubit>().changeLastName(value),
            ),
            const SizedBox(height: 20),
            BlocSelector<ProfileCubit, ProfileState, String>(
              selector: (state) => state.firstName,
              builder: (context, firstName) {
                return Text("First Name = $firstName");
              },
            ),
            const SizedBox(height: 20),
            BlocSelector<ProfileCubit, ProfileState, String>(
              selector: (state) => state.lastName,
              builder: (context, lastName) {
                return Text("Last Name = $lastName");
              },
            ),
          ],
        ),
      ),
    );
  }
}
