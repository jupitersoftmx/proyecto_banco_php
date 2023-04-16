<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagos - Tienda Online</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><img src="https://lh3.googleusercontent.com/jsIKARooFj7lk7ujPEf-XoSwxMOBMHVCEANznq0KWuRaDYkExEsEUJ5n-0Niv074v-xUjqmYMhLEmf8KXJk-XpGWtUGl7bLT_7Uf1Xyinw" alt="Logo"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Productos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contacto</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            Nueva Transacción
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Historial de Transacciones
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="h2">Realizar Pago</h1>
            </div>

            <form id="payment-form" class="mt-5">
                <div class="form-group">
                    <label for="nombre">Nombre completo:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>
                <div class="form-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="pass">Contraseña:</label>
                    <input type="password" class="form-control" id="pass" name="pass">
                </div>
                <div class="form-group">
                    <label for="direccion_entrega">Dirección de entrega:</label>
                    <input type="text" class="form-control" id="direccion_entrega" name="direccion_entrega">
                </div>
                <div class="form-group">
                    <label for="total_carrito">Total del carrito:</label>
                    <input type="number" class="form-control" id="total_carrito" name="total_carrito">
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Método de pago:</label>
                    <select class="form-control" id="paymentMethod" name="paymentMethod">
                        <option value="paypal">PayPal</option>
                        <option value="sucursal">Sucursal a Sucursal</option>
                        <option value="tarjeta">Tarjeta de crédito</option>
                    </select>
                </div>
                <input type="hidden" name="estado" value="activo">
                <button type="submit" class="btn btn-primary">Realizar Pago</button>
            </form>

            <div class="modal" tabindex="-1" role="dialog" id="response-modal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Estado de la transacción</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="response-message"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script>
    $('#payment-form').on('submit', function (e) {
        e.preventDefault();

        $.ajax({
            url: 'http://localhost:12346/peticion.php',
            method: 'POST',
            data: $(this).serialize(),
            success: function (response) {
                var paymentMethod = $('#paymentMethod').val();
                var message = '';

                if (response.status === 'success') {
                    message = response.message + '\nMétodo de pago: ' + paymentMethod + '\nDatos de la transacción: ' + JSON.stringify(response);
                    $('#response-message').text(message);
                    $('#response-modal').modal('show');
                } else {
                    message = response.message + ' ' + response.error;
                    $('#response-message').text(message);
                    $('#response-modal').modal('show');
                }
            },
            error: function (xhr, status, error) {
                $('#response-message').text('Hubo un error al realizar la petición: ' + error);
                $('#response-modal').modal('show');
            }
        });
    });

    $('#response-modal').on('hidden.bs.modal', function () {
        $('#payment-form')[0].reset();
        $('#response-message').text('');
    });



</script>

</body>
</html>
