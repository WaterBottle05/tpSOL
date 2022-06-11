pragma soliditi ^0.8.10;
contract student {
private string nombre;
private string apellido_;
private string _curso;
private string docente;
private address _docente;
//para almacenar la address del owner
private bool _aprobo:
//bool cuya funcion explico mas adelante
private uint promedio_;
//variable que utilizo para almacenaar el promedio
private mapping (string => uint) notas_materias;
//elegimos uint debido a su capacidad de almacenar numeros enteros no negativos
private mapping (string => bool) inserted;
//esto lo creo para que una vez se añada una materia en notas_materia, se cree registro de esto en este mapping y no se añada devuelta, en el caso de que ya existia, en el array arr_m
private string memory[] arr_m;
//cree un array para poder hacer el promedio con los values del mapping, que, de otra forma serian inaccesibles porque el mapping no tiene posision 

constructor (string memory name_ , string memory _apellido, string memory _curso )
{   
    nombre = name_;
    apellido_ = _apellido;
    curso_ = _curso;
    _docente = msg.sender;   //justo aca declaro que el smg.sender es el address del docente para que luego tenga acceso a la funcion set_nota_materia

}

function apellido() public returns (string memory)
{
    return(apellido_);

}
function nombre_completo() public returns (string)
{
    return nombre;
}

function curso() public returns (uint)
{
    return _curso;
}
function set_nota_materia( uint nota, string memory materia) public
{
    //hago dos require para que el numero de la nota sea valida y para que solo el owner pueda llamar a la funcion
    require (msg.sender == _docente, "not owner");
    require (uint nota >=1 && <==100, "invalid mark");
    notas_materias [materia] = nota;


    if(!inserted[nota])
    {
        inserted[nota] = true;
        arr_m.push(materia);
    }

   
}

function nota_materia (string memory _materia) public returns (uint)
{
    return notas_materias[_materia];
}

function aprobo (string memory materia_) public returns (bool)
{
    //primero creo un bool falso, para que despues, si la nota es mayor a 60 se cambie a true y devolver ese valor 
    aprobo_ = false;
    notas_materias[materia_] = mark_;
    if (mark_ >= 60)
    {
        aprobo_ = true;
    }
    return(aprobo_)

}


function promedio() public returns(uint)
{
    for (i=0;i<arr_m.lenght; i++)
    {
        promedio_ += notas_materias[arr_m[i]];
    }
    promedio_ = promedio_ / arr_m.lenght;
    return (promedio_);//no hace falta hacer un redondeo manual porque ya esta automatizado el redondeo al cero, es decir la division de dos enteros dara otro entero
}

}
