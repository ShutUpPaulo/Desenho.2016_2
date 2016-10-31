# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db
# with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{ name: 'admin' }, { name: 'cook' }])
Ingredient.create([{ name: 'acucar',description: '1' }, { name: 'acucar',
  description: '1' },
{ name: 'tempero',description: '1' }, { name: 'tudo de bom',
  description: '1231' },
{ name: 'pepino',description: '1543' }, { name: 'sal', description: '1' },
{ name: 'tomate',description: '17' }, { name: 'berinjela', description: '1956' },
{ name: 'whey',description: '190-' }, { name: 'sorvete', description: 'sdaf1' },
{ name: 'arroz', description: '1asdfa' }, { name: 'feijao',
  description: '1ghrqegq' },
{ name: 'salada', description: 'bvv1' }, { name: 'porra', description:
  '1vvvv' },{ name: 'oi', description: '1xxx' }, { name: 'Goku', description:
  '1bbbb' }, { name: 'salsa', description: '1eeee' }, { name: 'merengue',
                                                        description: '1tttt' }])
