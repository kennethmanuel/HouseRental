const harga = parseInt(document.getElementsByTagName("input")[3].getAttribute("value"));
console.log(harga);
const book = document.querySelectorAll(".available");
const totalprice = document.getElementsByClassName("total-price");
let jumlahTerpilih = [];
let totalHarga;
for (let index = 0; index < book.length; index++) {
  book[index].addEventListener("click", function () {
    if (
      book[index].getAttribute("class") == "available bg-success cursor-pointer" ||
      book[index].getAttribute("class") == "available cursor-pointer bg-success" ||
      book[index].getAttribute("class") == "available bg-primary cursor-pointer"
    ) {
      const ul = document.querySelector("ul.list-group");
      const liBaru = document.createElement("li");
      const teksLiBaru = document.createTextNode(book[index].getAttribute("date"));
      const inputBaru = document.createElement("input");
      inputBaru.setAttribute("type", "hidden");
      inputBaru.setAttribute("name", "date[]");
      inputBaru.setAttribute("value", book[index].getAttribute("date"));
      inputBaru.setAttribute("class", "inputan");
      liBaru.setAttribute("class", "list-group-item");
      liBaru.appendChild(teksLiBaru);
      ul.appendChild(liBaru);
      ul.appendChild(inputBaru);
    } else if (book[index].getAttribute("class") == "available cursor-pointer bg-warning" || book[index].getAttribute("class") == "available bg-primary cursor-pointer bg-warning bg-success") {
      const ul = document.querySelector("ul.list-group");
      const li = document.getElementsByClassName("list-group-item");
      console.log(li);
      const inputLama = document.getElementsByClassName("inputan");
      console.log(inputLama);
      for (let i = 0; i < inputLama.length; i++) {
        if (inputLama[i].getAttribute("value") == book[index].getAttribute("date")) {
          ul.removeChild(li[i]);
          console.log(li[i]);
          ul.removeChild(inputLama[i]);
        }
      }
    }
    book[index].classList.toggle("bg-warning");
    book[index].classList.toggle("bg-success");
    jumlahTerpilih = document.querySelectorAll("td.bg-warning");
    totalHarga = harga * jumlahTerpilih.length;

    if (totalHarga != null) {
      for (let i = 0; i < totalprice.length; i++) {
        totalprice[i].innerHTML = totalHarga;
      }
    }
  });
}

const reset = document.getElementById("btnreset");

reset.addEventListener("click", function () {
  const choosen = document.querySelectorAll(".bg-warning");
  for (let i = 0; i < choosen.length; i++) {
    choosen[i].classList.add("bg-success");
    choosen[i].classList.remove("bg-warning");
    totalprice.innerHTML = "0";
  }
});
