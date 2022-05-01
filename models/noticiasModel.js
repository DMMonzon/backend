var pool = require('./bd');

/* listar */
async function getNoticias() {
    var query = "select * from noticias order by id desc";
    var rows = await pool.query(query);
    return rows;
}

/* insertar */
async function insertNoticias(obj) {
    try {
        var query = "insert into noticias set ? ";
        var rows = await pool.query(query, [obj]);
        return rows;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

/* eliminar */
async function eliminarNoticiasById(id) {
   var query = "delete from noticias where id = ?";
   var rows = await pool.query(query, [id]);
   return rows;
}

/* modificar */
async function getNoticiasById(id) {
    var query = "select * from noticias where id = ?";
    var rows = await pool.query(query, [id]);
    return rows[0];
}

async function modificarNoticiasById(obj, id) {
    try {
        var query = "update noticias set ? where id=?";
        var rows = await pool.query(query, [obj, id]);
        return rows;
    } catch (error) {
        throw error;
    }
}

module.exports = { getNoticias, insertNoticias, eliminarNoticiasById, modificarNoticiasById, getNoticiasById }