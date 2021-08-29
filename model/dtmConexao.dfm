object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object conexao: TFDConnection
    Params.Strings = (
      'Database=teste'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'Port=5434'
      'DriverID=PG')
    Left = 32
    Top = 56
  end
  object drive: TFDPhysPgDriverLink
    Left = 112
    Top = 48
  end
end
