
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


    var card;

    if (idAquario == 1) {
        temp_aquario_1.innerHTML = `<span id="tempHectare1" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_1.innerHTML = `<span id="umiHectare1" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_1
    } else if (idAquario == 2) {
        temp_aquario_2.innerHTML =  `<span id="tempHectare2" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_2.innerHTML = `<span id="umiHectare2" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_2
    } else if (idAquario == 3) {
        temp_aquario_3.innerHTML =  `<span id="tempHectare3" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_3.innerHTML = `<span id="umiHectare3" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_3
    } else if (idAquario == 4) {
        temp_aquario_4.innerHTML =  `<span id="tempHectare4" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/dew_point_Card.png" class="tempLogo"></span>` + temperatura + `°C <br>`;
        umid_aquario_4.innerHTML = `<span id="umiHectare4" style="height:40px; width: 40px; background-color:gray; display:inline-block; border-radius:40px; margin-right: 20px"></span><span><img src="../src/images/images_card/humidity_high_Card.png" class="tempLogo"></span>` + umidade + `% <br>`;
        card = card_4
    }
    

    var classe_temperatura = 'cor-alerta';

    if (temperatura >= 30 ) {
        classe_temperatura = 'cor-alerta extremo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta extremo'
        if(idAquario == 1){
            tempHectare1.style.backgroundColor = "#F81A42";
        }else if(idAquario == 2){
            tempHectare2.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 3){
            tempHectare3.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 4){
            tempHectare4.style.backgroundColor = "#F81A42";
        }
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 1")
        console.log(grauDeAviso)
    }
    else if (temperatura < 30 && temperatura >= 27) {
        classe_temperatura = 'cor-alerta alto';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta alto'
        if(idAquario == 1){
            tempHectare1.style.backgroundColor = "#FFAC2F";
        }else if(idAquario == 2){
            tempHectare2.style.backgroundColor = "#FFAC2F";
        }
        else if(idAquario == 3){
            tempHectare3.style.backgroundColor = "#FFAC2F";
        }
        else if(idAquario == 4){
            tempHectare4.style.backgroundColor = "#FFAC2F";
        }
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 2")
    }
    else if (temperatura < 27 && temperatura > 23) {
        classe_temperatura = 'cor-alerta ideal';
        
        if(idAquario == 1){
            tempHectare1.style.backgroundColor = "#4DC13A";
        }else if(idAquario == 2){
            tempHectare2.style.backgroundColor = "#4DC13A";
        }
        else if(idAquario == 3){
            tempHectare3.style.backgroundColor = "#4DC13A";
        }
        else if(idAquario == 4){
            tempHectare4.style.backgroundColor = "#4DC13A";
        }
        console.log("caiu no 3")
    }
    else if (temperatura <= 23 && temperatura > 20) {
        classe_temperatura = 'cor-alerta baixo';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta baixo'
        if(idAquario == 1){
            tempHectare1.style.backgroundColor = "#FFAC2F";
        }else if(idAquario == 2){
            tempHectare2.style.backgroundColor = "#FFAC2F";
        }
        else if(idAquario == 3){
            tempHectare3.style.backgroundColor = "#FFAC2F";
        }
        else if(idAquario == 4){
            tempHectare4.style.backgroundColor = "#FFAC2F";
        }
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 4")
    }
    else if (temperatura <= 20) {
        classe_temperatura = 'cor-alerta muito_baixo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta muito_baixo'
        if(idAquario == 1){
            tempHectare1.style.backgroundColor = "#F81A42";
        }else if(idAquario == 2){
            tempHectare2.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 3){
            tempHectare3.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 4){
            tempHectare4.style.backgroundColor = "#F81A42";
        }
        exibirMensagem(temperatura, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no 5")
    }

    
    // umidade

    if (umidade >= limitesUmidade.extremo) {
        classe_temperatura = 'cor-alerta extremo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta extremo'
        if(idAquario == 1){
            umiHectare1.style.backgroundColor = "#F81A42";
        }else if(idAquario == 2){
            umiHectare2.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 3){
            umiHectare3.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 4){
            umiHectare4.style.backgroundColor = "#F81A42";
        }
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 1")
        console.log(grauDeAviso)
    }
    else if (umidade < limitesUmidade.extremo && umidade >= limitesUmidade.alto) {
        classe_temperatura = 'cor-alerta alto';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta alto'
        if(idAquario == 1){
            umiHectare1.style.backgroundColor = "#ffac2f";
        }else if(idAquario == 2){
            umiHectare2.style.backgroundColor = "#ffac2f";
        }
        else if(idAquario == 3){
            umiHectare3.style.backgroundColor = "#ffac2f";
        }
        else if(idAquario == 4){
            umiHectare4.style.backgroundColor = "#ffac2f";
        }
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 2")
    }
    else if (umidade < limitesUmidade.alto && umidade > limitesUmidade.baixo) {
        classe_temperatura = 'cor-alerta ideal';
        if(idAquario == 1){
            umiHectare1.style.backgroundColor = "#4dc13a";
        }else if(idAquario == 2){
            umiHectare2.style.backgroundColor = "#4dc13a";
        }
        else if(idAquario == 3){
            umiHectare3.style.backgroundColor = "#4dc13a";
        }
        else if(idAquario == 4){
            umiHectare4.style.backgroundColor = "#4dc13a";
        }
        console.log("caiu no umidade ideal")
    }
    else if (umidade <= limitesUmidade.baixo && umidade > limitesUmidade.muito_baixo) {
        classe_temperatura = 'cor-alerta baixo';
        grauDeAviso = 'alerta'
        grauDeAvisoCor = 'cor-alerta baixo'
        if(idAquario == 1){
            umiHectare1.style.backgroundColor = "#ffac2f";
        }else if(idAquario == 2){
            umiHectare2.style.backgroundColor = "#ffac2f";
        }
        else if(idAquario == 3){
            umiHectare3.style.backgroundColor = "#ffac2f";
        }
        else if(idAquario == 4){
            umiHectare4.style.backgroundColor = "#ffac2f";
        }
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 4")
    }
    else if (umidade <= limitesUmidade.muito_baixo) {
        classe_temperatura = 'cor-alerta muito_baixo';
        grauDeAviso = 'perigo'
        grauDeAvisoCor = 'cor-alerta muito_baixo'
        if(idAquario == 1){
            umiHectare1.style.backgroundColor = "#F81A42";
        }else if(idAquario == 2){
            umiHectare2.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 3){
            umiHectare3.style.backgroundColor = "#F81A42";
        }
        else if(idAquario == 4){
            umiHectare4.style.backgroundColor = "#F81A42";
        }
        exibirMensagemUmidade(umidade, idAquario, grauDeAviso, grauDeAvisoCor)
        console.log("caiu no umidade 5")
    }

    // cards

    

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

function limparAlertas(){
    alerta.innerHTML =''
}

setInterval(limparAlertas, 5000);