// Get the category parameter from the URL
const urlParams = new URLSearchParams(window.location.search);
const categoria = urlParams.get('categoria');

// Create a new XMLHttpRequest object
const xhr = new XMLHttpRequest();

// Define the request URL
const url = "../db/JSON/Item.json";

// Open a new GET request
xhr.open('GET', url, true);

// Set up event listener for when the request is complete
xhr.onload = function () {
    // Check if the request was successful (status code 200)
    if (xhr.status === 200) {
        // Parse JSON response
        const data = JSON.parse(xhr.responseText);

        // Filter data based on the category
        const filteredData = data.filter(item => item.Categoria === categoria);

        // Set the category title dynamically
        const categoryTitle = document.getElementById('categoryTitle');
        categoryTitle.textContent = `Categoria: ${categoria}`;
        categoryTitle.setAttribute('class', 'headerSubtitulo'); // Add class attribute

        // Display the filtered data on the page
        displayProducts(filteredData);
    } else {
        console.error('Error fetching data. Status:', xhr.status);
    }
};

// Set up event listener for error handling
xhr.onerror = function () {
    console.error('Error fetching data.');
};

// Send the request
xhr.send();

function displayProducts(products) {
    const productListDiv = document.getElementById('productListContainer');

    if (products.length === 0) {
        productListDiv.innerHTML = '<p>No products found for this category.</p>';
        return;
    }

    // Create a table to display the products
    const table = document.createElement('table');
    table.setAttribute('class', 'tabla-centrada'); // Add class attribute
    table.setAttribute('border', '1'); // Add border attribute
    table.innerHTML = `
        <tr>
            <th>Item #</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Seleccionar</th>
            <th>Cantidad a Comprar</th>
        </tr>
    `;

    // Populate the table with product data
    products.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product['Item No']}</td>
            <td><a href="../internet/itemdet.html?item=${product['Item No']}">${product['Nombre']}</a></td>
            <td>${product['Precio']}</td>
            <td>${product['Disponible']}</td>
            <td><input type="checkbox"></td>
            <td><input type="number" value="1" min="1"></td>
        `;
        table.appendChild(row);
    });

    // Append the table to the product list div
    productListDiv.appendChild(table);
}
