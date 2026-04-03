# from odoo import http


# class Debtor(http.Controller):
#     @http.route('/debtor/debtor', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/debtor/debtor/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('debtor.listing', {
#             'root': '/debtor/debtor',
#             'objects': http.request.env['debtor.debtor'].search([]),
#         })

#     @http.route('/debtor/debtor/objects/<model("debtor.debtor"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('debtor.object', {
#             'object': obj
#         })

