const router = require('express').Router()


const Pokemon = require('../models/Pokemon')

// CREATE
router.post('/', async (req, res) => {
    const { name, url, isCatch } = req.body

    const pokemon = {
        name,
        url,
        isCatch,
    }
    try {
        await Pokemon.create(pokemon)

        res.status(201).json({ message: 'Pokemon inserido no sistema com sucesso!' })
    } catch (error) {
        console.log(error)
        res.status(500).json({ erro: error })
    }
})

// READ - chatch pokemons with "isCatch = true"
router.get('/', async (req, res) => {
    try {
        const pokemons = await Pokemon.find({ isCatch: true })

        res.status(200).json(pokemons)
    } catch (error) {
        res.status(500).json({ error: error })
    }
})

//UPDATE - Update isCatch value
router.patch('/:name', async (req, res) => {


    const { name } = req.params

    try {
        const updatedPokemon = await Pokemon.updateOne({ 'name': name }, req.body)
        
        // Tratamento de erro
        if (updatedPokemon.matchedCount === 0 ) {
            res.status(422).json({ message: 'Pokemon não encontrado!' })
            return
        }

        res.status(200).json({ success: "Pokemon adicionado com sucesso" })
        
    } catch (error) {
        console.log(error)
        res.status(500).json({ erro: error })
    }
})

module.exports = router