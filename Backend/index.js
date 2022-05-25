const express = require('express')
const mongoose = require('mongoose')
var cors = require('cors')
const fs = require('fs');


const app = express()
app.use(cors())
// READ JSON / MIDDLEWARES
app.use(
    express.urlencoded({
        extended: true,
    }),
)

app.use(express.json()).listen()

// ROUTES API
const pokemonRoutes = require('./routes/pokemonRoutes');
const { populate } = require('./models/Pokemon.js');
const Pokemon = require('./models/Pokemon.js');

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

function startupServer() {
    // server ready to accept connections here
    fs.readFile('pokemon.json', (err, data) => {
        if (err) throw err;
        let pokemon = JSON.parse(data);
        var index = 1;
        pokemon.forEach(element => {
            var json = {
                'name': element.name,
                'url': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/'+ index + '.svg',
                'isCatch': false,
                'id': index
            }
            index ++;
                Pokemon.findOneAndUpdate({ 'name': element.name }, json, { upsert: true, new: true }, (error, result) => {
                    if (error) {
                        return;
                    }
                });
        });
    })
};
startupServer();
