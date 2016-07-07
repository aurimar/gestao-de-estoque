package model;

public class Item {
	
	 private long id_item;
	    private int id_compra;
	    private String nome_compra;
	    private int id_produto;
	    private String nome_produto;
	    private int quantidade_produto;

	    private float preco;
	    private float total;

	    public long getId_item() {
	        return id_item;
	    }

	    public void setId_item(long id_item) {
	        this.id_item = id_item;
	    }

	    public int getId_compra() {
	        return id_compra;
	    }

	    public void setId_compra(int id_compra) {
	        this.id_compra = id_compra;
	    }

	    public int getId_produto() {
	        return id_produto;
	    }

	    public void setId_produto(int id_produto) {
	        this.id_produto = id_produto;
	    }

	    public int getQuantidade_produto() {
	        return quantidade_produto;
	    }

	    public void setQuantidade_produto(int quantidade_produto) {
	        this.quantidade_produto = quantidade_produto;
	    }

	    public float getPreco() {
	        return preco;
	    }

	    public void setPreco(float preco) {
	        this.preco = preco;
	    }

	    public float getTotal() {
	        return total;
	    }

	    public void setTotal(float total) {
	        this.total = total;
	    }

	    public String getNome_compra() {
	        return nome_compra;
	    }

	    public void setNome_compra(String nome_compra) {
	        this.nome_compra = nome_compra;
	    }

	    public String getNome_produto() {
	        return nome_produto;
	    }

	    public void setNome_produto(String nome_produto) {
	        this.nome_produto = nome_produto;
	    }

}
