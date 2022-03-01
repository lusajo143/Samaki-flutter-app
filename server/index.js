const express = require('express')
const mysql = require('mysql')

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use(express.static('public'))


const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'samaki'
})



app.post('/sign-up', (req, res) => {
    let name = req.body.name
    let phone = req.body.phone

    if (name != "" && phone == "") {
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
    } else {
        res.status(500).json({ message: 'Jina na namba ya simu vinahitajika.'}).end()
    }
 })

app.get('/get_articles', (req, res) => {
    
    console.log("hit get articles\n");

    con.query('select * from articles limit 6', (err, rows, fields) => {
        if (err) throw new Error(err)

        let articles = []

        rows.forEach(article => {
            articles.push({
                id: article.id,
                title: article.title,
                description: article.description,
                time: article.time,
                image: article.image
            })
        });

        res.status(200).json(articles).end()
    })
 
})


app.post('/sign-in', (req, res) => {

    console.log("Hit sign in");
    let phone = req.body.phone

    con.query('select * from users where phone=?', [phone], (err, rows, fields) => {
        if (err) throw new Error(err)
        
        rows.length != 0 ? res.status(200).json({ id: rows[0].id }) : res.status(500).json({ message: phone + ' is not registered.'})

    })

})


app.listen(5000, () => console.log("Server is listening at 5000"))
