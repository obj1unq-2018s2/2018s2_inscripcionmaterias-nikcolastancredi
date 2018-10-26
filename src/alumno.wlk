import materia.*


class Alumno{
	
	var materiasDadas   // Materias en forma de objetos que tiene la materia y la nota
	var materiasAnotadas 
	var carreras
	var property creditos = 0
	
	
	method foja(){
		return materiasDadas
	}
	
	method materiasAprobadas(){
		return materiasDadas.filter{ e => e.nota() > 7}	}
	
	
	method puedeCursar(materia){
		return  carreras.contains{materia.carrera()} && 
				self.noEstaAnotadoA(materia) && self.noTieneAprobadoEsta(materia)&&
				materia.cumpleRequisitos(self)
				
	}
	
	method noEstaAnotadoA(materia){
		return not materiasAnotadas.contains(materia)
	}
	
	method noTieneAprobadoEsta(materia){
		return not self.materiasAprobadas().contains(materia)
	}
	method tieneAprobadoEstas(materias){
		return true
	}
	
	//Punto 2
	
	method registarMateria(materia,nota){
		var materiaAgregar = new RegistroDeMateria(materia=materia,nota=nota)
		if(not self.yaSeRegistro(materia)){
			materiasDadas.add(materiaAgregar)
		}
	}
	
	method yaSeRegistro(materia){
		return true // devuelve true o false si  la materia ya esta en materias dada
		
	}

	//Punto 3 
	
	method incribirAlumnoA(materia){
		if(self.puedeCursar(materia) && materia.listaDeInscriptos().size() < materia.maxAlumnos() ){
			materiasAnotadas.add(materia)
			materia.listaDeInscriptos().add(self)
		}else{
			//devolver un error "No se puede anotar a esta materia"
		}
	}
	
	// Punto 4 
	method darDeBajaA(materia){
		materia.listaDeInscriptos().remove(self)
		materia.listaDeInscriptos().add(materia.listaDeEspera().first())
	}
	
	// Punto 5
	
}