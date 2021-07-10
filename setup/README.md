# Setup


### Pasos para ejecutar el programa

1. Clonar el repositorio

2. tener instalado la gema rubicritic

3. Instalar las dependencias
```
    bundle install
```
4. ejecutar el archivo principal del juego ```bowling.rb```
```
    ruby src/bowling.rb
```
5. ejecutar el archivo rakefile, para ejecutar las pruebas y generar los reportes
```
    rake
```
las pruebas se encuentran en ``` spec/model```

la puntuación de rubycritic se encuentra en ```rubicritic```

la puntuación en svg se encuentra en ```badges/src``` para el código y ```badges/test``` para las pruebas

el reporte generado por sandimeter se encuentra en ```sandi_meter```