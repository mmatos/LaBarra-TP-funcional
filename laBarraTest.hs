import Test.HUnit
import LaBarra

--
-- correr todo usando:
correrTodo = runTestTT tests
--

-- datos de testeo
vodka= UnIngrediente "vodka" 10  55 0
speed = UnIngrediente "speed" 30 1 10
brancaMenta = UnIngrediente "brancaMenta" 10 10 50

vodkaMenta = UnTrago "Vodka Menta" [ UnComponente vodka 50, UnComponente brancaMenta 20 ] 

charlySheen = UnaPersona "charly" 98 50 [UnTrago "Vodka" [UnComponente hielo 30, UnComponente vodka 100] , UnTrago "Branca" [UnComponente brancaMenta 50] ]
chuckNorris = UnaPersona "chuck" 100 0 [ vodkaMenta ] 
funesMori = UnaPersona "el memorioso" 0 75 [UnTrago "Speed con vodka" [UnComponente vodka 10, UnComponente speed 80] ] 

-- esto es lo que se espera poder usar en los tests de mas abajo para verificar los resultados, completar de acuerdo a lo desarrollado
-- 1a
aporteDeEscabioBrancaMenta = aporteDeEscabio brancaMenta
aporteDeEscabioSpeed = aporteDeEscabio speed

-- 1b
escabioDe50VodkaCon50Speed = error "Falta implementar"

-- 1c
batir50VodkaCon50SpeedY2DeHieloDuranteDosSegundos = error "Falta implementar"

-- 2a
armarComponentesDe10VodkaCon80SpeedDirectoCon4Hielos = error "Falta implementar"
-- 2b
armarComponentesDe10VodkaCon80SpeedConLicuadora = error "Falta implementar"
-- 2c
armarComponentesDe10VodkaCon80SpeedConCocteleraBatiendo10SegundosSinFlambear = error "Falta implementar"
armarComponentesDe10VodkaCon80SpeedConCocteleraBatiendo7SegundosFlambeando = error "Falta implementar"

-- 3
hacerVodkaMentaDirectoCon2Hielos = error "Falta implementar"
hacerVodkaMentaConLicuadora = error "Falta implementar"
hacerVodkaMentaConCocteleraPor5SegundosYMedioSinFlambear = error "Falta implementar"

-- 4a
humedecerLaGargantaDeCharlySheenConUnVodkaMenta = error "Falta implementar"
-- 4b
funesMoriDegustaVodkaMentaConLicuadoraYDirectoSinHielo = error "Falta implementar"

-- TESTS (no modificar)

tests = TestList [
  TestLabel "1a - Aporte de escabio" testsAporteDeEscabio,
  TestLabel "1b - Escabio" testEscabio,
  TestLabel "1c - Batir" testBatir,
  TestLabel "2a - Directo" testDirecto,
  TestLabel "2b - Licuadora" testLicuadora,
  TestLabel "2c - Coctelera" testCoctelera,
  TestLabel "3 - Hacer trago" testHacerTrago,
  TestLabel "4a - Humedecer la garganta" testHumedecerLaGarganta,
  TestLabel "4b - Degustar" testDegustar,
  TestLabel "4c - Mas Borrachin" (masBorrachin ~?= "el memorioso")
  ]

testsAporteDeEscabio = TestList [
  TestLabel "El aporte de escabio de brancaMenta deberia ser 0" (aporteDeEscabioBrancaMenta ~?= 0),
  TestLabel "El aporte de escabio de speed deberia ser -9" (aporteDeEscabioSpeed ~?= -9)
  ]
  
testEscabio = TestLabel "El escabio de 50cc de vodka y 50cc de speed deberia ser 23" (escabioDe50VodkaCon50Speed ~?= 23)

testBatir = TestLabel "Al batir 50cc de vodka, 50cc de speed y 2cc de hielo durante dos segundos, se obtiene una lista con los 3 componentes alterados por la mezcla"
  (batir50VodkaCon50SpeedY2DeHieloDuranteDosSegundos ~?=
    [UnComponente (UnIngrediente "vodka" 10.1 53.91 0.1) 50,
    UnComponente (UnIngrediente "speed" 29.5 1.53 9.8) 50,
    UnComponente (UnIngrediente "hielo" 0.4 0.56 0.1) 2])

