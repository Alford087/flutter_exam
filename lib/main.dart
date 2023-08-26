import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).studio_page_name),
        leading: IconButton(
          icon: Image.asset("images/drawable/icon_back.png"),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("images/drawable/icon_setting.png"),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("images/drawable/icon_more.png"),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // 第二个布局：头部信息
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      children: [
                        Text(
                          '吴清风名师工作室',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '一级标签 · 二级标签 ·三级标签',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          '成员 30 | 资源 90 | 浏览量 1564',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    )),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).studio_focus),
                  ),
                ),
              ],
            ),
          ),
          // 第三个布局：可滑动的Tab布局
          Expanded(
            child: DefaultTabController(
              length: 3, // 替换为您的tab数量
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // 第一个Tab对应的布局
                        ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Item $index'),
                            );
                          },
                        ),
                        // 第二个Tab对应的布局
                        ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Item $index'),
                            );
                          },
                        ),
                        // 第三个Tab对应的布局
                        ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Item $index'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
