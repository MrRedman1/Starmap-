module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getStars(res, mysql, context, complete){
        mysql.pool.query("SELECT star_identifier as id, star_name FROM stars", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.stars  = results;
            complete();
        });
    }

    function getConstell(res, mysql, context, complete){
        mysql.pool.query("SELECT constell.constell_identifier as id, constell_name FROM constell", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.constell = results;
            complete();
        });
    }
	
	function getFounder(res, mysql, context, complete){
        mysql.pool.query("SELECT founder_identifier as id, founder_name FROM founder", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.founder  = results;
            complete();
        });
    }



    /*Display all stars. Requires web based javascript to delete users with AJAX*/

    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletestars.js","filterstars.js","searchstars.js"];
        var mysql = req.app.get('mysql');
        getStars(res, mysql, context, complete);
        getConstell(res, mysql, context, complete);
		getFounder(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 3){
                res.render('stars', context);
            }

        }
    });

    /*Display all stars whose name starts with a given string. Requires web based javascript to delete users with AJAX */
    router.get('/search/:s', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletestars.js","filterstars.js","searchstars.js"];
        var mysql = req.app.get('mysql');
        getStars(res, mysql, context, complete);
        getConstell(res, mysql, context, complete);
		getFounder(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('stars', context);
            }
        }
    });

    /* Display one person for the specific purpose of updating people 

    router.get('/:id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedplanet.js", "updateperson.js"];
        var mysql = req.app.get('mysql');
        getPerson(res, mysql, context, req.params.id, complete);
        getPlanets(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('update-person', context);
            }

        }
    }); 

    /* Adds a star, redirects to the display page after adding */

    router.post('/', function(req, res){
		console.log(req.body.founder)
        console.log(req.body.constell)
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO stars (star_identifier, star_name, constell_identifier, founder_identifier) VALUES (?,?,?,?)";
        var inserts = [req.body.star_identifier, req.body.star_name, req.body.constell_identifier, req.body.founder_identifier];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/stars');
            }
        });
    });

    /* The URI that update data is sent to in order to update a star */

    router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        console.log(req.body)
        console.log(req.params.id)
        var sql = "UPDATE stars SET star_identifier=?, star_name=?, constell=?, founder=? WHERE character_id=?";
        var inserts = [req.body.star_identifier, req.body.star_name, req.body.constell, req.body.founder, req.params.id];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(error)
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        });
    });

    /* Route to delete a star, simply returns a 202 upon success. Ajax will handle this. */

    router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM stars WHERE character_id = ?";
        var inserts = [req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                console.log(error)
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
    })

    return router;
}();
