import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainBlocState>(
      stream: context.read<MainBloc>().stream,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state!.map<Widget>(
            loading: (_) => Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (_) => Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text(
                  (state as MainLoadedState).userModel.name,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.accessible_forward_sharp),
                onPressed: () => context.read<MainBloc>().add(
                      MainBlocEvent.setUser(
                        userId: state.userModel.id + 1,
                      ),
                    ),
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
    //floatingActionButton: FloatingActionButton(child: Icon(Icons.accessible_forward_sharp), onPressed: ()=>context.read<MainBloc>().add(MainBlocEvent.setUser(userId: state.)),)
  }
}
