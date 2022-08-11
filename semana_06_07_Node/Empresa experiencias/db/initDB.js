const getDB = require("./getDB");

async function main(){

  let connection;

  try {

    connection = await getDB();

    console.log('Eliminando tablas...');

    await connection.query('drop table if exists experiencia');
    await connection.query('drop table if exists empresa');
    await connection.query('drop table if exists usuario');

    console.log('Tablas eliminadas.');

    console.log('Creando tablas...');

    await connection.query(`
      create table if not exists usuario (
        id int unsigned primary key auto_increment,
        nombre varchar(80) not null,
        apellido1 varchar(100) not null,
        apellido2 varchar(100),
        fecha_nac date not null,
        email varchar(100) not null,
        password varchar(255) not null,
        tipo enum('administrador', 'usuario'),
        createdAt datetime
      )
    `);

    await connection.query(`
      create table if not exists empresa(
        id int unsigned primary key auto_increment,
        nombre varchar(80) not null
      )
    `)

    await connection.query(`
      create table if not exists experiencia(
        id int unsigned primary key auto_increment,
        titulo varchar(80) not null,
        precio decimal(8, 2) not null,
        descripcion text not null,
        localizacion varchar(100),
        idEmpresaOrganiza int not null
      )
    `);

    console.log('Tablas creadas.');

    console.log('Insertando datos...');

    await connection.query(
      `insert into usuario (nombre, apellido1, apellido2, fecha_nac, email, password, tipo, createdAt)
      values ('Jose Ramon', 'Perez', 'Asenjo', '1980-05-17', 'joseperas@gmail.com', 'perez0805', 'administrador', '2022-06-25 11:23:57')`
    );

    await connection.query(
      `insert into empresa (nombre)
      values('viajes riesgo'),
      ('descuelgues Soria')`
    );

    await connection.query(
      `insert into experiencia (titulo, precio, descripcion, localizacion, idEmpresaOrganiza)
      values('cuevas Altamira', 240.50, 'viaje y guia por las cuevas de altamira', 'Cantabria', 1),
      ('subida al Teide', 630, 'Viaje y excursión al Teide', 'Tenerife', 1),
      ('puenting', 279.90, 'Lanzamiento por un puente con una goma', 'Pueblo de Soria', 2),
      ('escalada', 115.50, 'subida por pared nivel medio', 'Pueblo de Soria2', 2 )`
    )



  } catch (error) {
    console.error(error.message);

  } finally {

    if (connection) connection.release();

    process.exit();
  }
};

main();