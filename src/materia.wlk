import alumno.*
import carrera.*


class RegistroDeMateria{
	const property materia
	const property nota
}

class Materia{
	const creditos = 0 
	const property anio = 1 
	const property listaDeInscriptos = []
	const property listaDeEspera = []
	const property maxAlumnos = 10
	
	method inscribirA(alumno){
		if(listaDeInscriptos.size() < maxAlumnos){
			listaDeInscriptos.add(alumno)
		}else{
			listaDeEspera.add(alumno)
		}
	}
	
	method darDeBajaA(alumno){
		listaDeInscriptos.remove(alumno)
		if(listaDeEspera.size() > 0){
			listaDeInscriptos.add(listaDeEspera.first())
		}
	}
}

class ConCorrelativas inherits Materia{
	const materiasCorrelativas //[]
	
	method cumpleRequisitos(alumno) =  materiasCorrelativas.all{materia => alumno.tieneAprobado(materia)}  
	
}

class ConCreditos inherits Materia{	
	method cumpleRequisitos(alumno){
		return alumno.creditos() > 250
	}
}

class PorAnio inherits Materia{
	method cumpleRequisitos(alumno){
		return true
//		var _anio = self.anio() - 1
//		var _materias = self.carrera().materiasDelAnio(_anio)
//		return alumno.tieneAprobadoEstas(_materias)
//		// segun el anio de la materia en la que me pasan por parametro le resto 1 y 
//		//le pregunto a la carrera de la materia todas las materias del ese anio
//		// todas esas materias  le pregunto al alumno si las tiene aprobadas
		
	}
}

class SinRequisitos inherits Materia{
	method cumpleRequisitos(alumno) = true	
}