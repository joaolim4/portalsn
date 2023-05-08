const mysql = require("mysql2/promise");

function getFormatDate(){
    let date_ob = new Date();
    let year = date_ob.getFullYear();
    let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    let day = ("0" + date_ob.getDate()).slice(-2);
    let hours = ("0" + date_ob.getHours()).slice(-2); 
    let minutes = ("0" + date_ob.getMinutes()).slice(-2); 
    let seconds = ("0" + date_ob.getSeconds()).slice(-2); 
    var dateF = year+month+day+hours+minutes+seconds
    
    return dateF;
}

async function connect(){
    if(global.connetion && global.connetion.state !== 'disconnected'){
         return global.connetion;
    }else {
        const connetion = await mysql.createConnection("mysql://admin:15082005Jp@database-1.cfttfqva9crx.us-east-1.rds.amazonaws.com:3306/portalsn");
        global.connetion = connetion;
        return connetion;
    }
}

async function createNews(title,img,subtitle, tags,post_body){
    const date =  getFormatDate()
    const connection = await connect();
    const prepare = 'INSERT INTO portalsn_posts VALUES(NULL, ?,?,?,?,?,?,0)'
    await connection.query(prepare, [title,img,subtitle, tags,post_body,date])
}

async function updateNews(post_array){
    const connection = await connect();
    const prepare = 'UPDATE  portalsn_posts SET post_title = ?, post_image = ?, post_subtitle = ?, post_tags = ?, post_body = ? WHERE post_id = ?'
    await connection.query(prepare, [post_array.post_title,post_array.post_image,post_array.post_subtitle, post_array.post_tags,post_array.post_body,post_array.post_id])
    return true;
}

async function addpostview(post_id){
    const connection = await connect();
    const prepare = 'UPDATE  portalsn_posts SET post_views = post_views + ? WHERE post_id = ?'
    await connection.query(prepare, [1,post_id])
}
// 
async function requestPost(post_id){
    const connection = await connect();
    const prepare = 'SELECT * FROM portalsn_posts WHERE post_id = ?'
    const [rows] = await connection.query(prepare, [post_id])
    if(rows[0]){
        addpostview(rows[0].post_id)
    }
    return rows;
}

async function getpostViews(){
    const connection = await connect();
    var newDate = Number(getFormatDate())-700000000
    const prepare = 'SELECT * FROM portalsn_posts WHERE post_date > ?  ORDER BY post_views DESC'
    const [rows] = await connection.query(prepare, [newDate])
    if(rows[0]){
        addpostview(rows[0].post_id)
    }
    return rows;
}

async function getPosts(){
    const connection = await connect();
    var newDate = Number(getFormatDate())-700000000
    const prepare = 'SELECT * FROM portalsn_posts WHERE post_date > ? ORDER BY post_date DESC'
    const [rows] = await connection.query(prepare, [newDate])
    return rows;
}

async function searchNews(search){
    var search = "%"+search+"%"
    const connection = await connect();
    const prepare = "SELECT * FROM portalsn_posts WHERE post_title LIKE ? OR post_tags LIKE ?"
    const [rows] = await connection.query(prepare, [search, search])
    return rows;
}

async function createAdminUser(login, password){
    const connection = await connect();
    const prepare = 'INSERT INTO portalsn_admin VALUES(NULL, ?,?)'
    await connection.query(prepare, [login,password])
}

async function getAdimUser(login){
    const connection = await connect();
    const prepare = 'SELECT * FROM portalsn_admin WHERE user_login = ?'
    const [rows] = await connection.query(prepare, [login])
    return rows;
}

module.exports = {createNews,requestPost, searchNews, createAdminUser, getAdimUser, updateNews, getPosts, getpostViews}