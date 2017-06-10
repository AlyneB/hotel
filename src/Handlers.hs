{-# LANGUAGE OverloadedStrings, QuasiQuotes,
             TemplateHaskell #-}
 
module Handlers where
import Import
import Yesod
import Foundation
import Control.Monad.Logger (runStdoutLoggingT)
import Control.Applicative
import qualified Data.Text as T
import Network.HTTP.Types.Status

import Database.Persist.Postgresql

mkYesodDispatch "Sitio" pRoutes

getDeptoR :: Handler Value 
getDeptoR = do 
    deptos <- runDB $ selectList [] [Asc DepartamentoNome]
    sendStatusJSON ok200 (object ["response" .= deptos]) -- ok200 é uma funcao que retorna um status ok

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
getEscalaIdR funcId = do
    pontos <- runDB $ do
        Just (Entity _ escala) <- selectFirst [EscalaFuncionarioId ==. funcId] [Desc EscalaId]
        -- map  :: (a ->   b) -> [a] ->   [b]
        -- mapM :: (a -> m b) -> [a] -> m [b]
        mapM get404 $ escalaPontos escala
    sendStatusJSON ok200 (object ["response" .= pontos])

postEscalaIdR :: FuncionarioId -> Handler Value
postEscalaIdR = undefined

getEscalaR :: Handler Value
getEscalaR = {-do
    escalas' <- runDB $ do
        escalas <- selectList [] []
            -- você quer :: m [a]
            -- map dá    :: [m a]
        return $ mapM (\(Entity _ escala) ->
            (escalaFuncionarioId escala, mapM get404 (escalaPontos escala)))
                escalas-}
    undefined
    -- sendStatusJSON ok200 (object ["response" .= escalas'])

postEscalaR :: Handler Value
postEscalaR = undefined 

patchPontoIdR :: PontoId -> Handler Value
patchPontoIdR = undefined