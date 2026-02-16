const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {
    const { Product } = srv.entities;
    let originalStock, ID;

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

    srv.before('orderProduct', async (req) => {
        console.log(req.data) // data passed to Server
        console.log(req.params) // capture ID of the entity to be updated
        ID = req.params[0].ID

        const result = await SELECT`cost_stock`.from(Product).where({ ID: ID })
        originalStock = result[0].cost_stock

        if (originalStock > 500) {
            return req.error({
                code: '400',
                message: 'Stock should not be greater than 500'
            })
        }
    })

    srv.on('orderProduct', async (req) => {
        let updatedStock = req.data.stock + originalStock

        const result = await UPDATE(Product).with({ cost_stock: updatedStock }).where({ ID: ID })
        console.log("Updated Result", result) // result is 1 then update query successful
        
        return req.notify(`Order placed! Updated stock is now ${updatedStock}`)
    })
})