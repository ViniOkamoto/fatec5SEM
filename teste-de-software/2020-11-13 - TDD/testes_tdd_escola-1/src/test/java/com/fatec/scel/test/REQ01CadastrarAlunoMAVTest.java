package com.fatec.scel.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.hamcrest.Matchers;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.result.ViewResultMatchers;

import com.fatec.scel.model.Aluno;

@SpringBootTest
public class REQ01CadastrarAlunoMAVTest {

	@Autowired
	MockMvc mockMvc;

	@Test
	public void ct01_quando_seleciona_cadastrar_aluno_retorna_http_200() throws Exception {
		ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.get("/alunos/cadastrar"));
		resultActions.andExpect(MockMvcResultMatchers.status().isOk());
	}

	@Test
	public void ct02_quando_seleciona_cadastrar_retorna_view() throws Exception {
		ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.get("/alunos/cadastrar"));
		ViewResultMatchers view = MockMvcResultMatchers.view();
		resultActions.andExpect(view.name(Matchers.is("cadastrarAluno")));
	}

	@Test
	public void ct03_quando_nome_branco_retorna_size() throws Exception {

		mockMvc.perform(post("/alunos/save")
				.param("id", "11")
				.param("ra", "XXXXX")
				.param("nome", "Janio")
				.param("email", "Janio")
				.param("cep", "07662555")
				.param("endereco", "Rua da Secura, 569")
		)
				.andExpect(MockMvcResultMatchers.status().is(200))
				.andExpect(MockMvcResultMatchers.view().name("cadastrarAluno"))
				.andExpect(MockMvcResultMatchers.model().attribute("aluno", Matchers.any(Aluno.class)))
				.andExpect(MockMvcResultMatchers.model().attributeHasFieldErrors("aluno", "nome"))
				.andExpect(MockMvcResultMatchers.model().attributeHasFieldErrorCode("aluno", "nome", "Size"));
	}

}
