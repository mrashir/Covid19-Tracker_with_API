import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Whats app'),
          centerTitle: false,
          bottom: const TabBar(
            tabs: [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text('Chats')),
              Tab(child: Text('Status')),
              Tab(child: Text('Calls')),
            ],
          ),
          actions: [
            const Icon(Icons.search_rounded),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined),
                itemBuilder: (
                  context,
                ) =>
                    [
                      const PopupMenuItem(value: 1, child: Text('New Group')),
                      const PopupMenuItem(
                          value: 2, child: Text('New broadcast')),
                      const PopupMenuItem(
                          value: 3, child: Text('Linked devices')),
                      const PopupMenuItem(value: 4, child: Text('Settings')),
                    ]),
          ],
        ),
        body: TabBarView(children: [
          Text('Camera'),
          //chats setup
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.flhe3-2.fna.fbcdn.net/v/t39.30808-6/272043090_3116825481909366_468167322344059402_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFY4gKULoyOQMcg_eU9DI3xcXnt1WCx3Ghxee3VYLHcaKFQbmspT5QZAX3nY2Joj-h0mvmEwAC2Zn300Z4-hDkX&_nc_ohc=Y1fG8s7-_IEAX8eP7Wr&_nc_ht=scontent.flhe3-2.fna&oh=00_AfAZVK5KHqUPUxYlrVfHZHKcX6pIo20LjTn_-sTeZ5PcoQ&oe=65FE839F'),
                ),
                title: Text('M Ashir'),
                subtitle: Text('Flutter Developer'),
                trailing: Text('online'),
              );
            },
          ),
          // Status setup
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 3,
                        )),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://scontent.flhe3-2.fna.fbcdn.net/v/t39.30808-6/272043090_3116825481909366_468167322344059402_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFY4gKULoyOQMcg_eU9DI3xcXnt1WCx3Ghxee3VYLHcaKFQbmspT5QZAX3nY2Joj-h0mvmEwAC2Zn300Z4-hDkX&_nc_ohc=Y1fG8s7-_IEAX8eP7Wr&_nc_ht=scontent.flhe3-2.fna&oh=00_AfAZVK5KHqUPUxYlrVfHZHKcX6pIo20LjTn_-sTeZ5PcoQ&oe=65FE839F'),
                    ),
                  ),
                  title: Text('M Ashir'),
                  subtitle: Text('15 minuts ago'));
            },
          ),
          // calls setup
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.flhe3-2.fna.fbcdn.net/v/t39.30808-6/272043090_3116825481909366_468167322344059402_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFY4gKULoyOQMcg_eU9DI3xcXnt1WCx3Ghxee3VYLHcaKFQbmspT5QZAX3nY2Joj-h0mvmEwAC2Zn300Z4-hDkX&_nc_ohc=Y1fG8s7-_IEAX8eP7Wr&_nc_ht=scontent.flhe3-2.fna&oh=00_AfAZVK5KHqUPUxYlrVfHZHKcX6pIo20LjTn_-sTeZ5PcoQ&oe=65FE839F'),
                ),
                title: Text('M Ashir'),
                subtitle: Text(index / 2 == 0
                    ? '1 hr ago missed a audio call'
                    : '1 hr ago you missed video call'),
                trailing: Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
              );
            },
          ),
        ]),
      ),
    );
  }
}
