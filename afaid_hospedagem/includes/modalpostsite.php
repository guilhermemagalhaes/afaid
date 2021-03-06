<div class="ui modal" id="modalsite" >
  <i class="close icon"></i>
  <div class="ui centered header">Avaliar site</div>
  <div class="content">
    <form class="ui form segment" method="POST" enctype="multipart/form-data" action="php/addsite.php">
      <!-- nota -->
      <style type="text/css">
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        fieldset, label { margin: 0; padding: 0; }
        body{ margin: 20px; }
        h1 { font-size: 1.5em; margin: 10px; }

        /****** Style Star Rating Widget *****/

        .rating { 
          border: none;
          float: left;
          font-size: 50px;

        }

        .rating > input { display: none; } 
        .rating > label:before { 
          margin: 5px;
          font-size: 1.25em;
          font-family: FontAwesome;
          display: inline-block;
          content: "\f005";
        }

        .rating > .half:before { 
          content: "\f089";
          position: absolute;
        }

        .rating > label { 
          color: #ddd; 
          float: right; 
        }

        /***** CSS Magic to Highlight Stars on Hover *****/

        .rating > input:checked ~ label, /* show gold star when clicked */
        .rating:not(:checked) > label:hover, /* hover current star */
        .rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

        .rating > input:checked + label:hover, /* hover current star when changing rating */
        .rating > input:checked ~ label:hover,
        .rating > label:hover ~ input:checked ~ label, /* lighten current selection */
        .rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
      </style>
      <div class="field" style="height:120px;">
       <fieldset class="rating">
        <input type="radio" id="star5" name="nota" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
        <input type="radio" id="star4half" name="nota" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
        <input type="radio" id="star3half" name="nota" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
        <input type="radio" id="star3" name="nota" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
        <input type="radio" id="star2half" name="nota" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
        <input type="radio" id="star2" name="nota" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
        <input type="radio" id="star1half" name="nota" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
        <input type="radio" id="star1" name="nota" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
        <input type="radio" id="starhalf" name="nota" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
      </fieldset>
    </div>
    <div class="field">
      <div class="ui labeled input">
        <div  class="ui orange label" style="width: 90px; ">Imagem</div>
        <input type="file" name="imagem_avaliacao" >
      </div>
    </div>
    <!-- site -->
    <div class="field">
      <div class="ui labeled input">
        <div style="
        width: 90px;
        " class="ui orange label">Local</div>
        <div class="ui selection dropdown" style="
        width: 100%;
        ">
        <input type="hidden" name="url">
        <i class="dropdown icon"></i>
        <div class="default text">Selecione o local desejado</div>
        <div class="menu">
          <?php 
          $empresas=$objAval->buscasite();
          if (count($empresas)) {
           foreach ($empresas as $key => $list){
            echo ' <div class="item" data-value="'.$list['Nome'].'" data-text="'.$list['Nome'].'">
            '.$list['Nome'].'
          </div>';
          echo '<input type="hidden" name="site_id" value="'.$list['id'].'">';
        }
      }else{
        echo 'Nenhum site cadastrado';
      }
      ?> 
    </div>
  </div>
</div>
</div>
<!-- categoria -->
<div class="field">
  <div class="ui labeled input">
    <div class="ui orange label">Motivação</div>
    <div style="width: 100%;" class="ui selection dropdown">
      <input type="hidden" name="categoriaavl">
      <i class="dropdown icon"></i>
      <div class="default text">Selecione a motivação da avaliação</div>
      <div class="menu">
        <div class="item" data-value="Acessibilidade" data-text="Acessibilidade">
          Acessibilidade
        </div>
        <div class="item" data-value="atendimento" data-text="atendimento">
          Atendimento
        </div>
      </div>
    </div>
  </div>
</div>
<!-- descricao -->
<div class="field">
  <textarea rows="10" cols="10" name="descsite" placeholder="Relate o que aconteceu no site informado..."></textarea>
</div>
<!-- enviar -->
<input type="submit" class="ui positive button" value="Enviar">
</form>
</div>
</div>