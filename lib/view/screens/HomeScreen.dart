import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meridian_mechine_test/controller/bloc/fetch_data_bloc.dart';
import 'package:meridian_mechine_test/view/screens/shimmer.dart';
import 'package:meridian_mechine_test/view/widgets/%20MainTile.dart';
import 'package:meridian_mechine_test/view/screens/DetailsScreen.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDataBloc(),
      child: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> filterOptions = [
    'Trending',
    'Relationship',
    'Self Care',
    'Family'
  ];

  String selectedFilter = 'Trending';
  @override
  void initState() {
    BlocProvider.of<FetchDataBloc>(context).add(Fetchlist());
    super.initState();
  }

  Future refresh() async {
    BlocProvider.of<FetchDataBloc>(context).add(Fetchlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Image.asset("assets/Ellipse 2.png"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Social Media Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filterOptions[index];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedFilter == filterOptions[index]
                              ? const Color.fromARGB(255, 254, 130, 53)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          filterOptions[index],
                          style: TextStyle(
                            color: selectedFilter == filterOptions[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            BlocBuilder<FetchDataBloc, FetchDataState>(
              builder: (context, state) {
                if (state is Successfetch) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.separated(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Detailsscreen(
                                              title: state
                                                  .fetchdata.media[index].title,
                                              body: state
                                                  .fetchdata.media[index].body,
                                            )));
                              },
                              child: Maintile(
                                description: state.fetchdata.media[index].body,
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          thickness: 0.4,
                        ),
                      ),
                    ),
                  );
                } else if (state is Loadingfetch) {
                  // return const Center(child: CircularProgressIndicator());
                  return ShimmerLoading();
                } else if (state is Failurefetch) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(state.message!),
                  //   ),
                  // );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
