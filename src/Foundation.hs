{-# LANGUAGE OverloadedStrings, TypeFamilies, QuasiQuotes,
             TemplateHaskell, GADTs, FlexibleContexts,
             MultiParamTypeClasses, DeriveDataTypeable,
             GeneralizedNewtypeDeriving, ViewPatterns #-}
module Foundation where
import Import
import Yesod
import GHC.Generics (Generic)
import Data.Text
import Database.Persist.Postgresql
    (ConnectionPool, SqlBackend, runSqlPool, runMigration)

data Sitio = Sitio {connPool :: ConnectionPool}

data Cargo = Gerente | Cozinheiro | Camareiro | Recepcionista | Mensageiro deriving (Generic, Read, Show)
instance ToJSON Cargo
instance FromJSON Cargo
derivePersistField "Cargo"

data Depto = Quartos | Cozinha | Lavanderia | Recepcao deriving (Generic, Read, Show)
instance ToJSON Depto
instance FromJSON Depto
derivePersistField "Depto"

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Departamento json
   nome           Depto
   gerente        FuncionarioId Maybe
   UniqueGerente gerente nome

Funcionario json
   nome           Text
   cargo          Cargo
   nascimento     Day
   salario        Double
   deptoid        DepartamentoId
   
Quarto json
    numero        Int
    andar         Int
    status        Bool

Escala json
    funcionarioId FuncionarioId
    pontos        [PontoId]

Ponto json
    horario       UTCTime
    especial      Bool Maybe
                        -- Nothing    - Faltou
                        -- Just True  - Feriado, domingo, sabado
                        -- Just False - Dia comum
|]

mkYesodData "Sitio" pRoutes

instance YesodPersist Sitio where
   type YesodPersistBackend Sitio = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool

instance Yesod Sitio where