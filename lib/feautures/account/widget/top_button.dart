import 'package:flutter/material.dart';
import 'package:my_project/feautures/account/widget/account_button.dart';
import 'package:my_project/feautures/account/widget/order.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
               AccountButton(onTap: (){}, text: 'Your Order'),
              AccountButton(onTap: (){}, text: 'Turn Seller')
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children:  [
              AccountButton(onTap: (){}, text: 'Log out'),
              AccountButton(onTap: (){}, text: 'Your wish List')
            ],
          ),
          const SizedBox(height: 10,),
          Orders()
        ],
      ),
    );
  }
}
