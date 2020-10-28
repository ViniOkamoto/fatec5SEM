package cep.fatec.teste;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

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
public class CT02ConsultaCEPcomLogradouroInvalidoTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
  public void setUp() {
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    driver.quit();
  }
  @Test
  public void cT03ConsultaCEPcomLogradouroInvalido() {
    driver.get("http://www.buscacep.correios.com.br/sistemas/buscacep/buscaCep.cfm");
    driver.manage().window().setSize(new Dimension(1870, 1053));
    driver.findElement(By.name("UF")).click();
    {
      WebElement dropdown = driver.findElement(By.name("UF"));
      dropdown.findElement(By.xpath("//option[. = 'SP']")).click();
    }
    driver.findElement(By.cssSelector(".f1col > option:nth-child(27)")).click();
    driver.findElement(By.name("Localidade")).click();
    driver.findElement(By.name("Localidade")).sendKeys("São Paulo");
    driver.findElement(By.name("Logradouro")).click();
    driver.findElement(By.name("Logradouro")).sendKeys("xxxxxx");
    driver.findElement(By.name("Tipo")).click();
    {
      WebElement dropdown = driver.findElement(By.name("Tipo"));
      dropdown.findElement(By.xpath("//option[. = 'Aeroporto']")).click();
    }
    driver.findElement(By.cssSelector(".f2col > option:nth-child(2)")).click();
    driver.findElement(By.cssSelector(".btn2")).click();
    assertThat(driver.findElement(By.cssSelector("p")).getText(), is("LOGRADOURO NAO ENCONTRADO."));
  }
}
