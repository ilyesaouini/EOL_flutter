import 'package:copihass/models/plan_class_session.dart';
import 'package:copihass/models/user.dart';
import 'package:copihass/ui/class/bloc/class_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassPage extends StatefulWidget {
  final SharedPreferences prefs;
  const ClassPage({super.key, required this.prefs});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Plan_Class_Session> classList = [];
  User user = User();

  void initState() {
    super.initState();
    user = User(
      id: widget.prefs.getString('id'),
      role: widget.prefs.getString('role'),
    );
    context.read<ClassBloc>().add(GetListClass());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClassBloc, ClassState>(
      listener: (context, state) {
        if (state is ClassLoaded) {
          classList = state.classList;
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 236, 26, 26),
                    Color.fromARGB(255, 88, 87, 86)
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomCenter,
                  stops: [0.0, 0.8],
                  tileMode: TileMode.mirror),
            ),
            child: state is ClassInitial || state is ClassLoading
                ? ClassListLoader()
                : ListView.builder(
                    itemCount: classList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 17, 17, 17),
                                  width: 0.5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Class: ${classList[index].code_cl}",
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Module: ${classList[index].code_module}",
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ));
      },
    );
  }
}

class ClassListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
