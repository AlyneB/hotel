{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
module Import where

import Yesod

pRoutes = [parseRoutes|
    /depto                            DeptoR            GET POST 

    /func/#FuncionarioId              FuncIdR           GET PUT PATCH DELETE
    /func                             FuncR             GET POST

    /quarto/#QuartoId                 QuartoIdR         PATCH DELETE
    /quarto                           QuartoR           GET POST 
    
    /escala/#FuncionarioId            EscalaIdR         GET POST
    /escala                           EscalaR           GET POST
    
    /ponto/#PontoId                   PontoIdR          PATCH
|]