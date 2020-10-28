package cep.fatec.teste;

import static org.junit.Assert.assertThat;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNot.not;
import java.util.HashMap;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class CT01ConsultaCEPcomSucessoTest {

	private WebDriver driver;
	private Map<String, Object> vars;
	JavascriptExecutor js;
	@Before
	public void setUp() {
	System.setProperty("webdriver.chrome.driver", "browserDriver/chromedriver.exe");
	driver = new ChromeDriver();
	js = (JavascriptExecutor) driver;
	vars = new HashMap<String, Object>();
	}
	@After
	public void tearDown() {
	driver.quit();
	}
	@SuppressWarnings("deprecation")
	@Test
	public void cT01ConsultaCEPComSucesso() {
	driver.get("http://www.buscacep.correios.com.br/sistemas/buscacep/buscaCep.cfm");
	driver.manage().window().setSize(new Dimension(1003, 681));
	driver.findElement(By.name("UF")).click();
	{
	WebElement dropdown = driver.findElement(By.name("UF"));
	dropdown.findElement(By.xpath("//option[. = 'SP']")).click();
	}
	driver.findElement(By.name("UF")).click();
	driver.findElement(By.name("Localidade")).click();
	driver.findElement(By.name("Localidade")).sendKeys("São Paulo");
	driver.findElement(By.name("Tipo")).click();
	{
	WebElement dropdown = driver.findElement(By.name("Tipo"));
	dropdown.findElement(By.xpath("//option[. = 'Rua']")).click();
	}
	driver.findElement(By.name("Tipo")).click();
	driver.findElement(By.name("Logradouro")).click();
	driver.findElement(By.name("Logradouro")).sendKeys("Frei João");
	driver.findElement(By.cssSelector(".btn2")).click();
	assertThat(driver.findElement(By.cssSelector("p")).getText(), is("DADOS	ENCONTRADOS COM	SUCESSO."));

	}
}
