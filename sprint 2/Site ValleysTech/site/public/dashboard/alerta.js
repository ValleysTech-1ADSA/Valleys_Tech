function alertar(temperatura, umidade, idAquario) {
    var grauDeAviso =''

    var limitesTemperatura = {
        extremo: 30,
        alto: 27,
        ideal: 25,
        baixo: 23,
        muito_baixo: 20
    };
    var limitesUmidade = {
        extremo: 80,
        alto: 73,
        ideal: 65,
        baixo: 57,
        muito_baixo: 50
    };
    

    var classe_temperatura = 'cor-alerta';

    if (temperatura >= limitesTemperatura.extremo) {
        classe_temperatura = 'cor-alerta extremo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta extremo'
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 1")
        console.log(grauDeAviso)
    }
    else if (temperatura < limitesTemperatura.extremo && temperatura >= limitesTemperatura.alto) {
        classe_temperatura = 'cor-alerta alto';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta alto'
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 2")
    }
    else if (temperatura < limitesTemperatura.alto && temperatura > limitesTemperatura.baixo) {
        classe_temperatura = 'cor-alerta ideal';
        alerta.innerHTML = ''
        console.log("caiu no 3")
    }
    else if (temperatura <= limitesTemperatura.baixo && temperatura > limitesTemperatura.muito_baixo) {
        classe_temperatura = 'cor-alerta baixo';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta baixo'
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 4")
    }
    else if (temperatura <= limitesTemperatura.muito_baixo) {
        classe_temperatura = 'cor-alerta muito_baixo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta muito_baixo'
        exibirMensagemUmidade(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 5")
    }

    
    // umidade

    if (umidade >= limitesUmidade.extremo) {
        classe_temperatura = 'cor-alerta extremo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta extremo'
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 1")
        console.log(grauDeAviso)
    }
    else if (umidade < limitesUmidade.extremo && umidade >= limitesUmidade.alto) {
        classe_temperatura = 'cor-alerta alto';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta alto'
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 2")
    }
    else if (umidade < limitesUmidade.alto && umidade > limitesUmidade.baixo) {
        classe_temperatura = 'cor-alerta ideal';
        alerta.innerHTML = ''
        console.log("caiu no umidade 3")
    }
    else if (umidade <= limitesUmidade.baixo && umidade > limitesUmidade.muito_baixo) {
        classe_temperatura = 'cor-alerta baixo';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta baixo'
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 4")
    }
    else if (umidade <= limitesUmidade.muito_baixo) {
        classe_temperatura = 'cor-alerta muito_baixo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta muito_baixo'
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 5")
    }

    // cards

    var card;

    if (idAquario == 1) {
        temp_aquario_1.innerHTML = `<span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_1.innerHTML = `<span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_1
    } else if (idAquario == 2) {
        temp_aquario_2.innerHTML =  `<span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_2.innerHTML = `<span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_2
    } else if (idAquario == 3) {
        temp_aquario_3.innerHTML =  `<span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_3.innerHTML = `<span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_3
    } else if (idAquario == 4) {
        temp_aquario_4.innerHTML =  `<span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_4.innerHTML = `<span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_4
    }

    // alterando
    card.className = classe_temperatura;
}

function exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor) {
    var mensagem = `<div class="mensagem-alarme">
    <div class="informacao">
    <div class="${grauDeAvisoCor}">&#12644;</div> 
     <h3>Hectar ${idAquario} está em estado de ${grauDeAviso}!</h3>
    <p style = "text-align: center;">Temperatura ${temperatura}.</p>   
    </div>
    `;

    
// Dentro da div com classe grauDeAvisoCor há um caractere "invisível", 
// que pode ser inserido clicando com o seu teclado em alt+255 ou pelo código adicionado acima.
    alerta.innerHTML += mensagem
}


function exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor) {
    var mensagem = `<div class="mensagem-alarme">
    <div class="informacao">
    <div class="${grauDeAvisoCor}">&#12644;</div> 
     <h3>Hectar ${idAquario} está em estado de ${grauDeAviso}!</h3>
    <p style = "text-align: center;">Umidade ${umidade}.</p>   
    </div>
    `;

    
// Dentro da div com classe grauDeAvisoCor há um caractere "invisível", 
// que pode ser inserido clicando com o seu teclado em alt+255 ou pelo código adicionado acima.
    alerta.innerHTML += mensagem
}

