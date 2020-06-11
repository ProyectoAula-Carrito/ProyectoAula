var patronnomb=/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/;
var patrontex=/^[a-zA-Z0-9]+$/;
var patronduo=/^[0-9]+$/;
var patroncua=/^[0-9]+$/;
var patroncor=/^(^[a-zA-Z-0-9]+@{1}[a-z]+(([.](com|web|org|gob|ipn)){1}([.](jp|es|mx))?){1}$){1}/;
var patroncod=/(^[T])+([0-9]+$)/;
var patrontal=/(XS|CH|MD|GR|XL)/;
var patronimg=/^(^[a-zA-Z-0-9]+(([.](png|jpg|gif|jpge|csv)){1}$){1}/;



function validaregister(){
    var correo=document.formularioc.correo.value;
    var nombres=document.formularioc.names.value;
    var appat=document.formularioc.Appat.value;
    var apmat=document.formularioc.Apmat.value;
    var dia=document.formularioc.dia.value;
    var mes=document.formularioc.mes.value;
    var year=document.formularioc.year.value;
    var confirm=document.formularioc.confirm.value;
    var password=document.formularioc.password.value;
    if (correo == null || correo.length == 0 || /^\s+$/.test(correo) || nombres == null || nombres.length == 0 || /^\s+$/.test(nombres) ||
            appat == null || appat.length == 0 || /^\s+$/.test(appat) ||apmat == null || apmat.length == 0 || /^\s+$/.test(apmat) ||
            dia == null || dia.length == 0 || /^\s+$/.test(dia) ||mes == null || mes.length == 0 || /^\s+$/.test(mes) ||
            year == null || year.length == 0 || /^\s+$/.test(year) ||confirm == null || confirm.length == 0 || /^\s+$/.test(confirm) ||
            password == null || password.length == 0 || /^\s+$/.test(password) ) {
        alert('Tiene que llenar todos los datos');
            document.formularioc.vajs.value=6
        
    }else{
        if (!patroncor.test(correo)) {
            alert('Ha introducido un dato erroneo en el correo');
            document.formularioc.vajs.value=6
        }
        if(!patronnomb.test(nombres)){
            if (comprobarAcentos(nombres)) {
                alert('Ha introducido un dato erroneo en el nombre');
                document.formularioc.vajs.value=6
            }
        }
        if(!patronnomb.test(appat)){
            if (comprobarAcentos(appat)) {
                alert('Ha introducido un dato erroneo en el apellido paterno');
                document.formularioc.vajs.value=6
            }
        }
        if(!patronnomb.test(apmat)){
            if (comprobarAcentos(appat)) {
                alert('Ha ontroducido un dato erroneo en el apellido materno');
                document.formularioc.vajs.value=6
            }
        }
        if(!patronduo.test(dia)){
            alert('Ha introduciod un dato erroneo en el dia');
            document.formularioc.vajs.value=6
        }
        if(!patronduo.test(mes)){
            alert('Ha introducido un dato erroneo en el mes');
            document.formularioc.vajs.value=6
        }
        if(!patroncua.test(year)){
            alert('Ha introducido un dato erroreno en el año');
            document.formularioc.vajs.value=6
        }
        if(!patrontex.test(password)){
            alert('Ha introducido un dato erroneo en la contraseña');
            document.formularioc.vajs.value=6
        }
        if(!password.equals(confirm)){
            alert('Las contraseñas no coinciden');
            document.formularioc.vajs.value=6
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
        if(!patrontex.test(password)){
            alert('Ha introducido un dato erroneo en la contraseña');
            document.formulario.vajs.value=6
        } 
    }
}
}


function validarprodu(){
    var cproducto=document.formulario1.codigo.value;
    var nombre=document.formulario1.nombre.value;
    var precio=document.formulario1.precio.value;
    var talla=document.formulario1.talla.value;
    var cantidad=document.formulario1.cantidad.value;
    var img=document.formulario1.img.value;
    if (cproducto == null || cproducto.length == 0 || /^\s+$/.test(cproducto) || nombre == null || nombre.length == 0 || /^\s+$/.test(nombre) ||
            precio == null || precio.length == 0 || /^\s+$/.test(precio) ||talla == null || talla.length == 0 || /^\s+$/.test(talla) ||
            cantidad == null || cantidad.length == 0 || /^\s+$/.test(cantidad) ||img == null || img.length == 0 || /^\s+$/.test(img) ) {
        alert('Tiene que llenar todos los datos');
            document.formulario1.vajs.value=6
    }else{
        if (!patroncod.test(cproducto)) {
            alert('Ha introducido un dato erroneo en el Codigo-Producto');
            document.formulario1.vajs.value=6
        }else if(!patronnomb.test(nombre)){
            alert('Ha introducido un dato erroneo en el nombre');
            document.formulario1.vajs.value=6
        }else if(!patronduo.test(precio)){
            alert('Ha introducido un dato erroneo en el precio');
            document.formulario1.vajs.value=6
        }else if(!patrontal.test(talla)){
            alert('Ha introducido un dato erroneo en la talla');
            document.formulario1.vajs.value=6
        }else if(!patronduo.test(cantidad)){
            alert('Ha introducido un dato erroneo en la cantidad');
            document.formulario1.vajs.value=6
        }else if(!patronimg.test(img)){
            alert('Ha introducido un dato erroneo en la img');
            document.formulario1.vajs.value=6
        }
    }
};
function validarprodu1(){
    var cproducto=document.formulario2.codigo.value;
    var nombre=document.formulario2.nombre.value;
    var precio=document.formulario2.precio.value;
    var talla=document.formulario2.talla.value;
    var cantidad=document.formulario2.cantidad.value;
    var img=document.formulario2.img.value;
    if (cproducto == null || cproducto.length == 0 || /^\s+$/.test(cproducto) || nombre == null || nombre.length == 0 || /^\s+$/.test(nombre) ||
            precio == null || precio.length == 0 || /^\s+$/.test(precio) ||talla == null || talla.length == 0 || /^\s+$/.test(talla) ||
            cantidad == null || cantidad.length == 0 || /^\s+$/.test(cantidad) ||img == null || img.length == 0 || /^\s+$/.test(img) ) {
        alert('Tiene que llenar todos los datos');
            document.formulario2.vajs.value=6
    }else{
        if (!patroncod.test(cproducto)) {
            alert('Ha introducido un dato erroneo en el Codigo-Producto');
            document.formulario2.vajs.value=6
        }else if(!patronnomb.test(nombre)){
            alert('Ha introducido un dato erroneo en el nombre');
            document.formulario2.vajs.value=6
        }else if(!patronduo.test(precio)){
            alert('Ha introducido un dato erroneo en el precio');
            document.formulario2.vajs.value=6
        }else if(!patrontal.test(talla)){
            alert('Ha introducido un dato erroneo en la talla');
            document.formulario2.vajs.value=6
        }else if(!patronduo.test(cantidad)){
            alert('Ha introducido un dato erroneo en la cantidad');
            document.formulario2.vajs.value=6
        }else if(!patronimg.test(img)){
            alert('Ha introducido un dato erroneo en la img');
            document.formulario2.vajs.value=6
        }
    }
};

function validarCprodu(){
    var cproducto=document.formulario0.cproducto.value;
    if (cproducto == null || cproducto.length == 0 || /^\s+$/.test(cproducto)) {
           alert('Tiene que llenar todos los datos');
            document.formulario0.vajs.value=6                             
    }else{
        if (!patroncod.test(cproducto)) {
            alert('Ha introducido un dato erroneo en el Codigo-Producto');
            document.formulario0.vajs.value=6
        }
    }
}
function validarCprodu1(){
    var cproducto=document.formulario3.codigo.value;
    if (cproducto == null || cproducto.length == 0 || /^\s+$/.test(cproducto)) {
           alert('Tiene que llenar todos los datos');
            document.formulario3.vajs.value=6                             
    }else{
        if (!patroncod.test(cproducto)) {
            alert('Ha introducido un dato erroneo en el Codigo-Producto');
            document.formulario3.vajs.value=6
        }
    }
}
