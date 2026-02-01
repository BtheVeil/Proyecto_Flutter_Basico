import 'package:flutter/material.dart';

//Codigo creado por Bryan Saldarreaga Ch.
void main() {
  runApp(const MiAppUniversitaria());
}

class MiAppUniversitaria extends StatelessWidget {
  const MiAppUniversitaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 6to Semestre', // REQUISITO: Cambio de título
      theme: ThemeData(
        // REQUISITO: Cambio de color (Indigo)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Mi Proyecto'),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.inversePrimary, // Color del tema
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // REQUISITO: Texto principal modificado
            const Text(
              'Bienvenido a mi aplicación Flutter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // REQUISITO: Botón con SnackBar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Hola! Esto es un SnackBar funcional'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Mostrar Mensaje'),
            ),

            const SizedBox(height: 10),

            // REQUISITO: Navegación a segunda pantalla
            FilledButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Ir a Configuración'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SegundaPantalla(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPantalla extends StatefulWidget {
  const SegundaPantalla({super.key});

  @override
  State<SegundaPantalla> createState() => _SegundaPantallaState();
}

class _SegundaPantallaState extends State<SegundaPantalla> {
  bool _activarOpcion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Zona de Configuración', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),

            // REQUISITO: Widget de investigación (SwitchListTile)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SwitchListTile(
                title: const Text('Modo Oscuro (Simulado)'),
                subtitle: const Text('Widget investigado: SwitchListTile'),
                secondary: const Icon(Icons.dark_mode),
                value: _activarOpcion,
                onChanged: (bool valor) {
                  setState(() {
                    _activarOpcion = valor;
                  });
                },
              ),
            ),

            const Spacer(),

            // REQUISITO: Botón de regreso (Pop)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Regresar al Inicio'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
