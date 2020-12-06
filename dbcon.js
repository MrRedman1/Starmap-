var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_yermuraa',
  password        : '6395',
  database        : 'cs340_yermuraa'
});
module.exports.pool = pool;
