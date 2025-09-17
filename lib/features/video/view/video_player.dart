import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController? _controller;
  VideoModel? _video;
  String? _errorMessage;
  bool _isLoading = true;
  bool _depsInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_depsInitialized) return;
    _depsInitialized = true;

    try {
      final extra = GoRouterState.of(context).extra;
      if (extra is! VideoModel) {
        setState(() {
          _errorMessage = 'Не передан VideoModel в GoRouter extra';
          _isLoading = false;
        });
        return;
      }

      _video = extra;

      if (_video!.videoUrl.isEmpty) {
        setState(() {
          _errorMessage = 'URL видео пустой';
          _isLoading = false;
        });
        return;
      }

      final videoId = YoutubePlayer.convertUrlToId(_video!.videoUrl);
      if (videoId == null) {
        setState(() {
          _errorMessage = 'Неверный YouTube URL';
          _isLoading = false;
        });
        return;
      }

      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: false,
          hideControls: false,
          controlsVisibleAtStart: true,
          enableCaption: false,
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка создания плеера: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = _video?.title ?? 'Видео';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: _errorMessage != null
          ? _ErrorView(
        message: _errorMessage!,
        onRetry: () {
          setState(() {
            _errorMessage = null;
            _isLoading = true;
            _depsInitialized = false;
          });
        },
      )
          : _isLoading || _controller == null
          ? const Center(
        child: CircularProgressIndicator(color: Colors.white),
      )
          : YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.color_4097A7CC,
          progressColors: const ProgressBarColors(
            playedColor: AppColors.color_4097A7CC,
            handleColor: AppColors.color_4097A7CC,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          Text(message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Повторить')),
        ],
      ),
    );
  }
}
