const http = require('http')
const app = require('./app')
//port
const PORT = 8000 | process.env.PORT

//creating server
const server = http.createServer(app)

//listening to server requests
server.listen(PORT,()=>{
    console.log(`Listerning on port ${PORT}`)
})