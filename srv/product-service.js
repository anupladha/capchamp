const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {
    //const {Product} = srv.entities;

    // srv.on('READ', 'Product', async (req) => {
    //     console.log("<<I am in `ON` Handler>>")
    // })

    // srv.after('READ', 'Product', async (req) => {
    //     console.log("<<I am in `AFTER` Handler>>")
    // })

    // srv.before('READ', 'Product', async (req) => {
    //     console.log("<<I am in `BEFORE` Handler>>")
    // })

    srv.on('myFunction', async (req) => {
        let result = `Super Cool ${req.data.name}`
        return result
    })

    srv.on('myAction', async (req) => {
        let result = `Super Cool ${req.data.name}`
        return result
    })
})