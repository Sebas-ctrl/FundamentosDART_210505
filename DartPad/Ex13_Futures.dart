void main() {
    print("Inicio del programa");
    httpGet('https://sebastian.com')
    .then(
    (value) {
        print(value);
    }).catchError((err) {
        print("Error: $err");
    });
    print("Fin del programa");
}
Future<String> httpGet(String url) {
    return Future.delayed(const Duration(seconds: 1), () {
        throw 'Error en la petición https';
        //return "Respuesta del servidor";
    });
}