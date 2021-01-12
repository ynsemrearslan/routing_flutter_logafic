import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:navigator_flutter_web/datamodels/episode_item_model.dart';
import 'package:navigator_flutter_web/viewmodels/episode_list_view_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel> episodes;
  EpisodesList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpisodeListViewModel>.reactive(
      viewModelBuilder: () => EpisodeListViewModel(),
      builder: (context, model, child) => Wrap(
        spacing: 30,
        runSpacing: 30,
        children: <Widget>[
          ...episodes
              .asMap()
              .map((index, episode) => MapEntry(
                  index,
                  GestureDetector(
                    child: EpisodeItem(model: episode),
                    onTap: () => model.navigateEpisode(index),
                  )))
              .values
              .toList()
        ],
      ),
    );
  }
}
