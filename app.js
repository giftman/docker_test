'use strict';
const express = require('express')

const PORT = 8080

const app = express()
app.get('/',function(req,res){
    res.send('Hello docker world auto build and release')
})

app.listen(PORT)
console.log('Running on htpp://localhost:' + PORT)
