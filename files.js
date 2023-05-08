const fs = require('fs');
const multer = require('multer');

const storage = multer.diskStorage({
    destination: function(req, file,cb){
        cb(null, 'files/');
    },filename: function(req,file,cb){
        cb(null,  path.extname(file.originalname));
    }
})
const upload = multer({storage})

function fileExist(fileName){
    if (fs.existsSync('files/'+fileName)) {
        return true;
    } else {
        return false;
    }
}

function filesList(){
    fs.readdir('files/', (err, files) => {
        if (err) {
          return [];
        }
        return files;
      });
}

function fileSave(req){
    upload.single(req.body.file)
}

module.exports = {fileExist, filesList, fileSave}