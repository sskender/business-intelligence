const express = require('express')
const httpStatus = require('http-status')

const sqlQueries = require('../services/sqlqueries')

const router = express.Router()

router.get('/tables', async (req, res, next) => {
  try {
    const query = await req.app.locals.db.query(sqlQueries.selectFactTables())
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

router.get('/measures/:tableId', async (req, res, next) => {
  try {
    const { tableId } = req.params
    const query = await req.app.locals.db.query(sqlQueries.selectMeasures(tableId))
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

router.get('/dimensions/:tableId', async (req, res, next) => {
  try {
    const { tableId } = req.params
    const query = await req.app.locals.db.query(sqlQueries.selectDimensions(tableId))
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
