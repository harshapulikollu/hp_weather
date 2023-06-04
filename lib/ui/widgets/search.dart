import 'package:async/async.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget{
  const SearchWidget({Key? key, required this.onChanged}) : super(key: key);
  final void Function(String value) onChanged;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late CancelableOperation<void> cancellableOperation;

  final _delayTime = const Duration(milliseconds: 300);
  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        debugPrint('Cancelled operation');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(36.0),
          ),
        ),
        child: TextField(
          decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: 'Search a location or place here...',
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: widget.onChanged,
          onChanged: _onItemChanged,
        ),
      ),
    );
  }


  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }
}