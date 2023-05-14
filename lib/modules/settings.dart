import 'package:flutter/material.dart';
import 'package:untitled10/components/components.dart';

class settingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: NetworkImage('https://cdn.fal3arda.com/wp-content/uploads/2022/12/أسعار-الدولار-اليوم-1671635550.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
            width: 17.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'title',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  Text(
                    '18/12/2022',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}