object dmDados: TdmDados
  OldCreateOrder = False
  Height = 150
  Width = 215
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 40
    Top = 56
  end
  object cdsDados: TClientDataSet
    PersistDataPacket.Data = {
      C10000009619E0BD010000001800000007000000000003000000C10002696404
      00010000000000046E6F6D650100490000000100055749445448020002001E00
      086370665F636E706A0100490000000100055749445448020002000E0008656E
      64657265636F0100490000000100055749445448020002001E00066369646164
      650100490000000100055749445448020002001E000464617461040006000000
      00000C7469706F5F636F6E7461746F0100490000000100055749445448020002
      0002000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'cpf_cnpj'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'endereco'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'tipo_contato'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 56
  end
end
