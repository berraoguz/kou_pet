import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/video/video_detail.dart';
import 'package:koupet/view_model/education_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PageEducationVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EducationViewModel(),
      child: _PageEducationVideo(),
    );
  }
}

class _PageEducationVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var videoDataListProvider = Provider.of<EducationViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Eğitim Videoları'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < videoDataListProvider.videoDataList.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(
                    controller: videoDataListProvider.videoDataList[i].controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          videoDataListProvider.videoDataList[i].basliktext,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.all(8.0), // İstediğiniz padding değerini burada belirleyebilirsiniz.
                              minimumSize: Size(40, 40), // İstediğiniz boyutu burada belirleyebilirsiniz.
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoDetailPage(
                                    videodata: videoDataListProvider.videoDataList[i],
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.play_arrow, color: Colors.white),
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (videoDataListProvider.videoDataList[i].isTextVisible)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        videoDataListProvider.videoDataList[i].text,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
