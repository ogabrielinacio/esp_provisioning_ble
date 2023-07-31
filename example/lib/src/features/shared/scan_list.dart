import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

typedef ItemTapCallback = void Function(String item, BuildContext context);

class ScanList extends StatelessWidget {
  final List<String>? items;
  final IconData icon;
  final ItemTapCallback? onTap;
  final bool disableLoading;

  const ScanList(
      {this.items,
      required this.icon,
      Key? key,
      this.onTap,
      this.disableLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: sizeHeight * 0.15,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: items!.length,
            itemBuilder: (context, i) {
              return Container(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        icon,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                    title: Text(
                      items![i],
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      if (onTap != null) {
                        onTap!(items![i], context);
                      }
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).dividerColor,
              height: sizeHeight * 0.01,
            ),
          ),
        ),
      ],
    );
  }
}
