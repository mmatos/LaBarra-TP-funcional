module LaBarra where

data Ingrediente = UnIngrediente String Float Float Float deriving (Show,Eq)
data Componente = UnComponente Ingrediente Float deriving (Show,Eq)
data Trago = UnTrago String [Componente] deriving (Show,Eq)
data Persona = UnaPersona String Float Float [Trago] deriving (Show,Eq)

maximoSegun _ [x] = x
maximoSegun f (x:y:xs)
  | f x > f y = maximoSegun f (x:xs)
  | otherwise = maximoSegun f (y:xs)
  
nombreIngrediente (UnIngrediente nombre _ _ _) = nombre
azucar (UnIngrediente _ nivelDeAzucar _ _) = nivelDeAzucar
alcohol (UnIngrediente _ _ nivelDeAlcohol _) = nivelDeAlcohol
color (UnIngrediente _ _ _ nivelDeColor) = nivelDeColor

ingrediente (UnComponente ing _) = ing
cc (UnComponente _ cc) = cc

nombreTrago (UnTrago nombre _) = nombre
componentes (UnTrago _ componentes) = componentes

nombrePersona (UnaPersona nombre _ _ _) = nombre
resistencia (UnaPersona _ resistencia _ _) = resistencia
ebriedad (UnaPersona _ _ ebriedad _) = ebriedad
tragosTomados (UnaPersona _ _ _ tragos) = tragos

cambiarComponente (az', a', c')  (UnComponente (UnIngrediente n az a c) cc) = UnComponente (UnIngrediente n (az+az') (a+a') (c+c')) cc

-- No importa la magia que hace internamente, concentrense en el tipo para usarla correctamente
mezclar :: Float -> Componente -> [Componente] -> Componente
mezclar s comp comps = cambiarComponente (delta azucar , delta alcohol, delta color ) comp
  where
    delta f = ((sum (map (f.ingrediente) comps)) / fromIntegral(length comps) - f (ingrediente comp)) * s / 100

hielo = UnIngrediente "hielo" 0 0 0
    
-------------------------------------------------
--- Codigo de TP
-------------------------------------------------

-- Por cada punto deben definir la/las funciones que correspondan para resolver el requerimiento
-- y como deben usarse para que las pruebas hagan lo que se indica (salvo para el ultimo punto que directamente se testea lo pedido)

-- por ejemplo para el punto 1a:

-- 1a
-- esto es lo que se pide
aporteDeEscabio ingrediente = error "Falta implementar"



-- 4c
masBorrachin = error "Falta implementar"

