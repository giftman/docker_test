'use strict';
const express = require('express')

const PORT = 3000

const app = express()
app.get('/',function(req,res){
    res.send('hello Hello docker world auto build and release success')
})

app.listen(PORT)
console.log('Running on htpp://localhost:' + PORT)
