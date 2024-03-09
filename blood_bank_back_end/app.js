const express = require('express')
const authController = require('./routers/auth/auth.router.js')

const app = express()

app.use(express.json())

app.use('/auth',authController)
module.exports = app;