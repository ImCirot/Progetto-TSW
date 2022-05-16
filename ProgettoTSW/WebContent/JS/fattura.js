/*window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'fattura.pdf',
                image: { type: 'pdf', quality: 1 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}*/



var button = document.getElementById("download");
button.addEventListener("click", function () {
    var doc = new jsPDF("p", "mm", [300, 300]);
    var makePDF = document.querySelector("#invoice");

    // fromHTML Method
    doc.fromHTML(makePDF);
    doc.save("output.pdf");
});
