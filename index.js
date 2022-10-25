//Ejecutar "node index.js"
const {Pool}=require('pg'); //PGadmin   https://node-postgres.com/
const moment = require('moment');  //Fecha y Hora al momento  https://momentjs.com/
const fs= require('fs'); //para hacer el guardado de los archivos
const config= {
    host: 'localhost',
    user: 'postgres',
    password: '123', //si tiene contraseña el pgadmin
    database: 'ejercicio_integrador' //acá va el nombre de la base de datos
}
var prueba ="SELECT fvapnam, ftscprd  FROM sc_e005.p_appapp_dat;"
var ejemploCopyTable="SELECT sc_e002.copy_table( 'sc_e002', 'sc_e002', 'sc_e002.p_icrdd', 'sc_e002.p_icrbd' );";
var query=prueba;
//----
//Caso importante  en el 3er 4to parametro debemos indicar el esquema para eso ponemos 
// esquema.Tabla
//----
const pool=new Pool(config); //client es para una conexión y pool es para varías conexiones, Queary es consultar cosas
const date = new Date();

const getTabla = async()=>{
    try{
 console.log(moment().format('MMMM DD YYYY, h:mm:ss a')); //fecha
    pool.query(query); 
    const res= (await pool.query(query));
    //Proceso de guardado
    fs.appendFileSync('LogsPostgres.txt','\n ');
    fs.appendFileSync('LogsPostgres.txt',moment().format('MMMM DD YYYY, h:mm:ss a'));
    fs.appendFileSync('LogsPostgres.txt','\n '&&query);
    query=res.rows;
    console.log(query);
    } catch (err){
        //Seccion de errores
       console.log(err);
       fs.appendFileSync('LogsPostgres.txt','\n ');
       fs.appendFileSync('LogsPostgres.txt',moment().format('MMMM DD YYYY, h:mm:ss a'));
       fs.appendFileSync('LogsPostgres.txt',"Error");
       fs.appendFileSync('LogsPostgres.txt','\n ');
    }
   
}



//ejecuto la funcion
getTabla();

//Conectarse a postgres vía windows psql -U postgres , vía linux sudo -u postgres psql. PARA SALIR \q

