const express = require('express')
const mongoose = require('mongoose')
var cors = require('cors')

const app = express()
app.use(cors())

// READ JSON / MIDDLEWARES
app.use(
    express.urlencoded({
        extended: true,
    }),
)

app.use(express.json())

// ROUTES API
const pokemonRoutes = require('./routes/pokemonRoutes')

app.use('/pokemon', pokemonRoutes)
// ENDPOINT
app.get('/', (req, res) => {
    res.json({ message: 'Oi express' })
})

// PORT
const uri = "mongodb://localhost:27017/pokedex";
mongoose
    .connect(uri)
    .then(() => {
        console.log("Conexão com MongoDB foi um sucesso!");
        app.listen(3000);
    })
    .catch((err) => console.log(err))

