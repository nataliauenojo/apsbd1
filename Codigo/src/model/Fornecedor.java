package model;

public class Fornecedor {

    private int cnpj;
    private String nome;
    private String telefone;
    private String endereco;

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getNome() {
        return nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }

    public int getCnpj() {
        return cnpj;
    }

}
