package com.fernanda.entidade;

public class Livro {
	private long id;
	private String titulo;
	private String autor;
	private int paginas;
	private String editora;
	private String genero;

	public Livro() {}
	
	public Livro(long id, String titulo, String autor, int paginas, String editora, String genero) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.autor = autor;
		this.paginas = paginas;
		this.editora = editora;
		this.genero = genero;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public long getId() {
		return id;
	}

	public int getPaginas() {
		return paginas;
	}

	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}

	public String getEditora() {
		return editora;
	}

	public void setEditora(String editora) {
		this.editora = editora;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public void setId(long id) {
		this.id = id;
	}

}
