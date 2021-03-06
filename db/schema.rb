# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_525_180_306) do
  create_table 'alunos', force: :cascade do |t|
    t.text 'nome'
    t.text 'cpf'
    t.date 'data_de_nascimento'
    t.integer 'telefone_celular'
    t.text 'genero'
    t.text 'meio_de_pagamento'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'faturas', force: :cascade do |t|
    t.float 'valor_da_fatura'
    t.date 'data_vencimento'
    t.text 'status'
    t.integer 'matricula_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['matricula_id'], name: 'index_faturas_on_matricula_id'
  end

  create_table 'instituicaos', force: :cascade do |t|
    t.text 'nome'
    t.text 'cnpj'
    t.text 'tipo'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'matriculas', force: :cascade do |t|
    t.float 'valor_total_do_curso'
    t.integer 'quantidade_de_faturas'
    t.integer 'dia_de_vencimento_das_faturas'
    t.text 'nome_do_curso'
    t.integer 'instituicao_id', null: false
    t.integer 'aluno_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['aluno_id'], name: 'index_matriculas_on_aluno_id'
    t.index ['instituicao_id'], name: 'index_matriculas_on_instituicao_id'
  end

  add_foreign_key 'faturas', 'matriculas'
  add_foreign_key 'matriculas', 'alunos'
  add_foreign_key 'matriculas', 'instituicaos'
end
