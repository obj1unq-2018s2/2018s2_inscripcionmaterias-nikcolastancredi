import alumno.*

class RegistroDeMateria{
	const property materia
	const property nota
}

class Materia{
	
	const property carrera	
	const creditos
	const property anio
	var property listaDeInscriptos
	var property listaDeEspera
	
	const property maxAlumnos
}

class MateriaConCorrelativas inherits Materia{
	const materiasCorrelativas
	
	method cumpleRequisitos(alumno) =   alumno.tieneAprobado(materiasCorrelativas)
	
}

class MateriaConCreditos inherits Materia{	
	method cumpleRequisitos(alumno){
		return alumno.creditos() > 250
	}
}

class MateriaPorAnio inherits Materia{
	method cumpleRequisitos(alumno){
		var _anio = self.anio() - 1
		var _materias = self.carrera().materiasDelAnio(_anio)
		return alumno.tieneAprobadoEstas(_materias)
		// segun el anio de la materia en la que me pasan por parametro le resto 1 y 
		//le pregunto a la carrera de la materia todas las materias del ese anio
		// todas esas materias  le pregunto al alumno si las tiene aprobadas
		
	}
}

class MateriasSinRequisitos inherits Materia{
	method cumpleRequesitos(alumno){
		return true
	}	
}