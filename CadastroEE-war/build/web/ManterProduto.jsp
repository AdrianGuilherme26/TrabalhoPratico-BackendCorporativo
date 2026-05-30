<%-- 
    Document   : ManterProduto
    Created on : 14 de jan. de 2026, 17:48:00
    Author     : erica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manter Produto</title>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
<body class="container">
    <h1 class="my-4">Dados do Produto</h1>
    
    <form action="ServletProduto" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="acao" value="${produto == null ? 'incluir' : 'alterar'}">
        <input type="hidden" name="id" value="${produto.id}">

        <div class="mb-3">
            <label class="form-label">Nome do Produto</label>
            <input type="text" name="nome" class="form-control" value="${p.nome}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Quantidade</label>
            <input type="number" name="quantidade" class="form-control" value="${p.quantidade}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Preço de Venda</label>
            <input type="text" name="precoVenda" class="form-control" value="${p.precoVenda}" required>
        </div>
        
        <div class="mt-4">
            <button type="submit" class="btn btn-primary">Salvar Produto</button>
            <a href="ServletProduto?acao=listar" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</body>
</html>