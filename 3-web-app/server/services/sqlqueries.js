const selectFactTables = () => {
  return `
    SELECT *
      FROM tablica
    WHERE sifTipTablica = 1
  `
}

const selectMeasures = (factTableId) => {
  return `
    SELECT *
      FROM tabAtribut, agrFun, tablica, tabAtributAgrFun
    WHERE tabAtribut.sifTablica = ${factTableId}
      AND tabAtribut.sifTablica = tablica.sifTablica
      AND tabAtribut.sifTablica = tabAtributAgrFun.sifTablica
      AND tabAtribut.rbrAtrib = tabAtributAgrFun.rbrAtrib
      AND tabAtributAgrFun.sifAgrFun = agrFun.sifAgrFun
      AND tabAtribut.sifTablica = tablica.sifTablica
      AND sifTipAtrib = 1
    ORDER BY tabAtribut.rbrAtrib
  `
}

const selectDimensions = (factTableId) => {
  return `
    SELECT dimTablica.nazTablica
        , dimTablica.nazSQLTablica AS nazSqlDimTablica
        , cinjTablica.nazSQLTablica AS nazSqlCinjTablica
        , cinjTabAtribut.imeSqlAtrib AS cinjTabKljuc
        , dimTabAtribut.imeSqlAtrib AS dimTabKljuc
        , tabAtribut.*
      FROM tabAtribut, dimCinj
        , tablica dimTablica, tablica cinjTablica
        , tabAtribut cinjTabAtribut, tabAtribut dimTabAtribut
    WHERE dimCinj.sifDimTablica = dimTablica.sifTablica
      AND dimCinj.sifCinjTablica = cinjTablica.sifTablica
      AND dimCinj.sifCinjTablica = cinjTabAtribut.sifTablica
      AND dimCinj.rbrCinj = cinjTabAtribut.rbrAtrib
      AND dimCinj.sifDimTablica = dimTabAtribut.sifTablica
      AND dimCinj.rbrDim = dimTabAtribut.rbrAtrib
      AND tabAtribut.sifTablica = dimCinj.sifDimTablica
      AND sifCinjTablica = ${factTableId}
      AND tabAtribut.sifTipAtrib = 2
    ORDER BY dimTablica.nazTablica, rbrAtrib
  `
}

module.exports = {
  selectFactTables,
  selectMeasures,
  selectDimensions
}
