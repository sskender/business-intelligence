const express = require('express')
const cors = require('cors')
const sql = require('mssql')
const dotenv = require('dotenv')

dotenv.config()

const appPool = new sql.ConnectionPool(process.env.DB_CONN_STRING)
const app = express()

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use('/api', require('./routes'))
app.use(require('./routes/errors').clientErrorHandler)
app.use(require('./routes/errors').errorHandler)

appPool.connect().then((pool) => {
  app.locals.db = pool
  const port = process.env.PORT || 3000
  app.listen(port, () => {
    console.log(`App listening on port ${port}!`)
  })
}).catch((err) => {
  console.error('Error creating connection pool', err)
})
