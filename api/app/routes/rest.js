var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
var service = require('../services/AppService.js');


module.exports = function (application) {
    const controller = application.app.controllers.AppController;

    application.all('*', function (req, res, next) {
        res.header('Access-Control-Allow-Origin', '*');
        res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        res.header('Content-Type', 'application/json');
        next();
    });

    application.put('/', jsonParser, async function (req, res) {
        //TODO: call controller
        res.status(200).send({})
    });

    application.delete('/', async function (req, res) {
        //TODO: call controller
        res.status(200).send({})
    });

    application.get('/participant-exams', async function (req, res) {
        //TODO: call controller
        // res.status(200).send('result')



        service.doit()
            .then(result => {
                res.status(200).send(Buffer.from(result, 'hex'))
            });
    });

    application.get('/api/retinography', async function (req, res) {
        //TODO: call controller
        // res.status(200).send('result')

        service.doit()
            .then(result => {
                res.status(200).send({
                    date: "2019-09-09T17:40:34.699Z",
                    eye: 'left',
                    result: result
                })
            });
    });


    application.post('/', jsonParser, function (req, res) {
        //TODO: call controller
        res.status(200).send({})
    });
};
