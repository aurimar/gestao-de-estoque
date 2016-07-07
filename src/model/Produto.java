package model;

public class Produto {
	
	private long id_produto;
    private String nome_produto;
    private String especial_produto;
    private int id_categoria;
    private double preco_produto;
    private int estoque_produto;

    public long getId_produto() {
        return id_produto;
    }

    public void setId_produto(long id_produto) {
        this.id_produto = id_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public String getEspecial_produto() {
        return especial_produto;
    }

    public void setEspecial_produto(String especial_produto) {
        this.especial_produto = especial_produto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public double getPreco_produto() {
        return preco_produto;
    }

    public void setPreco_produto(double preco_produto) {
        this.preco_produto = preco_produto;
    }

    public int getEstoque_produto() {
        return estoque_produto;
    }

    public void setEstoque_produto(int estoque_produto) {
        this.estoque_produto = estoque_produto;
    }

}
