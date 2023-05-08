



const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const bd = require('./bdfunctions');
const path = require('path');
const files = require('./files');
const app = express();

app.use(session({
    secret:'ajbvajvnaujvavsuscskdfj',
    resave: true,
    saveUninitialized: true
}));

const port = 3000

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}))
app.engine('html',require('ejs').renderFile);
app.set('view engine','html')
app.use('/public', express.static(path.join(__dirname, 'public')))
app.set('views', path.join(__dirname, '/pages'));

app.get('/', async function(req,res){
    if(req.query.search){
        const resultBd = await bd.searchNews(req.query.search)
        res.render('search', {resultBd})
    }else {
        const resultBd = await bd.getPosts()
        res.render('home', {resultBd})
    }
})

app.get('/:slug/:id', async function(req,res){
    if(req.params.slug== 'admin'){
        if(req.session.login){
            res.render('admin')
        }else {
            res.render('adminlogin')
        }
    }else if(req.params.slug== 'post') {
        const id=parseInt(req.params.id)
        const resultBd = await bd.requestPost(id)
        const post = resultBd[0];
        res.render('single', {post})
    }else {
        res.render('home')
    }
   
})

app.post('/admin', async function(req,res){
    let login  = req.body.user_login
    if(req.body.login_action){
        let password  = req.body.user_password
        if(login && password){
            try {
                const returnQuery = await bd.getAdimUser(login)  
                const user = returnQuery[0]
                if(await bcrypt.compare(password, user.user_password)){     
                    req.session.login = login
                    res.render('admin')
                }else{
                    res.render('adminlogin')
                }
            }catch{
                res.render('adminlogin')
            }
        }else{
            res.render('adminlogin')
        }
    }else if(req.body.post_action){
        var title = req.body.post_title
        var img = req.body.post_img
        var subtitle = req.body.post_subtitle
        var tags = req.body.post_tags
        var post_body = req.body.post_body
        if(title && img && subtitle && tags && post_body){
            await bd.createNews(title,img,subtitle, tags,post_body)
            res.render('admin')
        }else{
            res.render('admin')
        }
        
    }
   
})

app.post('/register', async function(req,res){
    let login  = req.body.user_login
    let password  = req.body.user_password
    if(login && password && req.session.login){
        try {
            const hashPassword = await bcrypt.hash(password, 10);
            await bd.createAdminUser(login, hashPassword)
            res.send()
        }catch{
            res.send()
        }
    }
})

app.post('/getPostSearch', async function(req,res){
    let post_id  = req.body.post_id
    let request = await bd.requestPost(post_id)
    if (request[0]){
        res.send(request[0])
    }else {
        res.send('null')
    }
})

app.post('/getHotPosts', async function(req,res){
    let request = await bd.getpostViews()
    if (request[0]){
        res.send(request)
    }else {
        res.send('null')
    }
})

app.post('/updatePost', async function(req,res){
    let post  = req.body.post_array;
    var returnBd = await bd.updateNews(post);
    res.send(returnBd)
})

app.listen(port, ()=>{
    console.log("Server on!")
})