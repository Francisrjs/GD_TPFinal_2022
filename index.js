const {Pool}=require('pg'); //PGadmin
const moment = require('moment');  //Fecha y Hora al momento
const fs= require('fs'); //para hacer el guardado de los archivos
const config= {
    host: 'localhost',
    user: 'postgres',
    password: '123', //si tiene contraseña el postgres
    database: 'ejercicio_integrador' //acá va el nombre de la base de datos
}
//Procedimiento para obtener el tiempo
var prueba ="SELECT fvapnam, ftscprd  FROM sc_e005.p_appapp_dat;"
//----
//Caso importante  en el 3er 4to parametro debemos indicar el esquema para eso ponemos 
// esquema.Tabla
//----
var ejemploCopyTable="SELECT sc_e002.copy_table( 'sc_e002', 'sc_e002', 'sc_e002.p_icrdd', 'sc_e002.p_icrbd' );";
const date = new Date();
const pool=new Pool(config);
var query=prueba;

const getTabla = async()=>{
    try{
 console.log(moment().format('MMMM DD YYYY, h:mm:ss a'));
    pool.query("SET search_path TO 'sc_e002';") 
    const res= (await pool.query(query));
    //Proceso de guardado
    fs.appendFileSync('LogsPostgres.txt','\n');
    fs.appendFileSync('LogsPostgres.txt',moment().format('MMMM DD YYYY, h:mm:ss a'));
    fs.appendFileSync('LogsPostgres.txt','\n '&&query);
    query=res.rows;
    console.log(query);
    } catch (err){
        //Seccion de erroresds
       console.log(err);
       fs.appendFileSync('LogsPostgres.txt','\n');
       fs.appendFileSync('LogsPostgres.txt',"Error");
       fs.appendFileSync('LogsPostgres.txt','\n');
    }
   
}
//client es para una conexión y pool es para varías conexiones, Queary es consultar cosas
getTabla();

//Conectarse a postgres vía windows psql -U postgres , vía linux sudo -u postgres psql. PARA SALIR \q

