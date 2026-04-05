# from odoo import models, fields, api


# class debtor(models.Model):
#     _name = 'debtor.debtor'
#     _description = 'debtor.debtor'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()
#
#     @api.depends('value')
#     def _value_pc(self):
#         for record in self:
#             record.value2 = float(record.value) / 100

from odoo import models, fields

class Person(models.Model):
    _name = "debtor.person"
    _description = "Person debtor"

    name = fields.Char(string="Nombre", required=True)
    phone = fields.Char(string="Tel", required=True)
    #age = fields.Integer(string="Edad")