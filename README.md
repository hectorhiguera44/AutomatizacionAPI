Prueba de API con Karate: JSONPlaceholder

Este proyecto contiene un conjunto de pruebas de API automatizadas utilizando el framework Karate para interactuar con la API pública de JSONPlaceholder. Las pruebas cubren las operaciones básicas de CRUD (Crear, Leer, Actualizar, Eliminar) para el recurso de publicaciones (/posts).

Características principales
Validación completa: Las pruebas verifican el código de estado HTTP y la estructura de la respuesta para cada operación.

Flujo de prueba encadenado: Los escenarios están diseñados para ejecutarse en un orden específico, donde el id de una publicación creada se reutiliza en las pruebas de actualización, eliminación y validación de borrado.

Manejo de datos: Se utiliza un archivo JSON externo (post.json) para los datos de la solicitud POST, lo que facilita la gestión de los datos de prueba.

Cómo ejecutar las pruebas
Para ejecutar las pruebas, necesitas tener Java JDK (versión 8 o superior) y Maven instalados.

Clona o descarga el proyecto en tu máquina local.

Navega hasta la raíz del proyecto en tu terminal.

Ejecuta el siguiente comando para iniciar las pruebas:

Bash

mvn test
Este comando buscará y ejecutará la clase KarateRunner, la cual a su vez ejecutará el archivo jsonplaceholder.feature que contiene todos los escenarios de prueba.

Escenarios de prueba
El flujo de prueba sigue los siguientes pasos para verificar el comportamiento completo de la API:

Crear una nueva publicación (POST): Se envía una solicitud para crear una nueva publicación y se verifica que la respuesta tenga un estado 201 y la estructura de datos esperada. El id de la publicación creada se guarda para su uso posterior.

Actualizar una publicación existente (PUT): Se usa el id de la publicación del paso anterior para actualizar su título y cuerpo. Se valida que la respuesta tenga un estado 200 y que los datos se hayan actualizado correctamente.

Eliminar una publicación (DELETE): Se envía una solicitud para eliminar la publicación usando su id. Se espera una respuesta con estado 200.

Validar que la publicación fue eliminada (GET): Se intenta recuperar la publicación eliminada con una solicitud GET. La prueba es exitosa si la API responde con un estado 404 (No encontrado), confirmando que la eliminación fue exitosa.

Estructura del proyecto
La estructura de archivos es clara y organizada:


<img width="339" height="269" alt="image" src="https://github.com/user-attachments/assets/2e1cdcde-8e59-407f-8c4b-f66d71045651" />


KarateRunner.java: Contiene la configuración para ejecutar el archivo .feature.

jsonplaceholder.feature: Define todos los escenarios de prueba utilizando la sintaxis Gherkin.

post.json: Almacena los datos de prueba en formato JSON para la solicitud POST.

pom.xml: Administra las dependencias del proyecto, incluyendo Karate y JUnit.

Espero que este README sea útil para tu proyecto. Si necesitas alguna modificación o tienes más archivos, no dudes en compartirlos.
