const express = require('express');
const disk = require('diskusage');
const router = express.Router();

const tempVolume = '/vol-tmp';
const extractVolume = '/vol-extract';

router.get('/', function (req, res, next) {
    disk.check(extractVolume, function (err, info) {
        if (err) {
            next(err);
        } else {
            res.json(info);
        }
    });
});

module.exports = router;