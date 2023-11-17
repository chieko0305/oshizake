// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/product";

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).ready(function(){

$("#drink_drink_image").change(function(){ // クリックするinputタグ 適宜
  var file = this.files[0]; //ファイル情報 編集不要
  var image = $("#js-item-image"); //プレビュ-を表示させたい要素　適宜

  var reader = new FileReader(); // ファイルオブジェクト
  reader.onload = function(event){
    image.attr("src", event.target.result);
  }

  reader.readAsDataURL(file);
});
$("#user_profile_image").change(function(){ // クリックするinputタグ 適宜
  var file = this.files[0]; //ファイル情報 編集不要
  var image = $("#js-profile-image"); //プレビュ-を表示させたい要素　適宜

  var reader = new FileReader(); // ファイルオブジェクト
  reader.onload = function(event){
    image.attr("src", event.target.result);
  }

  reader.readAsDataURL(file);
});
});

// /drinksランキング
$(document).on("turbolinks:load", function() {
  $('.slider').slick({
    autoplay: true,//自動的に動き出すか
    autoplaySpeed: 3000,//次のスライドに切り替わる待ち時間
    speed: 1500,//スライドの動きのスピード
    infinite: true,//スライドをループさせるか
    slidesToShow: 1,//スライドを画面に3枚見せる
    slidesToScroll: 1,//1回のスクロールで3枚の写真を移動して見せる
    arrows: false,//画像移動用の矢印の表示
    dots: true,//下部ドットナビゲーションの表示
  });
});



