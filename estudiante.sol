pragma soliditi ^0.8.10;
contract student {
private string nombre;
private string apellido_;
private string _curso;
private string docente;
private address _docente;
private bool _aprobo:
private mapping (string => uint) notas_materias;
//elegimos uint debido a su capacidad de almacenar enteros positivos

constructor (string memory name_ , string memory _apellido, string memory _curso )
{   
    nombre = name_;
    apellido_ = _apellido;
    curso_ = _curso;
    _docente = msg.sender;
   
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
    require (msg.sender == _docente, "not owner");
    require (uint nota >=1 && <==100, "invalid mark");
    notas_materias [materia] = nota;
   
}

function nota_materia (string memory _materia) returns (uint)
{
    return notas_materias[_materia];
}

function aprobo (string memory materia_) returns (bool)
{
    aprobo_ = false;
    notas_materias[materia_] = mark_;
    if (mark_ >= 60)
    {
        aprobo_ = true;
    }
    return(aprobo_)

}


}
