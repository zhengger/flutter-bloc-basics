import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/bloc/bloc_provider.dart';
import 'package:flutter_bloc_basics/bloc/movie_search_bloc.dart';

class CustomAppBar extends StatelessWidget {
  double appBarHeight(BuildContext context) =>
      150.0 + MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: appBarHeight(context),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Movie Search',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: 34, color: Colors.white),
              ),
              SearchBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MovieSearchBloc bloc = BlocProvider.of<MovieSearchBloc>(context);
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a Movie Title',
          fillColor: Colors.white,
        ),
        // onChanged: (query) {},
        onSubmitted: bloc.addQuery,
      ),
    );
  }
}
