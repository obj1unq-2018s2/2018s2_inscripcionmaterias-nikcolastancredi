import alumno.*
import materia.*


class Carrera{
	const property materias //[]
	
	method tieneEsta(materia) = materias.contains(materia)
	
	//devuelve una lista del anio x de todas las materias de las materias
	method materiasDelAnio(x){
		return materias.map{materia => materia.anio() == x}
	}
	
	
}