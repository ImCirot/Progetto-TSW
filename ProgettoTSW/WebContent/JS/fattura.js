window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'myfile.pdf',
<<<<<<< HEAD
                image: { type: 'pdf', quality: 1 },
=======
                image: { type: 'jpeg', quality: 0.98 },
>>>>>>> branch 'main' of https://github.com/ImCirot/Progetto-TSW.git
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}