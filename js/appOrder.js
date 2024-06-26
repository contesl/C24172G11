document.addEventListener('DOMContentLoaded', function () {
    // Get parameters from query string
    const params = new URLSearchParams(window.location.search);

    // Get arrays of values for each parameter
    const itemNos = params.getAll('itemNo');
    const nombres = params.getAll('nombre');
    const precios = params.getAll('precio').map(parseFloat);
    const cantidades = params.getAll('cantidad').map(parseFloat);

    // Create a table body to hold the rows
    const productListDiv = document.getElementById('productListContainer');
    if (itemNos.length === 0) {
        productListDiv.innerHTML = '<p>Sin productos para procesar.</p>';
        return;
    }
    // Create a table to display the products
    const table = document.createElement('div');
    table.setAttribute('class', 'rTable'); // Add class attribute
    table.setAttribute('border', '1'); // Add border attribute
    table.innerHTML = `
        <div class="rTableRow">
        <div class="rTableHead"><strong>Item #</strong></div>
        <div class="rTableHead"><strong>Nombre</strong></div>
        <div class="rTableHead"><strong>Precio</strong></div>
        <div class="rTableHead"><strong>Cantidad a Comprar</strong></div>
        <div class="rTableHead"><strong>Total</strong></div>
        </div>
    `;

    // Iterate over each item and create a row for it
    for (let i = 0; i < itemNos.length; i++) {
        const itemNo = itemNos[i];
        const nombre = nombres[i];
        const precio = precios[i];
        const cantidad = cantidades[i];
        const total = precio * cantidad;
        // Create a new table row
        const newRow = document.createElement('div');
        newRow.setAttribute('class', 'rTableRow'); // Add class attribute
        newRow.innerHTML = `
            <div class="rTableCell">${itemNo}</div>
            <div class="rTableCell">${nombre}</div>
            <div class="rTableCell">$${precio.toFixed(2)}</div>
            <div class="rTableCell">${cantidad}</div>
            <div class="rTableCell">$${total.toFixed(2)}</div>
        `;
        // Append the new row to the table body
        table.appendChild(newRow);
    }
    // Append the table to the product list div
    productListDiv.appendChild(table);

      // Calculate the total amount
    const totalAmount = precios.reduce((acc, curr, index) => acc + curr * cantidades[index], 0);

    // Update the total amount display
    const totalElement = document.getElementById('totalAmount');
    totalElement.textContent = `$${totalAmount.toFixed(2)}`;
});
