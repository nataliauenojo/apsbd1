package model;

public class Produto {

    private int id;
    private String nome;
    private int categoria;
    private double preco;
    private int quantidade;

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public int getCategoria() {
        return categoria;
    }

    public double getPreco() {
        return preco;
    }

    public int getQuantidade() {
        return quantidade;
    }
}
