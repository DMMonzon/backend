var express = require('express');
var router = express.Router();
var noticiasModel = require('./../../models/noticiasModel');

/* GET home page. */
router.get('/', async function (req, res, next) {
  var noticias = await noticiasModel.getNoticias();
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
    if (req.body.titulo != "" && req.body.subtitulo != "" && req.body.hash1 != "" && req.body.hash2 != "" && req.body.hash2 != "" && req.body.fuente1 != "" && req.body.fuente2 != "" && req.body.fuente3 != "") {
      await noticiasModel.insertNoticias(req.body);
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
    let obj = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      hash1: req.body.hash1,
      hash2: req.body.hash2,
      hash3: req.body.hash3,
      fuente1: req.body.fuente1,
      fuente2: req.body.fuente2,
      fuente3: req.body.fuente3,
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