const express = require('express')         
const {signUpUser,verifyUser,signInUser} = require('./auth.controller')
const authRouter = express.Router()

authRouter.post('/sign-up',signUpUser)
authRouter.post('/verify',verifyUser)
authRouter.post('/sign-in',signInUser)

module.exports = authRouter