module Persistencia where
    
import Database.Persist.TH    
import Data.Aeson
import GHC.Generics (Generic)
    
data Cargo = Gerente | Cozinheiro | Camareiro | Recepcionista | Mensageiro deriving (Generic, Read, Show)

instance ToJSON Cargo

instance FromJSON Cargo

derivePersistField "Cargo"

data Depto = Quartos | Cozinha | Lavanderia | Recepcao deriving (Generic, Read, Show)

instance ToJSON Depto

instance FromJSON Depto

derivePersistField "Depto"