testDirecto = TestLabel "Armado directo de 10cc de vodka y 80cc de speed agregando 4 hielos"
        (armarComponentesDe10VodkaCon80SpeedDirectoCon4Hielos ~?= 
          [UnComponente hielo 40,
          UnComponente vodka 10,
          UnComponente speed 80])
        
testLicuadora = TestLabel "Armado con licuadora de 10cc de vodka y 80cc de speed"
        (armarComponentesDe10VodkaCon80SpeedConLicuadora ~?= 
          [UnComponente (UnIngrediente "hielo" 36 33.6 6) 50,
          UnComponente (UnIngrediente "vodka" 20 (-10.400002) 6) 10,
          UnComponente (UnIngrediente "speed" 4 32.8 (-2)) 80])
        
testCoctelera = TestList [
  TestLabel "Armado con coctelera de 10cc de vodka y 80cc de speed batiendo 10 segundos y sin flambear al servir"
    (armarComponentesDe10VodkaCon80SpeedConCocteleraBatiendo10SegundosSinFlambear ~?=
      [UnComponente hielo 20,
      UnComponente (UnIngrediente "vodka" 12 49.6 1) 10 ,
      UnComponente (UnIngrediente "speed" 28 6.4 9) 80]),
  TestLabel "Armado con coctelera de 10cc de vodka y 80cc de speed batiendo 7 segundos y flambear al servir"
    (armarComponentesDe10VodkaCon80SpeedConCocteleraBatiendo7SegundosFlambeando ~?=
      [UnComponente (UnIngrediente "vodka" 13.4 25.61 5.7) 10,
      UnComponente (UnIngrediente "speed" 28.6 4.7799997 9.3) 80])
  ]

testHacerTrago = TestList [
  TestLabel "Hacer Vodka Menta directo con 2 hielos"
    (hacerVodkaMentaDirectoCon2Hielos ~?=
    UnTrago "Vodka Menta" [
      UnComponente hielo 20,
      UnComponente vodka 50,
      UnComponente brancaMenta 20]),
  TestLabel "Hacer Vodka Menta usando licuadora"
    (hacerVodkaMentaConLicuadora ~?= 
    UnTrago "Vodka Menta"
      [UnComponente (UnIngrediente "hielo" 24 39 30) 50,
      UnComponente (UnIngrediente "vodka" 8 (-5) 30) 50,
      UnComponente (UnIngrediente "brancaMenta" 8 31 (-10)) 20]),
  TestLabel "Hacer Vodka Menta usando coctelera, batir 5.5 segundos y no flambear al servir"
    (hacerVodkaMentaConCocteleraPor5SegundosYMedioSinFlambear ~?=
    UnTrago "Vodka Menta"
      [UnComponente hielo 20,
      UnComponente (UnIngrediente "vodka" 10 52.525 2.75) 50,
      UnComponente (UnIngrediente "brancaMenta" 10 12.475 47.25) 20])
  ]
  
testHumedecerLaGarganta = TestLabel "Charly Sheen toma un Vodka Menta"
  (humedecerLaGargantaDeCharlySheenConUnVodkaMenta ~?= 
    UnaPersona "charly" 100 (-8.714287) 
      [UnTrago "Vodka Menta" [UnComponente vodka 50, UnComponente brancaMenta 20],
      UnTrago "Vodka" [UnComponente hielo 30, UnComponente vodka 100] ,
      UnTrago "Branca" [UnComponente brancaMenta 50]])
  
testDegustar = TestLabel "Funes Mori degusta Vodka Menta armado con una licuadora y directo sin hielo" 
  (funesMoriDegustaVodkaMentaConLicuadoraYDirectoSinHielo ~?= 
    UnaPersona "el memorioso" 4 119.95238 
      [UnTrago "Vodka Menta" [UnComponente hielo 0, UnComponente vodka 50, UnComponente brancaMenta 20],
      UnTrago "Vodka Menta" 
        [UnComponente (UnIngrediente "hielo" 24 39 30) 50,
        UnComponente (UnIngrediente "vodka" 8 (-5) 30) 50,
        UnComponente (UnIngrediente "brancaMenta" 8 31 (-10)) 20],
      UnTrago "Speed con vodka" [UnComponente vodka 10, UnComponente speed 80]])
