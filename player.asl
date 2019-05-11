// Agent player in project connect4.mas2j

/* Initial beliefs and rules */


/*ALPHA: Es una diagonal en la que las dos componentes son la suma de las 
  anteriores. Es decir la diagonal va de izquierda arriba a abajo derecha. */


/*BETA: Es una diagonal en la que la componenet X es la resta de la anterior
  y la componente Y la suma de la anterior. Es decir la diagonal va de derecha
  arriba a abajo izquierda.


/* Calcula si un celda esta ocupada por el rival o fuera del tablero */
/* Falta implementar jugadorOponente(J) */
ocupadoFueraDeTablero(X,Y,J):-
	(X >= 0 & X <= 7) &
	(Y >= 0 & Y <= 7) &
	tablero(X,Y,jugadorOponente(J)).


/* Comprueba si se puede colocar en una posición por encima de la fila siete */
puedeColocar(X,Y1):- //Tested 
    (X >= 0 & X < 8) &
    Y = Y1 + 1 &
     tablero(X,Y1,0) &
    (tablero(X,Y,1) | tablero(X,Y,2))&
    (Y >= 0 & Y < 8).

puedeColocar(X,7):- //Tested
    tablero(X,7,0).
	
/* Posiciones en las que ganas siempre: +20 */

/* Puntuaci�n : */	
ganarSiempreHorizontal([pos(X0,Y),pos(X0+4,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,J) &
	tablero(X0+4,Y,0) &
	puedeColocar(X0,Y) &
	puedeColocar(X0+4,Y).

/* Puntuaci�n : */		
ganarSiempreDiagonalAlpha([pos(X0,Y0),pos(X0+4,Y0+4)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,J) &
	tablero(X0+4,Y0+4,0) &
	puedeColocar(X0,Y0) &
	puedeColocar(X0+4,Y0+4).

/* Puntuaci�n : */		
ganarSiempreDiagonalBeta([pos(X0,Y0),pos(X0-4,Y0+4)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,J) &
	tablero(X0-4,Y0+4,0) &
	puedeColocar(X0,Y0) &
	puedeColocar(X0-4,Y0+4).

/* Posiciones en las que tienes un tres en raya con solo una libre: +20*/

/* Puntuaci�n : */	
tresEnRayaVertical([pos(X,Y0)],J):- //Funciona
	tablero(X,Y0,0) &
	tablero(X,Y0+1,J) &
	tablero(X,Y0+2,J) &
	tablero(X,Y0+3,J).

/* Puntuaci�n : */		
tresEnRayaHorizontalIzquierda([pos(X0,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0,Y).

/* Puntuaci�n : */		
tresEnRayaHorizontalDerecha([pos(X0+3,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,0) &
	puedeColocar(X0+3,Y).

/* Puntuaci�n : */	
tresEnRayaDiagonalAlphaDerechaAbajo([pos(X0,Y0)],J):- // Cambiar por derecha Arriba //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0,Y0).

/* Puntuaci�n : */		
tresEnRayaDiagonalAlphaIzquierdaArriba([pos(X0+3,Y0+3)],J):- //Cambiar por Izquierda Abajo //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,0) &
	puedeColocar(X0+3,Y0+3).

/* Puntuaci�n : */		
tresEnRayaDiagonalBetaDerechaArriba([pos(X0,Y0)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0,Y0).

/* Puntuaci�n : */		
tresEnRayaDiagonalBetaIzquierdaAbajo([pos(X0-3,Y0-3)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,0) &
	puedeColocar(X0-3,Y0+3).

/* Posiciones en las que hay tres en cuatro y una para ganar:  */

/* Puntuaci�n : */	
tresEnCuatroHorizontalCentroDerecha([pos(X0+2,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,0) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0+2,Y).

/* Puntuaci�n : */		
tresEnCuatroHorizontalCentroIzquierda([pos(X0+1,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,0) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0+1,Y).

/* Puntuaci�n : */		
tresEnCuatroDiagonalAlphaCentroDerecha([pos(X0+2,Y0+2)],J):-  //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,0) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0+2,Y0+2).

/* Puntuaci�n : */		
tresEnCuatroDiagonalAlphaCentroIzquierda([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,0) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0+1,Y0+1).

/* Puntuaci�n : */		
tresEnCuatroDiagonalBetaCentroDerecha([pos(X0-2,Y0+2)],J):- //cambiar por Izquierda //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,0) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0-2,Y0+2).

/* Puntuaci�n : */		
tresEnCuatroDiagonalBetaCentroIzquierda([pos(X0-1,Y0+1)],J):- //cambiar por Derecha //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,0) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0-1,Y0+1).


/* Parejas horizontal que generan un trio que gana siempre: */

/* Puntuaci�n : */	
parejaGanadoraHorizontalDerecha([pos(X0+3,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,0) &
	tablero(X0+4,Y,0) &
	puedeColocar(X0+3,Y).

/* Puntuaci�n : */		
parejaGanadoraHorizontalIzquierda([pos(X0+1,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,0) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,J) &
	tablero(X0+4,Y,0) &
	puedeColocar(X0+1,Y).
	
/* Puntuaci�n : */	
parejaGanadoraHorizontalCentral([pos(X0+2,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,0) &
	tablero(X0+3,Y,J) &
	tablero(X0+4,Y,0) &
	puedeColocar(X0+2,Y).

/* Puntuaci�n : */		
parejaGanadoraDiagonalAlphaDerecha([pos(X0+3,Y0+3)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,0) &
	tablero(X0+4,Y0+4,0) &
	puedeColocar(X0+3,Y0+3).

/* Puntuaci�n : */		
parejaGanadoraDiagonalAlphaIzquierda([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,0) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,J) &
	tablero(X0+4,Y0+4,0) &
	puedeColocar(X0+1,Y0+1).

/* Puntuaci�n : */		
parejaGanadoraDiagonalAlphaCentral([pos(X0+2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,0) &
	tablero(X0+3,Y0+3,J) &
	tablero(X0+4,Y0+4,0) &
	puedeColocar(X0+2,Y0+2).

/* Puntuaci�n : */		
parejaGanadoraDiagonalBetaIzquierda([pos(X0-3,Y0+3)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,0) &
	tablero(X0-4,Y0+4,0) &
	puedeColocar(X0-3,Y0+3).

/* Puntuaci�n : */		
parejaGanadoraDiagonalBetaDerecha([pos(X0-1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,0) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,J) &
	tablero(X0-4,Y0+4,0) &
	puedeColocar(X0-1,Y0+1).

/* Puntuaci�n : */		
parejaGanadoraDiagonalBetaCentral([pos(X0-2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,0) &
	tablero(X0-3,Y0+3,J) &
	tablero(X0-4,Y0+4,0) &
	puedeColocar(X0-2,Y0+2).


/* Parejas que generan un trio: */

/* Horizontales */

/* Puntuaci�n : */	
parejaHorizontalIzquierda([pos(X0+2,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,0) &
	tablero(X0+3,Y,0) &
	puedeColocar(X0+2,Y).

/* Puntuaci�n : */	
parejaHorizontalDerecha([pos(X0+1,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,0) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0+1,Y).

/* Puntuaci�n : */		
parejaHorizontalCentral([pos(X0,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,0) &
	puedeColocar(X0,Y).

/* Puntuaci�n : */	
parejaHorizontalSeparadaIzquierda([pos(X0+1,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,0) &
	tablero(X0+2,Y,J) &
	tablero(X0+3,Y,0) &
	puedeColocar(X0+1,Y).
	
/* Puntuaci�n : */	
parejaHorizontalSeparadaDerecha([pos(X0+2,Y)],J):- //Funciona
	tablero(X0,Y,0) &
	tablero(X0+1,Y,J) &
	tablero(X0+2,Y,0) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0+2,Y).
	
/* Puntuaci�n : */	
parejaHorizontalSeparadaCentro([pos(X0+1,Y)],J):- //Funciona
	tablero(X0,Y,J) &
	tablero(X0+1,Y,0) &
	tablero(X0+2,Y,0) &
	tablero(X0+3,Y,J) &
	puedeColocar(X0+1,Y).

/* Verticales */

/* Puntuaci�n : */	
parejaVertical([pos(X0,Y)],J):- //Funciona
	tablero(X0,Y,0) & 
	tablero(X0,Y+1,J) &
	tablero(X0,Y+2,J).

/* Diagonales Alpha */ 

/* Puntuaci�n : */	
parejaDiagonalAlphaIzquierda([pos(X0+2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,0) &
	tablero(X0+3,Y0+3,0) &
	puedeColocar(X0+2,Y0+2).

/* Puntuaci�n : */	
parejaDiagonalAlphaDerecha([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,0) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0+1,Y0+1).

/* Puntuaci�n : */	
parejaDiagonalAlphaCentral([pos(X0,Y0)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,0) &
	puedeColocar(X0,Y0).
	
/* Puntuaci�n : */	
parejaDiagonalAlphaSeparadaIzq([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,0) &
	tablero(X0+2,Y0+2,J) &
	tablero(X0+3,Y0+3,0) &
	puedeColocar(X0+1,Y0+1).

/* Puntuaci�n : */	
parejaDiagonalAlphaSeparadaDer([pos(X0+2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0+1,J) &
	tablero(X0+2,Y0+2,0) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0+2,Y0+2).
	
/* Puntuaci�n : */	
parejaDiagonalAlphaSeparadaCentro([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0+1,0) &
	tablero(X0+2,Y0+2,0) &
	tablero(X0+3,Y0+3,J) &
	puedeColocar(X0+1,Y0+1).

/* Diagonales Beta */

/* Puntuaci�n : */	
parejaDiagonalBetaDerecha([pos(X0-2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,0) &
	tablero(X0-3,Y0+3,0) &
	puedeColocar(X0-2,Y0+2).
	
/* Puntuaci�n : */	
parejaDiagonalBetaIzquierda([pos(X0+1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,0) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0-1,Y0+1).
	
/* Puntuaci�n : */	
parejaDiagonalBetaCentral([pos(X0-3,Y0+3)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,0) &
	puedeColocar(X0-3,Y0+3).
	
/* Puntuaci�n : */	
parejaDiagonalBetaSeparadaIzq([pos(X0-1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,0) &
	tablero(X0-2,Y0+2,J) &
	tablero(X0-3,Y0+3,0) &
	puedeColocar(X0-1,Y0+1).
	
/* Puntuaci�n : */	
parejaDiagonalBetaSeparadaDer([pos(X0-2,Y0+2)],J):- //Funciona
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0+1,J) &
	tablero(X0-2,Y0+2,0) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0-2,Y0+2).
	
/* Puntuaci�n : */	
parejaDiagonalBetaSeparadaCentro([pos(X0-1,Y0+1)],J):- //Funciona
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0+1,0) &
	tablero(X0-2,Y0+2,0) &
	tablero(X0-3,Y0+3,J) &
	puedeColocar(X0-1,Y0+1).
	
/* Segundo Movimiento */

/* Puntuaci�n : */
solitaGeneraTres([pos(X0,Y0)],J):-
    solitaGeneraHorizontal([pos(X0,Y0)],J) &
    solitaGeneraVertical([pos(X1,Y1)],J) &
   	((X1=X0-1) & (Y1=Y0-1)) &
    solitaGeneraDiagonalAlpha([pos(X2,Y2)],J) &
   	((X2=X0-2) & (Y2=Y0-1)).

solitaGeneraTres([pos(X0,Y0)],J):-
      solitaGeneraHorizontal([pos(X0,Y0)],J) &
    solitaGeneraVertical([pos(X1,Y1)],J) &
   	((X1=X0+1) & (Y1=Y0-1)) &
    solitaGeneraDiagonalBeta([pos(X2,Y2)],J) &
   	((X2=X0+2) & (Y2=Y0-1)).
	
/* Puntuaci�n : */	

solitaGeneraUna([pos(X0,Y0)],J):-
	(solitaGeneraHorizontal([pos(X0,Y0)],J) |
	solitaGeneraVertical([pos(X0,Y0)],J) |
	solitaGeneraDiagonalAlpha([pos(X0,Y0)],J) |
	solitaGeneraDiagonalBeta([pos(X0,Y0)],J)).

solitaGeneraHorizontal([pos(X0+1,Y0)],J):-
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0,0) & 
	tablero(X0+2,Y0,0) &
	tablero(X0+3,Y0,0) &
	puedeColocar(X0+1,Y0).

solitaGeneraVertical([pos(X0,Y0-1)],J):-
	tablero(X0,Y0,J) &
	tablero(X0,Y0-1,0) & 
	tablero(X0,Y0-2,0) &
	tablero(X0,Y0-3,0) &
	puedeColocar(X0,Y0-1).
	
solitaGeneraDiagonalAlpha([pos(X0-1,Y0-1)],J):-
	tablero(X0,Y0,J) &
	tablero(X0-1,Y0-1,0) & 
	tablero(X0-2,Y0-2,0) &
	tablero(X0-3,Y0-3,0) &
	puedeColocar(X0-1,Y0-1).
	
solitaGeneraDiagonalBeta([pos(X0+1,Y0-1)],J):-
	tablero(X0,Y0,J) &
	tablero(X0+1,Y0-1,0) & 
	tablero(X0+2,Y0-2,0) &
	tablero(X0+3,Y0-3,0) &
	puedeColocar(X0+1,Y0-1).	

/* Primer movimiento */

/* Puntuaci�n : */	

primeraGeneraTodas([pos(X0,Y0)]):-
	primeraGeneraHorizontal([pos(X0,Y0)])&
	primeraGeneraVertical([pos(X0,Y0)])&
	primeraGeneraDiagonalAlpha([pos(X0,Y0)])&
	primeraGeneraDiagonalBeta([pos(X0,Y0)]).
	
/* Puntuaci�n : */	

primeraGeneraTres([pos(X0,Y0)]):-
	primeraGeneraHorizontal([pos(X0,Y0)])&
	primeraGeneraVertical([pos(X0,Y0)])&
	(primeraGeneraDiagonalAlpha([pos(X0,Y0)]) | primeraGeneraDiagonalBeta([pos(X0,Y0)])).

/* Puntuaci�n : */	

primeraGeneraUna([pos(X0,Y0)]):-
	(primeraGeneraHorizontal([pos(X0,Y0)]) |
	primeraGeneraVertical([pos(X0,Y0)]) |
	primeraGeneraDiagonalAlpha([pos(X0,Y0)]) |
	primeraGeneraDiagonalBeta([pos(X0,Y0)])).
	
primeraGeneraHorizontal([pos(X0,Y0)]):-
	puedeColocar(X0,Y0)&
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0,0) & 
	tablero(X0+2,Y0,0) &
	tablero(X0+3,Y0,0).

primeraGeneraVertical([pos(X0,Y0)]):-
	tablero(X0,Y0,0) &
	tablero(X0,Y0-1,0) & 
	tablero(X0,Y0-2,0) &
	tablero(X0,Y0-3,0) &
	puedeColocar(X0,Y0).
	
primeraGeneraDiagonalAlpha([pos(X0,Y0)]):-
	tablero(X0,Y0,0) &
	tablero(X0-1,Y0-1,0) & 
	tablero(X0-2,Y0-2,0) &
	tablero(X0-3,Y0-3,0) &
	puedeColocar(X0,Y0).
	
primeraGeneraDiagonalBeta([pos(X0,Y0)]):-
	tablero(X0,Y0,0) &
	tablero(X0+1,Y0-1,0) & 
	tablero(X0+2,Y0-2,0) &
	tablero(X0+3,Y0-3,0) &
	puedeColocar(X0,Y0).	

/* Calcula una lista de movimientos con su puntuacion */
calcularMovimientos(8,J,[]).

calcularMovimientos(Columna,J,[MovPunt|LMovPunt]):-
	Columna < 8 &
	calcularFichaSuperior(Columna,X,Y) &
	calcularPuntuacion(X,Y,J,MovPunt) &
	calcularMovimientos(Columna+1,J,LMovPunt).

calcularMovimientos(Columna,J,LFinal):-
	Columna < 8 &
	not(calcularFichaSuperior(Columna,X,Y)) &
	calcularMovimientos(Columna+1,J,LFinal).


/* Movimiento-puntuacion = mov(X,Y,Puntuacion) */
calcularPuntuacion(X,Y,J,mov(X,Y,Puntuacion)):-
	.asserta(tmpTablero(X,Y,J)) &
	puntos(Puntuacion) &
	.abolish(tmpTablero(X,Y,J)).


/* Devuelve los puntos de estado del tablero */
//puntos(X,Y,J):-


/* Initial goals */
/* Plans */

//NOT TESTED
+!minMax(XActual,Profundidad,LMovimientos):
	Profundidad > 0 &
	esPar(Profundidad) &
	XActual < 7 <-
		!minMax(XActual,Profundidad-1,LMovimientos);
		!minMax(XActual + 1, Profundidad,LMovimientos2).

+!minMax(XActual,Profundidad,LMovimientos):
	Profundidad > 0 &
	not(esPar(Profundidad)) &
	XActual < 7 <-
		!minMax(XActual,Profundidad-1,LMovimientos);
		!minMax(XActual + 1, Profundidad,LMovimientos2).


+!minMax(XActual,Profundidad,LMovimientos):
	Profundidad = 0 <-
		?calcularMovimientos(LMovimientos).

