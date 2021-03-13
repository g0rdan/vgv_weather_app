import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_app/weather/bloc/weather_bloc.dart';

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
    return BlocListener<CitySelectionBloc, CitySelectionState>(
      listener: (context, state) {
        if (state is CityNameSubmitted) {
          if (FocusScope.of(context).isFirstFocus) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
          BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(
            city: state.name,
          ));
        }
      },
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'New York',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => BlocProvider.of<CitySelectionBloc>(context).add(
                CitySelected(name: _textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
