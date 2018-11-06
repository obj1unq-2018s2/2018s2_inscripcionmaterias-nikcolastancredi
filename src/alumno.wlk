import materia.*
import carrera.*


class Alumno{
	
	var property foja   // Materias en forma de objetos que tiene la materia y la nota
	const carreras
	
	method regMateriasAprobadas() = foja.filter{ reg => reg.nota() >=  7}
	
	// Punto 1 	
	method puedeCursar(materia) = 
		carreras.any{carrera => carrera.tieneEsta(materia)} && 
		not self.estaAnotado(materia)&&
		not self.tieneAprobado(materia)&&
		materia.cumpleRequisitos(self)
				
	method estaAnotado(materia) = materia.listaDeInscriptos().contains(self)

	method tieneAprobado(materia) = self.regMateriasAprobadas().any{reg=> reg.materia() == materia}
	
	
	
	//Punto 2
	
	method registarMateria(newMateria,newNota){
		var materiaAgregar = new RegistroDeMateria(materia=newMateria,nota=newNota)
		
		if( not foja.any{reg => reg.materia() == newMateria }) {
			foja.add(materiaAgregar)
		}else{
			self.error("Ya estas incripto  a esta Materia")
		}
	}


	//Punto 3 
	
	method incribirAlumnoA(materia){
		if(self.puedeCursar(materia)){
			materia.inscribirA(self)
		}
	}

	// Punto 5
	method todasLasMateriasQueSePuedaInscribir(){
				
	}	
}