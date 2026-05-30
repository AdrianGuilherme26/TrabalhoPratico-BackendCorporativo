package cadastroee.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ejb.EJB;
import java.util.List;
import cadastroee.model.Produto;
import cadastroee.controller.ProdutoFacade;

@WebServlet(name = "ServletProduto", urlPatterns = {"/ServletProduto"})
public class ServletProduto extends HttpServlet {

    // Injeção do EJB para acesso aos dados
    @EJB
    private ProdutoFacade facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        if (acao == null) {
            acao = "listar";
        }

        if (acao.equals("listar")) {
            List<Produto> listaProdutos = facade.findAll();
            request.setAttribute("produtos", listaProdutos);
            request.getRequestDispatcher("ListaProdutos.jsp").forward(request, response);

        } else if (acao.equals("formIncluir")) {
            // Apenas abre o formulário vazio
            request.getRequestDispatcher("ManterProduto.jsp").forward(request, response);

        } else if (acao.equals("incluir")) {
            // Cria o objeto produto com os dados do formulário
            Produto p = new Produto();
            p.setNome(request.getParameter("nome"));
            p.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            p.setPrecoVenda(Double.parseDouble(request.getParameter("precoVenda")));

            // Manda o EJB salvar no banco!
            facade.create(p);

            // Após salvar, volta para a lista atualizada
            response.sendRedirect("ServletProduto?acao=listar");

        } else if (acao.equals("excluir")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Produto p = facade.find(id);
            facade.remove(p); // Remove do banco
            response.sendRedirect("ServletProduto?acao=listar");

        } else if (acao.equals("formAlterar")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Produto p = facade.find(id);
            request.setAttribute("produto", p); // Passa o produto achado para o form
            request.getRequestDispatcher("ManterProduto.jsp").forward(request, response);

        } else if (acao.equals("alterar")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Produto p = facade.find(id);
            p.setNome(request.getParameter("nome"));
            p.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            p.setPrecoVenda(Double.parseDouble(request.getParameter("precoVenda")));
            facade.edit(p); // Atualiza no banco
            response.sendRedirect("ServletProduto?acao=listar");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}