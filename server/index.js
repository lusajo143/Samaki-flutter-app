const express = require('express')


const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.post('/sign-up', (req, res) => {
    let name = req.body.name
    let phone = req.body.phone

    console.log(req.body);
})


app.listen(5000, () => console.log("Server is listening at 5000"))
