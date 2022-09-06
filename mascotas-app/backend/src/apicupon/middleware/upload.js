const multer = require("multer");
const Path = require("path");

const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, "./uploads");
    },
    filename: function(req, file, cb){
        cb(null, Date.now() + "--" + file.originalname);
    }
});

const fileFilter = (req, file, callback) => {
    const validExts = [".png", ".jpg"];
    if(!validExts.includes(Path.extname(file.originalname))){
        return callback(new Error("Only png or jpg"));
    }

    const fileSize = parseInt(req.headers["content-length"]);
    if(fileSize > 1048576){
        return callback(new Error("El archivo es grande"));
    }

    callback(null, true);
};

let upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    fileSize: 1048576,
});

module.exports = upload.single("cuponImage")