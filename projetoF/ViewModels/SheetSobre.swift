//
//  SheetSobre.swift
//  projetoF
//
//  Created by Pablo on 30/10/23.
//

import SwiftUI

struct SheetSobre: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(){
            Text("E aí, meu fi!\nVou te contar um pouco sobre a cidade de Mossoró, que é conhecida como a Capital do Oeste e Cidade do Sal e do Petróleo.\nA cidade é tão quente que você pode fritar um ovo no asfalto! Mas não se preocupe, o povo de Mossoró é tão acolhedor que você vai se sentir em casa rapidinho. Mossoró é a maior cidade do estado do Rio Grande do Norte e fica a quatro horas de carro da capital, Natal. A cidade é famosa por sua produção de sal e petróleo. Além disso, Mossoró é a maior produtora de petróleo terrestre do Brasil. A cidade tem uma história rica e interessante. Em 1927, Mossoró foi atacada pelo famoso cangaceiro Lampião e sua gangue. Mas o povo de Mossoró não deixou barato e expulsou Lampião da cidade. Em 1888, cinco anos antes da Lei Áurea abolir a escravidão no Brasil, Mossoró já havia libertado seus escravos. E em 1928, Mossoró foi a primeira cidade do Brasil a permitir que as mulheres votassem.")
                .padding()
        }
    }
}
struct SheetSobre_Previews: PreviewProvider {
    static var previews: some View {
        SheetSobre()
    }
}
