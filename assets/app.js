import "./stimulus_bootstrap.js";
import "./theme-toggle.js";
import "./sidebar-animation.js";
import "./styles/app.css";

console.log("This log comes from assets/app.js - welcome to AssetMapper! 🎉");

document.addEventListener("click", function (event) {
    const button = event.target.closest('[data-action="like"]');
    if (!button) return;

    event.preventDefault();

    fetch(button.href)
        .then((response) => response.json())
        .then((data) => {
            const likeText = button.dataset.likeText;
            button.querySelector(".like-count").textContent =
                data.nbLike + " " + likeText;
            button
                .querySelector(".like-icon-outline")
                .classList.toggle("d-none", data.liked);
            button
                .querySelector(".like-icon-solid")
                .classList.toggle("d-none", !data.liked);
        });
});
