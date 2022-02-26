const express = require('express')
const mysql = require('mysql')

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))


const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'samaki'
})



app.post('/sign-up', (req, res) => {
    let name = req.body.name
    let phone = req.body.phone

    con.query("select * from users where phone=?", [phone], (Err, Rows, Fields) => {
        if (Err) throw new Error(Err)
        if (Rows.length != 0) {
            res.status(500).json({ message: 'Namba ya simu '+phone+' imekwisha tumika.' }).end()
        } else {
            con.query('insert into users values (null, ?, ?);', [name, phone], (err, rows, fields) => {
                if (err) throw new Error(err)
                res.json({ status: 200 })
            })
        }
    })
})


app.listen(5000, () => console.log("Server is listening at 5000"))
