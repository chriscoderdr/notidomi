import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:notidomi/models/story.dart';

import '../stories_data_source.dart';

class MockStoriesDataSource implements StoriesDataSource {
  StreamController<List<Story>> _streamController =
      StreamController<List<Story>>();
  final List<Story> _stories = <Story>[
    Story(
      title: 'Yeni Berenice no aceptará ser fiscal electoral “por principios”',
      subtitle:
          'La exfiscal del Distrito Nacional fue propuesta para el cargo por el PRM',
      body: '''
      Alegando “principios y motivos legales”, la exfiscal del Distrito Nacional, Yeni Berenice Reynoso, anunció la noche de este lunes que decidió que no aceptaría el cargo de fiscal electoral en caso de ser elegida, tras ser propuesta para el mismo.

Reynoso fue sugerida para el cargo por el opositor Partido Revolucionario Moderno (PRM) en el marco del diálogo que efectúa el Centro Económico y Social (CES) con partidos políticos y miembros de la sociedad civil para lograr unas elecciones municipales transparentes y democráticas.

Anunció su decisión en su cuenta oficial de Twitter @YeniBerenice en dos mensajes.

“El sábado 7 de marzo del 2020, a través, de los medios de comunicación, recibí la noticia de que había sido propuesta para titular interina de la ‘Procuraduría Especializada para la Persecución de los Crímenes y Delitos Electorales’. ‘Valoro la propuesta, pero por razones de principios y por motivos de acciones legales que hemos iniciado en contra de decisiones del Consejo Superior del Ministerio Público, no puedo aceptar’”, fueron los post de la funcionaria judicial.
      ''',
      thumbnailUrl:
          'https://www.diariolibre.com/binrepository/547x362/0c0/546d350/none/10904/QOPX/yeni-berenice-reynoso-nueva3_13403783_20200309201700.jpg',
      publishedAt: DateTime.parse("2020-03-09 20:46"),
    ),
    Story(
      title: 'Yeni Berenice no aceptará ser fiscal electoral “por principios”',
      subtitle:
          'La exfiscal del Distrito Nacional fue propuesta para el cargo por el PRM',
      body: '''
      Alegando “principios y motivos legales”, la exfiscal del Distrito Nacional, Yeni Berenice Reynoso, anunció la noche de este lunes que decidió que no aceptaría el cargo de fiscal electoral en caso de ser elegida, tras ser propuesta para el mismo.

Reynoso fue sugerida para el cargo por el opositor Partido Revolucionario Moderno (PRM) en el marco del diálogo que efectúa el Centro Económico y Social (CES) con partidos políticos y miembros de la sociedad civil para lograr unas elecciones municipales transparentes y democráticas.

Anunció su decisión en su cuenta oficial de Twitter @YeniBerenice en dos mensajes.

“El sábado 7 de marzo del 2020, a través, de los medios de comunicación, recibí la noticia de que había sido propuesta para titular interina de la ‘Procuraduría Especializada para la Persecución de los Crímenes y Delitos Electorales’. ‘Valoro la propuesta, pero por razones de principios y por motivos de acciones legales que hemos iniciado en contra de decisiones del Consejo Superior del Ministerio Público, no puedo aceptar’”, fueron los post de la funcionaria judicial.
      ''',
      thumbnailUrl:
          'https://www.diariolibre.com/binrepository/547x362/0c0/546d350/none/10904/QOPX/yeni-berenice-reynoso-nueva3_13403783_20200309201700.jpg',
      publishedAt: DateTime.parse("2020-03-09 20:46"),
    ),
    Story(
      title: 'Yeni Berenice no aceptará ser fiscal electoral “por principios”',
      subtitle:
          'La exfiscal del Distrito Nacional fue propuesta para el cargo por el PRM',
      body: '''
      Alegando “principios y motivos legales”, la exfiscal del Distrito Nacional, Yeni Berenice Reynoso, anunció la noche de este lunes que decidió que no aceptaría el cargo de fiscal electoral en caso de ser elegida, tras ser propuesta para el mismo.

Reynoso fue sugerida para el cargo por el opositor Partido Revolucionario Moderno (PRM) en el marco del diálogo que efectúa el Centro Económico y Social (CES) con partidos políticos y miembros de la sociedad civil para lograr unas elecciones municipales transparentes y democráticas.

Anunció su decisión en su cuenta oficial de Twitter @YeniBerenice en dos mensajes.

“El sábado 7 de marzo del 2020, a través, de los medios de comunicación, recibí la noticia de que había sido propuesta para titular interina de la ‘Procuraduría Especializada para la Persecución de los Crímenes y Delitos Electorales’. ‘Valoro la propuesta, pero por razones de principios y por motivos de acciones legales que hemos iniciado en contra de decisiones del Consejo Superior del Ministerio Público, no puedo aceptar’”, fueron los post de la funcionaria judicial.
      ''',
      publishedAt: DateTime.parse("2020-03-09 20:46"),
    ),
    Story(
      title: 'Yeni Berenice no aceptará ser fiscal electoral “por principios”',
      subtitle:
          'La exfiscal del Distrito Nacional fue propuesta para el cargo por el PRM',
      body: '''
      Alegando “principios y motivos legales”, la exfiscal del Distrito Nacional, Yeni Berenice Reynoso, anunció la noche de este lunes que decidió que no aceptaría el cargo de fiscal electoral en caso de ser elegida, tras ser propuesta para el mismo.

Reynoso fue sugerida para el cargo por el opositor Partido Revolucionario Moderno (PRM) en el marco del diálogo que efectúa el Centro Económico y Social (CES) con partidos políticos y miembros de la sociedad civil para lograr unas elecciones municipales transparentes y democráticas.

Anunció su decisión en su cuenta oficial de Twitter @YeniBerenice en dos mensajes.

“El sábado 7 de marzo del 2020, a través, de los medios de comunicación, recibí la noticia de que había sido propuesta para titular interina de la ‘Procuraduría Especializada para la Persecución de los Crímenes y Delitos Electorales’. ‘Valoro la propuesta, pero por razones de principios y por motivos de acciones legales que hemos iniciado en contra de decisiones del Consejo Superior del Ministerio Público, no puedo aceptar’”, fueron los post de la funcionaria judicial.
      ''',
      thumbnailUrl:
          'https://www.diariolibre.com/binrepository/547x362/0c0/546d350/none/10904/QOPX/yeni-berenice-reynoso-nueva3_13403783_20200309201700.jpg',
      publishedAt: DateTime.parse("2020-03-09 20:46"),
    ),
  ];

  Stream<List<Story>> stories() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void initialize() {
    _streamController.add(_stories);
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  Stream<bool> inProgress() {
    throw false;
  }

  @override
  Stream<Story> story(String storyId) {
    // TODO: implement story
    throw UnimplementedError();
  }
}
