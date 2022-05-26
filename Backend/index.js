const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const fs = require("fs");

// Mongose config
const pokemonRoutes = require("./routes/pokemonRoutes");
const Pokemon = require("./models/Pokemon.js");

const app = express();
app.use(cors());
app.use(express.json());

// READ JSON / MIDDLEWARES
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use("/pokemon", pokemonRoutes);

// ENDPOINT DEFAULT
app.get("/", (req, res) => {
  res.json({ message: "Starter route" });
});

// PORT
const uri = "mongodb://localhost:27017/pokedex";
mongoose
  .connect(uri)
  .then(() => {
    console.log("Conexão com MongoDB foi um sucesso!");
    app.listen(8080);
  })
  .catch((err) => console.log(err));

// UPLOAD INCIAL DATA
function startupServer() {
  fs.readFile("pokemon.json", (err, data) => {
    if (err) throw err;
    let pokemon_local = JSON.parse(data);

    pokemon_local.forEach((element, index) => {
      let usable_index = index + 1;
      let json = {
        name: element.name,
        url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/" +
          usable_index +
          ".svg",
        isCatch: false,
        id: usable_index,
      };
      Pokemon.findOneAndUpdate(
        { name: element.name },
        json,
        { upsert: true, new: true },
        (error, result) => {
          if (error) {
            return;
          }
        }
      );
    });
  });
}
// SERVER RUNNING
let port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log("Server is running on port " + port);
  startupServer();
});