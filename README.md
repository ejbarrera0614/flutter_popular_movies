# Popular movies

Este repositorio contiene una app hecha con Flutter que consume la API de películas populares de [The Movie Database](https://developers.themoviedb.org/3/movies/get-popular-movies.).

# Requisitos
Antes de comenzar, asegúrese de tener instalado Flutter y Dart en su sistema. Si no los tiene, consulte la [documentación oficial](https://docs.flutter.dev/get-started/install) para obtener instrucciones detalladas sobre cómo instalarlos.

# Ejecución
Para ejecutar la aplicación, abra una terminal en el directorio raíz del proyecto y ejecute el siguiente comando:

- **flutter run**

Esto compilará la aplicación y la ejecutará en un emulador o dispositivo conectado.

# Características
La aplicación muestra una lista de películas populares en un scroll que va cargando más películas a medida que se va bajando y que son obtenidas de la API de The Movie Database.

Al tocar una película, se muestra una pantalla de detalles que muestra información adicional sobre la película, como la sinopsis, puntaje promedio y consume la api de los [géneros](https://developers.themoviedb.org/3/genres/get-movie-list) y muestra los correspondientes en la pantalla.

En la pantalla detalles muestra una imagen de fondo y una caja bordeada con los detalles de la película y que tiene un scroll en caso de que la sinopsis sea muy larga.

Al cambiar a una orientación landscape, la imagen y los bordes de la caja se eliminan.

Fuentes de algunos recursos investigados y estudiados para aplicar en la prueba. 
- [Enlace de diseño que sirvio de inspiración](https://stripo.email/en/demo/?template=1141455&project=386966&guid=72c248b1-b891-4a2e-820b-879e4f3db2a8)
- [Enlace de diseño que sirvio de inspiración](https://dribbble.com/shots/7365479-Movies-App)
- [Enlace de recurso utilizado para aprender sobre MVVM](https://www.youtube.com/watch?v=W1e7d3cvnRo&t=2s)
- [Enlace de recurso para aprender Flutter](https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/18737232#content)

