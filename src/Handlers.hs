{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Handlers where
import Import
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import Data.Text

import Database.Persist.Postgresql

mkYesodDispatch "Sitio" pRoutes

getDeptoR :: Handler Value 
getDeptoR = undefined

postDeptoR :: Handler Value 
postDeptoR = undefined

getFuncIdR :: FuncionarioId -> Handler Value
getFuncIdR = undefined

putFuncIdR :: FuncionarioId -> Handler Value
putFuncIdR = undefined

patchFuncIdR :: FuncionarioId -> Handler Value
patchFuncIdR = undefined

deleteFuncIdR :: FuncionarioId -> Handler Value
deleteFuncIdR = undefined

getFuncR :: Handler Value
getFuncR = undefined

postFuncR :: Handler Value
postFuncR = undefined

patchQuartoIdR :: QuartoId -> Handler Value
patchQuartoIdR = undefined

deleteQuartoIdR :: QuartoId -> Handler Value
deleteQuartoIdR = undefined

getQuartoR :: Handler Value
getQuartoR = undefined

postQuartoR :: Handler Value
postQuartoR = undefined

getEscalaIdR :: FuncionarioId -> Handler Value
getEscalaIdR = undefined

postEscalaIdR :: FuncionarioId -> Handler Value
postEscalaIdR = undefined

getEscalaR :: Handler Value
getEscalaR = undefined 

postEscalaR :: Handler Value
postEscalaR = undefined 

patchPontoIdR :: PontoId -> Handler Value
patchPontoIdR = undefined