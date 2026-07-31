import { gsap } from "gsap";

document.addEventListener("turbo:load", () => {
    const sidebar = document.getElementById("site-sidebar");
    if (!sidebar) return;

    const title = document.getElementById("page-title");
    if (title) {
        gsap.from(title, {
            opacity: 0,
            y: 30,
            duration: 0.7,
            ease: "power2.out",
        });
    }
    gsap.from(sidebar, {
        x: -40,
        opacity: 0,
        duration: 0.6,
        ease: "power2.out",
    });

    gsap.to(sidebar.querySelectorAll(".sidebar-item"), {
        opacity: 1,
        y: 0,
        duration: 0.5,
        stagger: 0.15,
        delay: 0.3,
        ease: "power2.out",
    });
});
