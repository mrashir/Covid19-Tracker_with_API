import 'package:covid_tracker/Services_API/worldwideservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountryList> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WorldServies worldServies = WorldServies();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('country list'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'search with Country Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
// create future builder data for showing apis data
            Expanded(
              child: FutureBuilder(
                  future: worldServies.(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade300,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 50,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 50,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: snapshot.data![index]['countryinfo']
                                        ['flag'] ==
                                    null
                                ? SizedBox()
                                : Image.network(snapshot.data![index]
                                    ['countryinfo']['flag']),
                            title: Text(
                                snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
