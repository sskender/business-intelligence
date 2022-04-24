const express = require('express')
const httpStatus = require('http-status')

const sqlQueries = require('../services/sqlqueries')

const router = express.Router()

router.get('/tables', async (req, res, next) => {
  try {
    const tsql = sqlQueries.selectFactTables()
    const query = await req.app.locals.db.query(tsql)
    const records = query.recordset
    const result = { query: tsql, result: records }

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

    const tsql = sqlQueries.selectMeasures(tableId)
    const query = await req.app.locals.db.query(tsql)
    const records = query.recordset
    const result = { query: tsql, result: records }

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

    const tsql = sqlQueries.selectDimensions(tableId)
    const query = await req.app.locals.db.query(tsql)
    const records = query.recordset
    const result = { query: tsql, result: records }

    return res.status(httpStatus.OK).json({
      success: true,
      status: httpStatus.OK,
      data: result
    })
  } catch (err) {
    return next(err)
  }
})

router.post('/query', async (req, res, next) => {
  try {
    const payload = req.body
    const tsql = sqlQueries.generateQuery(payload)
    const result = { query: tsql, result: payload }

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
