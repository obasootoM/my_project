import 'package:flutter/material.dart';
import 'package:my_project/provider/user_provvider.dart';
import 'package:provider/provider.dart';


class AdditionalBox extends StatelessWidget {
  
  const AdditionalBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 144, 226, 221),
            Color.fromARGB(255, 162, 236, 233)
          ]
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      child:  Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 24,),
          Expanded(child: Padding(padding:  const EdgeInsets.only(left: 5),
          child: Text('Delivery to ${user.Name} - ${user.Address}',
          style: const TextStyle(
            fontWeight: FontWeight.w500
          ),
            overflow: TextOverflow.ellipsis,
          ),
          )),
         const  Padding(padding:  EdgeInsets.only(left: 5, top: 2),
          child:  Icon(Icons.arrow_drop_down_outlined,
          size: 18,
          ),
          )
        ],
      ),
    );
  }
}
