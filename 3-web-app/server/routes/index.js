const express = require('express')
const httpStatus = require('http-status')

const router = express.Router()

router.get('/tables', async (req, res, next) => {
  try {
    const query = await req.app.locals.db.query('SELECT * FROM tablica WHERE sifTipTablica = 1')
    const result = query.recordset

    return res.status(httpStatus.OK).json({
      success: true,
      status: httpStatus.OK,
      data: result
    })
  } catch (err) {
    return next(err)
  }
})

router.get('/measures', async (req, res, next) => {
  try {
    const query = await req.app.locals.db.query(`SELECT * 
      FROM tabAtribut, agrFun, tablica, tabAtributAgrFun                                          
        WHERE tabAtribut.sifTablica =  100 -- Zamijeniti s npr. <<this.RadioButtonListFacts.SelectedItem.Value>>
        AND tabAtribut.sifTablica = tablica.sifTablica 
        AND tabAtribut.sifTablica  = tabAtributAgrFun.sifTablica 
        AND tabAtribut.rbrAtrib  = tabAtributAgrFun.rbrAtrib 
        AND tabAtributAgrFun.sifAgrFun = agrFun.sifAgrFun 
        AND tabAtribut.sifTipAtrib = 1
        ORDER BY tabAtribut.rbrAtrib`)
    const result = query.recordset

    return res.status(httpStatus.OK).json({
      success: true,
      status: httpStatus.OK,
      data: result
    })
  } catch (err) {
    return next(err)
  }
})

router.get('/dimensions', async (req, res, next) => {
  try {
    const query = await req.app.locals.db.query(`SELECT   dimTablica.nazTablica
      , dimTablica.nazSQLTablica  AS nazSqlDimTablica
      , cinjTablica.nazSQLTablica AS nazSqlCinjTablica
      , cinjTabAtribut.imeSQLAtrib
      , dimTabAtribut.imeSqlAtrib
      , tabAtribut.*
        FROM tabAtribut, dimCinj
            , tablica dimTablica, tablica cinjTablica 
            , tabAtribut cinjTabAtribut, tabAtribut dimTabAtribut
        WHERE dimCinj.sifDimTablica  = dimTablica.sifTablica
        AND dimCinj.sifCinjTablica = cinjTablica.sifTablica
        
        AND dimCinj.sifCinjTablica = cinjTabAtribut.sifTablica
        AND dimCinj.rbrCinj = cinjTabAtribut.rbrAtrib
        
        AND dimCinj.sifDimTablica = dimTabAtribut.sifTablica
        AND dimCinj.rbrDim = dimTabAtribut.rbrAtrib

        AND tabAtribut.sifTablica  = dimCinj.sifDimTablica
        AND sifCinjTablica = 100 --  Zamijeniti 
        AND tabAtribut.sifTipAtrib = 2
        ORDER BY dimTablica.nazTablica, rbrAtrib
`)
    const result = query.recordset

    return res.status(httpStatus.OK).json({
      success: true,
      status: httpStatus.OK,
      data: result
    })
  } catch (err) {
    return next(err)
  }
})

module.exports = router
