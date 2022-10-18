const {Pool}=require('pg'); //PGadmin
const moment = require('moment');  //Fecha y Hora al momento
const fs= require('fs'); //para hacer el guardado de los archivos
var querys
const config= {
    host: 'localhost',
    user: 'postgres',
    password: '123', //si tiene contraseña 
    database: 'final' //acá va el nombre de la base de datos
}
//Procedimiento para obtener el tiempo

const date = new Date();
const pool=new Pool(config);
var query ='SELECT fvapnam, ftscprd  FROM sc_e005.p_appapp_dat'
const getTabla = async()=>{
    try{
 console.log(moment().format('MMMM DD YYYY, h:mm:ss a'));
    const res= await (await pool.query(query));
    query=res.rows;
    console.log(query);
    } catch (err){
       console.log(err);
    }
   
}
//client es para una conexión y pool es para varías conexiones, Queary es consultar cosas
getTabla()
            .then(console.log)
            .catch(console.error);
try{
    fs.appendFileSync('LogsPostgres.json','\n');
    fs.appendFileSync('LogsPostgres.json',moment().format('MMMM DD YYYY, h:mm:ss a'));
    fs.appendFileSync('LogsPostgres.json','\n '&&query); //No me deja meter el resultado de la
     
    //fs.writeFileSync('./quotes.json',JSON.stringify(quotes),'utf8')
}   catch(err){
    console.log(err)
}

//Conectarse a postgres vía windows psql -U postgres , vía linux sudo -u postgres psql. PARA SALIR \q

