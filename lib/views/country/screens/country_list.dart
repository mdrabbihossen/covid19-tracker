import 'package:covid19_tracker/services/stats_services.dart';
import 'package:covid19_tracker/utils/app_colors.dart';
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
        leading: const Icon(Icons.arrow_back_ios),
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
                    return ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(

                          snapshot.data![index]['countryInfo']['flag'] ??
                              const CircularProgressIndicator(
                                strokeWidth: 5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.deepGreen,
                                ),
                              ),
                        ),
                      ),
                      title: Text(
                        snapshot.data![index]['country'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Total Cases: ${snapshot.data![index]['cases']}",
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
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
