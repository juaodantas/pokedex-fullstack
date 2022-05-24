const mongoose = require('mongoose')

const Pokemon = mongoose.model('Pokemon',{
    id: String,
    name: String,
    url: String,
    isCatch: Boolean
},'Pokemon'
)

module.exports = Pokemon