import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, "Избранное"),
    MenuRowData(Icons.call, "Звонки"),
    MenuRowData(Icons.computer, "Устройства"),
    MenuRowData(Icons.folder, "Папка с чатами"),
  ];

  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, "Уведомления и звуки"),
    MenuRowData(Icons.privacy_tip, "Конфидециальность"),
    MenuRowData(Icons.date_range, "Данные и память"),
    MenuRowData(Icons.brush, "Оформление"),
    MenuRowData(Icons.language, "Язык"),
    MenuRowData(Icons.sticky_note_2, "Стикеры"),
  ];

  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.lock_clock, "Apple Watch"),
  ];

  List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, "Помощь"),
    MenuRowData(Icons.question_answer, "Вопросы"),
  ];

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const UserInfo(),
            const SizedBox(
              height: 30,
            ),
            MenuWidget(menuRow: firstMenuRow),
            const SizedBox(
              height: 30,
            ),
            MenuWidget(menuRow: secondMenuRow),
            const SizedBox(
              height: 30,
            ),
            MenuWidget(menuRow: thirdMenuRow),
            const SizedBox(
              height: 30,
            ),
            MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  MenuRowData(this.icon, this.text);
}

class MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          const SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "@Fresp",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 17,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "+1(456)789 12 34",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: const Column(
            children: [
              SizedBox(
                height: 30,
              ),
              _AvatarWidget(),
              SizedBox(
                height: 30,
              ),
              _UserNameWidget(),
              SizedBox(
                height: 10,
              ),
              _UserPhoneWidget(),
              SizedBox(
                height: 10,
              ),
              _UserNickNameWidget(),
            ],
          ),
        ),
        const Positioned(
          top: 25,
          right: 25,
          child: Text(
            "Изм.",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Zib <Fresp> Dan",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 100, height: 100, child: Placeholder());
  }
}
