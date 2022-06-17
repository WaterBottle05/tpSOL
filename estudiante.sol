pragma solidity ^0.8.10;
contract student {
 string private nnombre;
 string private apellido_;
 string private _curso_;
 address private _docente;
//para almacenar la address del owner
  bool private _aprobo;
//bool cuya funcion explico mas adelante

 mapping (string => uint) notas_materias;
//elegimos uint debido a su capacidad de almacenar numeros enteros no negativos
uint [] arr_n;
//cree un array para poder hacer el promedio con los values del mapping, que, de otra forma serian inaccesibles porque el mapping no tiene posision 
 


constructor(string memory name_ , string memory _apellido, string memory _curso )
{   
    nnombre = name_;
    apellido_ = _apellido;
    _curso_ = _curso;
    _docente = msg.sender;   //justo aca declaro que el smg.sender es el address del docente para que luego tenga acceso a la funcion set_nota_materia

}

function apellido() public returns (string memory)
{
    return apellido_;

}
function nombre_completo() public returns (string memory,string memory)
{
    return (nnombre, apellido_);
     
   
}

function curso() public returns (string memory)
{
    return _curso_;
}
function set_nota_materia( uint nota, string memory materia) public
{
    //hago dos require para que el numero de la nota sea valida y para que solo el owner pueda llamar a la funcion
    require (msg.sender == _docente, "not owner");
    require ( nota >=1 && nota <=100, "invalid mark");
    notas_materias [materia] = nota;
    arr_n.push(nota);
   
}

function nota_materia (string memory _materia) public returns (uint)
{
    return notas_materias[_materia];
}

function aprobo (string memory materia_) public returns (bool)
{
    //primero creo un bool falso, para que despues, si la nota es mayor a 60 se cambie a true y devolver ese valor 
    bool aprobo_ = false;
    uint mark_;
    notas_materias[materia_] = mark_;
    if (mark_ >= 60)
    {
        aprobo_ = true;
    }
    return aprobo_;

}


function promedio() public returns(uint)
{
    uint promedio_;
    for (int i=0; i < arr_m.lenght ; i++)
    {
        promedio_ += notas_materias[arr_n[i]];
    }
     promedio_ = promedio_ / arr_n.lenght;
    return promedio_;
    //no hace falta hacer un redondeo manual porque ya esta automatizado el redondeo al cero, es decir la division de dos enteros dara otro entero
}

}
