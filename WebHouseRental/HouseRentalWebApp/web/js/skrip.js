const book = document.querySelectorAll(".available");

for (let index = 0; index < book.length; index++) {
  book[index].addEventListener("click", function () {
    book[index].classList.toggle("bg-warning");
    book[index].classList.toggle("bg-success");
  });
}

const reset = document.getElementById("btnreset");

reset.addEventListener("click", function () {
  const choosen = document.querySelectorAll(".bg-warning");
  for (let i = 0; i < choosen.length; i++) {
    choosen[i].classList.add("bg-success");
    choosen[i].classList.remove("bg-warning");
  }
});
