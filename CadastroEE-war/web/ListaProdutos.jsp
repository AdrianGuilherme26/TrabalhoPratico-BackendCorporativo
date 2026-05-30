<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Sistema CadastroEE - Lista</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6;
        color: #333;
        margin: 40px;
    }
    h1 {
        color: #2c3e50;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
        margin-top: 20px;
    }
    th {
        background-color: #3498db;
        color: white;
        padding: 15px;
        text-align: left;
        text-transform: uppercase;
        font-size: 14px;
    }
    td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
    }
    tr:hover {
        background-color: #f1f1f1;
        transition: background-color 0.3s ease;
    }
    .btn-novo {
        display: inline-block;
        background-color: #27ae60;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        margin-top: 20px;
    }
    .btn-novo:hover { background-color: #219150; }
    
    .acao-link {
        text-decoration: none;
        font-weight: bold;
        padding: 5px 10px;
        border-radius: 4px;
    }
    .alterar { color: #3498db; }
    .excluir { color: #e74c3c; }
</style>
    </head>
<body class="container">
    <h1 class="my-4">Lista de Produtos Cadastrados</h1>
    
    <table class="table table-striped table-hover shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Preço de Venda</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${produtos}">
                <tr>
                    <td>${p.id}</td> 
                    <td>${p.nome}</td>
                    <td>R$ ${p.precoVenda}</td>
                    <td>
                        <a href="ServletProduto?acao=formAlterar&id=${p.id}" class="btn btn-primary btn-sm">Alterar</a>
                        <a href="ServletProduto?acao=excluir&id=${p.id}" class="btn btn-danger btn-sm" onclick="return confirm('Excluir?')">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="ServletProduto?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a> 
    <br>
    <a href="index.html" class="ms-2">Voltar para Início</a>
</body>
</html>