var patronnomb=/^[A-Za-z\s]+$/;
var patrontex=/^[a-zA-Z0-9]+$/;
var patronduo=/^[0-9]+$/;
var patroncua=/^[0-9]+$/;
var patroncor=/^(^[a-zA-Z-0-9]+@{1}[a-z]+(([.](com|web|org|gob|ipn)){1}([.](jp|es|mx))?){1}$){1}/;

function validaregister(){
    var correo=document.formulario.correo.value;
    var nombres=document.formulario.names.value;
    var appat=document.formulario.Appat.value;
    var apmat=document.formulario.Apmat.value;
    var dia=document.formulario.dia.value;
    var mes=document.formulario.mes.value;
    var year=document.formulario.year.value;
    var confirm=document.formulario.confirm.value;
    var password=document.formulario.password.value;
    if (correo == null || correo.length == 0 || /^\s+$/.test(correo) || nombres == null || nombres.length == 0 || /^\s+$/.test(nombres) ||
            appat == null || appat.length == 0 || /^\s+$/.test(appat) ||apmat == null || apmat.length == 0 || /^\s+$/.test(apmat) ||
            dia == null || dia.length == 0 || /^\s+$/.test(dia) ||mes == null || mes.length == 0 || /^\s+$/.test(mes) ||
            year == null || year.length == 0 || /^\s+$/.test(year) ||confirm == null || confirm.length == 0 || /^\s+$/.test(confirm) ||
            password == null || password.length == 0 || /^\s+$/.test(password) ) {
        alert('Tiene que llenar todos los datos');
            document.formulario.vajs.value=6
        
    }else{
        if (!patroncor.test(correo)) {
            alert('Ha introducido un dato erroneo en el correo');
            document.formulario.vajs.value=6
        }else if(!patronnomb.test(nombres)){
            alert('Ha introducido un dato erroneo en el nombre');
            document.formulario.vajs.value=6
        }else if(!patronnomb.test(appat)){
            alert('Ha introducido un dato erroneo en el apellido paterno');
            document.formulario.vajs.value=6
        }else if(!patronnomb.test(apmat)){
            alert('Ha ontroducido un dato erroneo en el apellido materno');
            document.formulario.vajs.value=6
        }else if(!patronduo.test(dia)){
            alert('Ha introduciod un dato erroneo en el dia');
            document.formulario.vajs.value=6
        }else if(!patronduo.test(mes)){
            alert('Ha introducido un dato erroneo en el mes');
            document.formulario.vajs.value=6
        }else if(!patroncua.test(year)){
            alert('Ha introducido un dato erroreno en el año');
            document.formulario.vajs.value=6
        }else if(!patrontex.test(password)){
            alert('Ha introducido un dato erroneo en la contraseña');
            document.formulario.vajs.value=6
        }else if(!password.equals(confirm)){
            alert('Las contraseñas no coinciden');
            document.formulario.vajs.value=6
        }
    }
};

function validarlog(){
    var correo=document.formulario.correo.value;
    var password=document.formulario.password.value;
    if (correo == null || correo.length == 0 || /^\s+$/.test(correo) || password == null || password.length == 0 || /^\s+$/.test(password)) {
        alert('Tiene que llenar todos los datos');
            document.formulario.vajs.value=6
    }else{
       if (!patroncor.test(correo)) {
            alert('Ha introducido un dato erroneo en el correo');
            document.formulario.vajs.value=6
        }else if(!patrontex.test(password)){
            alert('Ha introducido un dato erroneo en la contraseña');
            document.formulario.vajs.value=6
        } 
    }
}
function validarCor(){
    var correo=document.formulario.correo.value;
    var password=document.formulario.password.value;
    if (correo == null || correo.length == 0 || /^\s+$/.test(correo) || password == null || password.length == 0 || /^\s+$/.test(password)) {
        alert('Tiene que llenar todos los datos');
            document.formulario.vajs.value=6
    }else{
       if (!patroncor.test(correo)) {
            alert('Ha introducido un dato erroneo en el correo');
            document.formulario.vajs.value=6
        }
    }
}