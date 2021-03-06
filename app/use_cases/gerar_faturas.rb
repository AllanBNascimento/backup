class GerarFaturas
    include UseCase
    def initialize (matricula)
        @matricula = matricula
    end
    def perform
        valor = (@matricula.valor_total_do_curso / @matricula.quantidade_de_faturas)    
        hoje = Date.today.strftime('%d').to_i
        dia_v = @matricula.dia_de_vencimento_das_faturas.to_i
        mes_atual = Date.today.strftime('%m').to_i

        i = (hoje > dia_v) ? 1 : 0  

        for k in 1..@matricula.quantidade_de_faturas do
            if dia_v > Time.days_in_month( if((mes_atual + i)%12 != 0)
                                                (mes_atual + i)%12
                                            else
                                                1
                                            end)
                dia_v = Time.days_in_month(mes_atual)
            else
                dia_v = @matricula.dia_de_vencimento_das_faturas.to_i
            end
            vencimento_string = "#{dia_v}#{Date.today.next_month(i).strftime('/%m/%Y')}"
            vencimento = Date.parse(vencimento_string)
            @fatura = Fatura.create!(valor_da_fatura: valor, data_vencimento: vencimento, matricula_id:@matricula.id, status:'Aberta')
            i+=1
        end
    end
end