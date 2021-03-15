import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      BlocProvider.of<CitySelectionBloc>(context).add(
        CityChanged(text: _textController.text),
      );
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                key: const Key('text_form_field'),
                controller: _textController,
                onFieldSubmitted: (_) => _onSubmitted(),
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'New York',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('search_button'),
            icon: const Icon(Icons.search),
            onPressed: _onSubmitted,
          )
        ],
      ),
    );
  }

  void _onSubmitted() {
    BlocProvider.of<CitySelectionBloc>(context).add(
      CitySelected(name: _textController.text),
    );
  }
}
