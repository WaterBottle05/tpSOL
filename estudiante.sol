pragma soliditi ^0.8.10;
contract 
private string nombre;
private string apellido;
private string curso;
private string docente;

private mapping(string => uint);
//elegimos uint debido a su capacidad de almacenar enteros positivos

constructor (string memory name_ , string memory apellido_ , string memory curso_ )
{   
    nombre = name_;
    apellido = apellido_;
    curso = curso_;
    
}