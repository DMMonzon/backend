var express = require('express');
var router = express.Router();
var noticiasModel = require('./../../models/noticiasModel');
var util = require('util');
var cloudinary = require('cloudinary').v2;

const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);

/* GET home page. */
router.get('/', async function (req, res, next) {
  var noticias = await noticiasModel.getNoticias();

  noticias = noticias.map(noticias => {
    if (noticias.img_id) {
      const imagen = cloudinary.image(noticias.img_id, {
        width: 100,
        height: 100,
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

  res.render('admin/noticias', {
    layout: 'admin/layout',
    usuario: req.session.nombre,
    noticias
  });
});

router.get('/agregarNoticias', (req, res, next) => {
  res.render('admin/agregarNoticias', {
    layout: 'admin/layout'
  });
});

router.get('/eliminarNoticias/:id', async (req, res, next) => {
  var id = req.params.id;

  let noticias = await noticiasModel.getNoticiasById(id);
  if (noticias.img_id) {
    await (destroy(noticias.img_id));
  }
  
  await noticiasModel.eliminarNoticiasById(id);
  res.redirect('/admin/noticias')
});

router.get('/modificarNoticias/:id', async (req, res, next) => {
  let id = req.params.id;
  let noticias = await noticiasModel.getNoticiasById(id);
  res.render('admin/modificarNoticias', {
    layout: 'admin/layout',
    noticias
  });
});

router.post('/agregarNoticias', async (req, res, next) => {
  try {
    var img_id = '';
    if (req.files && Object.keys(req.files).length > 0) {
      imagen = req.files.imagen;
      img_id = (await uploader(imagen.tempFilePath)).public_id;
    }
    if (req.body.titulo != "" && req.body.subtitulo != "" && req.body.hash1 != "" && req.body.hash2 != "" && req.body.hash2 != "" && req.body.fuente1 != "" && req.body.fuente2 != "" && req.body.fuente3 != "") {
      await noticiasModel.insertNoticias({
        ...req.body,
        img_id
      });
      res.redirect('/admin/noticias')
    } else {
      res.render('admin/agregarNoticias', {
        layout: 'admin/layout',
        error: true, message: 'Por favor, complete todos los campos'
      })
    }
  } catch (error) {
    console.log(error)
    res.render('admin/agregarNoticias', {
      layout: 'admin/layout',
      error: true, message: 'No se cargó la noticia!'
    });
  }
});

router.post('/modificarNoticias', async (req, res, next) => {
  try {
    let img_id = req.body.img_original;
    let borrar_img_vieja = false;
    if (req.body.img_delete === "1") {
      img_id = null;
      borrar_img_vieja = true;
    } else {
      if (req.files && Object.keys(req.files).length > 0) {
        imagen = req.files.imagen;
        img_id = (await
          uploader(imagen.tempFilePath)).public_id;
          borrar_img_vieja = true;
      }
    }
    if (borrar_img_vieja && req.body.img_original) {
      await (destroy(req.body.img_original));
    }

    let obj = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      hash1: req.body.hash1,
      hash2: req.body.hash2,
      hash3: req.body.hash3,
      fuente1: req.body.fuente1,
      fuente2: req.body.fuente2,
      fuente3: req.body.fuente3,
      img_id
    }
    await noticiasModel.modificarNoticiasById(obj, req.body.id);
    res.redirect('/admin/noticias');
  }
  catch (error) {
    console.log(error)
    res.render('admin/modificarNoticias', {
      layout: 'admin/layout',
      error: true, message: 'No se pudo modificar la noticia.'
    });
  }
});

module.exports = router;