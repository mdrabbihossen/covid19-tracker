import 'package:covid19_tracker/services/stats_services.dart';
import 'package:covid19_tracker/utils/app_colors.dart';
import 'package:covid19_tracker/views/details_screen.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          // search country text field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search Country",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          // search country text field end
          // country list
          Expanded(
              child: FutureBuilder(
            future: StatsServices().getCountriesStats(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.deepGreen,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final String countryName = snapshot.data![index]['country'];
                    final String countryFlag =
                        snapshot.data![index]['countryInfo']['flag'];
                    final int totalCases = snapshot.data![index]['cases'];
                    if (searchController.text.isEmpty) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DetailsScreen(
                                countryName: countryName,
                              ),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            countryFlag ?? "",
                          ),
                        ),
                        title: Text(
                          countryName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Total Cases: $totalCases",
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    } else if (countryName
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            countryFlag ?? "",
                          ),
                        ),
                        title: Text(
                          countryName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Total Cases: $totalCases",
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }
            },
          )),
        ],
      )),
    );
  }
}
