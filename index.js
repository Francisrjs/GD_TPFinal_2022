const {Pool}=require('pg');
const config= {
    host: 'localhost',
    user: 'postgres',
    password: '123', //si tiene contraseña 
    database: 'final' //acá va el nombre de la base de datos
}
const pool=new Pool(config);
const getTabla = async()=>{
    const res= await pool.query('SELECT fvapnam, ftscprd  FROM sc_e005.p_appapp_dat');
    console.log(res.rows);
}
//client es para una conexión y pool es para varías conexiones, Queary es consultar cosas
getTabla();
console.log("hello");
//Conectarse a postgres vía windows psql -U postgres , vía linux sudo -u postgres psql. PARA SALIR \q

