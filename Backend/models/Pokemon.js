const mongoose = require('mongoose')

const Pokemon = mongoose.model('Pokemon',{
    name: String,
    url: String,
    isCatch: Boolean
},'Pokemon'
)

module.exports = Pokemon