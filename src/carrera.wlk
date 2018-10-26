import alumno.*
import materia.*


class Carrera{
	const materias
	
	//devuelve una lista del anio x de todas las materias de las materias
	method materiasDelAnio(x){
		return materias.map{materia => materia.anio() == x}
	}
	
	
}