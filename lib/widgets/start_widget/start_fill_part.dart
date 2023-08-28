import 'package:flutter/material.dart';

class StartFill extends StatefulWidget {
  const StartFill({
    super.key,
    required this.onPlay,
    required this.textController,
  });
  final void Function() onPlay;
  final TextEditingController textController;
  @override
  State<StartFill> createState() => _StartFillState();
}

class _StartFillState extends State<StartFill> {
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode
  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode
    super.dispose();
  }

  void _onPress() {
    if (widget.textController.text.isNotEmpty) {
      widget.onPlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Let\'s Quiz',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextField(
                    controller: widget.textController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: _onPress,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6848FE),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.70, 50),
                  ),
                  child: const Text('Play'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
