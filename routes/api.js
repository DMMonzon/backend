var express = require('express');
var router = express.Router();
var noticiasModel = require('./../models/noticiasModel');
var cloudinary = require('cloudinary').v2;
var nodemailer = require('nodemailer');

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
                imagen: ''
            }
        }
    });

    res.json(noticias);
});

router.post('/contacto', async (req, res) => {
    const mail = {
        to: 'dmmonzon82@gmail.com',
        subject: 'Contacto web',
        html: `${req.body.nombre} se contactó a través de la web y quiere más información a este correo: ${req.body.email} <br> Además hizo el siguiente comentario: ${req.body.mensaje} <br> Su teléfono es: ${req.body.telefono}`
    }
    const transport = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        auth: {
            user: process.env.SMTP_USER,
            pass: process.env.SMTP_PASS,
        }
    });

    await transport.sendMail(mail)

    res.status(201).json({
        error: false,
        message: "Mensaje enviado"
    });
});

module.exports = router;