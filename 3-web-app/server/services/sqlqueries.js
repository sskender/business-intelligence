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

const generateQuery = (payload) => {
  const selects = new Set()
  const tables = new Set()
  const tableJoins = new Set()

  for (const item of payload) {
    const attrib = item.imeSQLAtrib.trim()
    const attribName = item.imeAtrib.trim()
    const dTable = item.nazSqlDimTablica.trim()
    const factTable = item.nazSqlCinjTablica.trim()

    selects.add(`${dTable}.${attrib} AS ${attribName}`)
    tables.add(dTable)
    tables.add(factTable)
    tableJoins.add(`${factTable}.${item.cinjTabKljuc.trim()} = ${dTable}.${item.dimTabKljuc.trim()}`)
  }

  const strSelects = Array.from(selects).join('\n, ')
  const strTables = Array.from(tables).sort().join(', ')
  const strJoins = Array.from(tableJoins).sort().join('\n AND ')

  const tsql = `
    SELECT
        ${strSelects}
      FROM
        ${strTables}
    WHERE
      ${strJoins}
  `
  return tsql
}

module.exports = {
  selectFactTables,
  selectMeasures,
  selectDimensions,
  generateQuery
}
