import 'package:covid_tracker/Services_API/worldwideservices.dart';
import 'package:covid_tracker/countries_list.dart';
import 'package:covid_tracker/model/worldwidemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final colorlist = <Color>[
    const Color(0xff2E7D32),
    Colors.blue,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    WorldServies worldServies = WorldServies();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                future: worldServies.fetchWorldWideRecord(),
                builder: (context, AsyncSnapshot<Worldwide> snapshot) {
                  // here we can add loading method with spinkit package
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _controller,
                        ));
                  } else {
                    // here we can add data with apis
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'total':
                                // this is code for showing data in pie
                                double.parse(snapshot.data!.cases!.toString()),
                            'Recoverd': double.parse(
                                snapshot.data!.recovered!.toString()),
                            'Death':
                                double.parse(snapshot.data!.deaths!.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                          colorList: colorlist,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseRow(
                                  title: 'Total',
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseRow(
                                  title: 'Recoverd',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                ReuseRow(
                                  title: 'Death',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                ReuseRow(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString(),
                                ),
                                ReuseRow(
                                  title: 'Active',
                                  value: snapshot.data!.active.toString(),
                                ),
                                ReuseRow(
                                  title: 'Today Recoverd',
                                  value:
                                      snapshot.data!.todayRecovered.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CountryList()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text('Track Countries'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CountryList()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text('Country List Cases'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
// ignore: must_be_immutable
class ReuseRow extends StatelessWidget {
  String title, value;
  ReuseRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
