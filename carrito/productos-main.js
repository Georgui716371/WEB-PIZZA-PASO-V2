//se captura todo el dom de los cards para heredar los eventos
'use strict';

/* A variable declaration. */
var myModal = document.getElementById("myModal");
var myInput = document.getElementById("myInput");
const cards = document.getElementById("cards");
const items = document.getElementById("items");
const footer = document.getElementById("footer");
const templateCard = document.getElementById("template-card").content;
const templateCarrito = document.getElementById("template-carrito").content;
const templateFooter = document.getElementById("template-footer").content;
const fragment = document.createDocumentFragment();
 const process = document.querySelector(".modal-footer .btn-warning");
let id_loading=document.getElementById('div-loagind');

var JsonConvertible='';

let carrito = {};
let carritoCopia=[];
document.addEventListener("DOMContentLoaded", () => {
  fetchData();

});
if (typeof window !== "undefined") {
  console.log("Estamos ejecutando en el cliente");
} else {
  console.log("Estamos ejecutando en el server");
}
cards.addEventListener("click", (e) => {
  addCarrito(e);
});
items.addEventListener("click", (e) => {
  btnAccion(e);
});

const fetchData = async () => {
  try {
    const res = await fetch("api.json");
    const data = await res.json();
    pintarCards(data);
  } catch (error) {
    console.console.log(error);
  }
};
const pintarCards = (data) => {
  data.forEach((producto) => {
    templateCard.querySelector("h5").textContent = producto.title;
    templateCard.querySelector("span").textContent = producto.precio;
    templateCard.querySelector("img").setAttribute("src", producto.thumbnailUrl);
    templateCard.querySelector(".btn-outline-warning").dataset.id = producto.id;
    const clone = templateCard.cloneNode(true);
    fragment.appendChild(clone);
  });
  cards.appendChild(fragment);
};
 
const addCarrito = (e) => {
  //capturando los elementos del div

  //capturanado con la clase del boton
  
  if (e.target.classList.contains("btn-outline-warning")) {
    // agregar la informacion al carrito
   //  e.target.classList.contains("btn-outline-warning").textContent="Hola"
    setCarrito(e.target.parentElement);
    e.target.textContent="EN CARRITO";
   
  }
  console.log(carrito);
  e.stopPropagation();
  localStorage.setItem("carrito", JSON.stringify(carrito));
};
const setCarrito = (objeto) => {
  const producto = {
    id: objeto.querySelector(".btn-outline-warning").dataset.id,
    title: objeto.querySelector("h5").textContent,
    precio: objeto.querySelector("span").textContent,
    cantidad: 1,
  };
  if (carrito.hasOwnProperty(producto.id)) {
    producto.cantidad = carrito[producto.id].cantidad + 1;
  }
  carrito[producto.id] = { ...producto };
  
  pintarCarrito();
};
const pintarCarrito = () => {
  items.innerHTML = "";
  Object.values(carrito).forEach((producto) => {
    templateCarrito.querySelector("th").textContent = producto.id;
    templateCarrito.querySelectorAll("td")[0].textContent = producto.title;
    templateCarrito.querySelectorAll("td")[1].textContent = producto.cantidad;
    templateCarrito.querySelector(".btn-info").dataset.id = producto.id;
    templateCarrito.querySelector(".btn-danger").dataset.id = producto.id;
    templateCarrito.querySelector("span").textContent =
    producto.cantidad * producto.precio;
    const clone = templateCarrito.cloneNode(true);
    fragment.appendChild(clone);
  });
  console.log("este es el carrito");
  items.appendChild(fragment);
  pintarFooter();
};
const pintarFooter = () => {
  footer.innerHTML = "";
  if (Object.keys(carrito).length === 0) {
    footer.innerHTML = `<th scope="row" colspan="5">Carrito vacío - comience a comprar!</th>`;
    return;
  } 
  const ncantidad = Object.values(carrito).reduce(
    (acc, { cantidad }) => acc + cantidad,
    0
  );
  const nPrecio = Object.values(carrito).reduce(
    (acc, { cantidad, precio }) => acc + cantidad * precio,
    0
  );
  templateFooter.querySelectorAll("td")[0].textContent = ncantidad;
  templateFooter.querySelector("span").textContent = nPrecio;
  const clone = templateFooter.cloneNode(true);
  fragment.appendChild(clone);
  footer.appendChild(fragment);
  const btnVaciar = document.getElementById("vaciar-carrito");
  btnVaciar.addEventListener("click", () => {
    carrito = {};
    pintarCarrito();
  });
};
const btnAccion = (e) => {
  if (e.target.classList.contains("btn-info")) {
    const producto = carrito[e.target.dataset.id];
    producto.cantidad++;
    carrito[e.target.dataset.id] = { ...producto };
    pintarCarrito();
  }
  if (e.target.classList.contains("btn-danger")) {
    const producto = carrito[e.target.dataset.id];
    producto.cantidad--;
    if (producto.cantidad === 0) {
      let variable=e.target.dataset.id-1;
      console.log('------------------');
      console.log (variable);
      console.log('------------------');
      delete carrito[e.target.dataset.id];
      cards.querySelectorAll('.btn-outline-warning')[variable].textContent="COMPRAR PRODUCTO";
    }
    pintarCarrito();
  }
  e.stopPropagation();
};

//------------------------------------------------------------------

// Petición al servidor ->  http 

// codigo de estado http
const READY_STATE_COMPLETE =4, STATUS_OK=200;
const btn=document.getElementById('procesarCompra');
var myNavigator = () => {
	let nav = (window.XMLHttpRequest) ? new XMLHttpRequest() :  new ActiveXObject('Microsft.XMLHTTP');
	return nav;
}

//          función,ruta de petición,dato que se enviara al servidor 
var setRequest = (callback, route, carrito) => {
	var req = myNavigator();
	carrito = JSON.stringify(carrito);
	req.onreadystatechange = callback;
  // se envia por el metodo post  y crea conexión 
	req.open('POST', route, true);
	req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	req.send('data=' + carrito);
}
process.addEventListener('click', () => {
  id_loading.innerHTML='<div class="spinner-border text-warning" role="status"></div>';
	let route = 'productos-main.php';
	setRequest(function(){
		if (this.readyState == READY_STATE_COMPLETE) {
			if (this.status == STATUS_OK) {
				/*Respuesta sin parsear*/
        console.log("RESPUESTA  SIN PARSEAR -");
				console.log(this.responseText);
			}else{
				console.log(this.status);
			}
		}
	}, route, carrito);
   const loadin_efecto=()=>{
    alert('su compra se realizo ');
    window.location='../index.php';
   }
   setTimeout( loadin_efecto,4000); 
});

