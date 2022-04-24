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

const parsePayload = (payload) => {
  const selects = new Set()
  const tables = new Set()
  const tableJoins = new Set()
  const groups = new Set()

  for (const item of payload) {
    if ('nazAgrFun' in item) {
      const agrFun = item.nazAgrFun.trim()
      const attrib = item.imeSQLAtrib.trim()
      const attribName = item.imeAtrib[1].trim()
      const factTable = item.nazSQLTablica.trim()

      selects.add(`${agrFun} (${factTable}.${attrib}) AS "${attribName}"`)
      tables.add(factTable)
    } else {
      const attrib = item.imeSQLAtrib.trim()
      const attribName = item.imeAtrib.trim()
      const dimTable = item.nazSqlDimTablica.trim()
      const dimTableId = item.dimTabKljuc.trim()
      const factTable = item.nazSqlCinjTablica.trim()
      const factTableId = item.cinjTabKljuc.trim()

      selects.add(`${dimTable}.${attrib} AS "${attribName}"`)
      tables.add(dimTable)
      tables.add(factTable)
      tableJoins.add(`${factTable}.${factTableId} = ${dimTable}.${dimTableId}`)
      groups.add(`${dimTable}.${attrib}`) // TODO bug fix groups from fact table ???
    }
  }

  return { selects, tables, tableJoins, groups }
}

const generateQuery = (payload) => {
  // TODO fix spacing and new lines
  const { selects, tables, tableJoins, groups } = parsePayload(payload)
  const strSelects = Array.from(selects).join(',\n    ')
  const strTables = Array.from(tables).sort().join(',\n    ')
  const strJoins = Array.from(tableJoins).sort().join('\n    AND ')
  const strGroups = Array.from(groups).join(',\n    ')

  let tsql = `
    SELECT
        ${strSelects}
      FROM
        ${strTables}
  `

  if (strJoins.length > 0) {
    tsql += `
    WHERE
      ${strJoins}
  `
  }

  if (strGroups.length > 0) {
    tsql += `
    GROUP BY
      ${strGroups}
    `
  }

  return tsql
}

module.exports = {
  selectFactTables,
  selectMeasures,
  selectDimensions,
  generateQuery
}
