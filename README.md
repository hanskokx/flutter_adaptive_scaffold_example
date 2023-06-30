# Using FlutterAdaptiveScaffold with GoRouter

I set out to answer [my own question](https://stackoverflow.com/questions/76584957/using-adaptivescaffold-from-flutter-adaptive-scaffold-with-go-router-to-show-a-l) posed to the StackOverflow community:

![q782l](https://github.com/hanskokx/flutter_adaptive_scaffold_example/assets/1911919/9cdcb3a3-0df6-43fd-b5bd-08c6a814a682)

The definition of done is as follows:

1 - On the top row, the wide layout is presented, whereas the bottom row shows the narrow layout. In both cases, the flow is:

- No navigation state
- Navigation item selected
- Item selected in list

2 - The URI for each step is as follows:

- /
- /nav1
- /nav1/2

This solution solves each of these problems and meets the definition of done. However, there is still room for improvement. Pull requests are welcome.
