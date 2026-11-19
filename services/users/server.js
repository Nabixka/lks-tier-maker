const express    = require("express")
const cors       = require("cors")
const jwt        = require("jsonwebtoken")
const port       = process.env.PORT ?? 3000
const app        = express()
const { pool }   = require("./config") 
const bcrypt     = require("bcrypt")

app.use(express.json())
app.use(cors())

function jwtSign(data){
    const token = jwt.sign(
        { id: data.id, email: data.email },
        'secret',
        { expiresIn: "15m", algorithm: "HS256"}
    )
}

app.post('/login', async(req, res) => {
    try{
        const { email, password } = req.body

        const getUser = await pool.query(`
            SELECT id, email, password FROM users WHERE email = $1`,
        [email])

        if(getUser.rows.length === 0 ){
            return res.status(404).json({
                message: "Akun belum terdaftar"
            })
        }
        
        const user = getUser.rows[0]
        const isPassword = await bcrypt.compare(password, user.password)
        if(!isPassword){
            return res.status(400).json({
                message: "Password Salah"
            })
        }

        const token = jwtSign(user.id, user.email)
        return res.json({
            message: "Berhasil Login",
            token : token
        })

    }
    catch(err){
        return res.status(500).json({
            message: "Internal Server Error",
            error: err.message,
            stack: err.stack
        })
    }
})

app.listen(port, () => {
    console.log(`Application Run on Port ${port}`)
})