var express = require('express');
var router = express.Router();
var noticiasModel = require('./../models/noticiasModel');
var cloudinary = require('cloudinary').v2;

router.get('/noticias', async function (req, res, next) {
    let noticias = await noticiasModel.getNoticias();

    noticias = noticias.map(noticias => {
        if (noticias.img_id) {
            const imagen = cloudinary.url(noticias.img_id, {
                width: 200,
                height: 200,
                crop: 'fill'
            });
            return {
                ...noticias,
                imagen
            }
        } else {
            return {
                ...noticias,
                imagen:''
            }
        }
    });

    res.json(noticias);
});

module.exports = router;