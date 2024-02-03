import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/mode_cubit/cubit.dart';
import 'package:news_app/cubits/news_cubit/cubit.dart';
import 'package:news_app/cubits/news_cubit/state.dart';
import 'package:news_app/screens/search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusinessData(),
        child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (BuildContext context, NewsStates state) {},
            builder: (BuildContext context, NewsStates state) {
              NewsCubit cubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "News App",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SearchScreen()));
                        },
                        icon: Icon(
                          Icons.search,
                          color: ModeCubit.get(context).iconColor,
                        )),
                    IconButton(
                        onPressed: ModeCubit.get(context).toggleMode,
                        icon: ModeCubit.get(context).modeIcon)
                  ],
                ),
                body: cubit.screen[cubit.currentButton],
                bottomNavigationBar: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.business_center_outlined,
                        ),
                        label: "business"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.sports_outlined,
                        ),
                        label: "sport"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.science_outlined,
                        ),
                        label: "science"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings_outlined,
                        ),
                        label: "settings"),
                  ],
                  currentIndex: cubit.currentButton,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    cubit.changeBottunNavBarIndex(index: index);
                  },
                ),
              );
            }));
  }
}
