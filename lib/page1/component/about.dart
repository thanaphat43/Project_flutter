import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text("เกี่ยวกับแอพพลิเคชั่น"),
            tiles: [
              // SettingsTile(
              //   title: Text("ตั้งค่าแจ้งเตือนอุณหภูมิ"),
              // ),
              // SettingsTile.switchTile(
              //   title: Text("แจ้งเตือนอุณหภูมิสูงเกินกว่ามาตรฐาน"),
              // ),
            ],
          ),
          // SettingsSection(
          //   tiles: [
          //     SettingsTile.switchTile(
          //       title: Text("แจ้งเตือนอุณหภูมิสูงต่ำเกินมาตรฐาน"),
          //     ),
          //   ],
          // ),
          // SettingsSection(
          //   title: Text('Section 2'),
          //   tiles: [
          //     SettingsTile(
          //       title: Text('Security'),
          //     ),
          //     SettingsTile.switchTile(
          //         title: Text("เกี่ยวกับแอพพลิเคชั่น"),
          //         leading: Icon(Icons.fingerprint),
          //         onPressed: (BuildContext context) {}),
          //   ],
          //
        ],
      ),
    );
  }
}
