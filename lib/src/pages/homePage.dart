import 'package:bloc_test/src/blocs/internet_bloc.dart';
import 'package:bloc_test/src/blocs/internet_bloc.dart';
import 'package:bloc_test/src/blocs/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetOnState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'nternet Is Connected',
                    style: TextStyle(fontSize: 20, color: Colors.white),

                  ),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(50),
                  elevation: 30,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Internet Off',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetOnState) {
              return Text(
                'Internet Is Connected',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              );
            } else if (state is InternetLostState) {
              return Text('Internet is not Connected ');
            } else {
              return Text('Loding');
            }
          },
        ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetOnState) {
        //       return Text(
        //         'Internet Is Connected',
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       );
        //     } else if (state is InternetLostState) {
        //       return Text('Internet is not Connected ');
        //     } else {
        //       return Text('Loding');
        //     }
        //   },
        // ),
      ),
    );
  }
}
