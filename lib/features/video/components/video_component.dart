import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';

import '../../../gen/assets.gen.dart';

class VideoComponent extends StatelessWidget {
  final List<VideoModel> videos;
  final Function(VideoModel video)? onVideoTap;

  const VideoComponent({
    super.key,
    required this.videos,
    this.onVideoTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    video.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: AppColors.color_4097A7CC.withOpacity(0.5),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        video.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => onVideoTap?.call(video),
                      child: Container(
                        width: 56,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.color_4097A7CC.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.images.icPlay.path,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
