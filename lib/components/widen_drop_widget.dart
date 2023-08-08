import 'package:flutter/material.dart';

class WidenDropWidget extends StatelessWidget {
  const WidenDropWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).highlightColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Optional Components',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        // const SelectBox(
        //     componentName: 'Component A',
        //     description:
        //         'Some definite expressions here to be more clear Some definite expressions here to be more ',
        //     imagePath: 'widen drop.png'),
        // const SelectBox(
        //     componentName: 'Component B',
        //     description:
        //         'Some definite expressions here to be more clear Some definite expressions here to be more ',
        //     imagePath: 'widen drop.png'),
        // const SelectBox(
        //     componentName: 'Component C',
        //     description:
        //         'Some definite expressions here to be more clear Some definite expressions here to be more ',
        //     imagePath: 'widen drop.png'),
      ],
    );
  }
}
