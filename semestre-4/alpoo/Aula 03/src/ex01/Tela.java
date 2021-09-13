package ex01;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Tela extends JFrame implements ActionListener {

    JLabel lbNome = new JLabel("Nome: ");
    JLabel lbIdade = new JLabel("Idade: ");
    JButton btnCadastrar = new JButton("CADASTRAR");
    Font fonteMaior = new Font("Arial", Font.BOLD, 16);

    JTextField campoNome = new JTextField();
    JTextField campoIdade = new JTextField();

    MenuBar barraMenu = new MenuBar();
    Menu menuCarros = new Menu("Carros");
    MenuItem menuCarrosIncluir = new MenuItem("Incluir");
    MenuItem menuCarrosAlterar = new MenuItem("Alterar");
    MenuItem menuCarrosExcluir = new MenuItem("Excluir");

    Menu menuLocacao = new Menu("Locação");
    MenuItem menuLocacaoIncluir = new MenuItem("Incluir");
    MenuItem menuLocacaoAlterar = new MenuItem("Alterar");
    MenuItem menuLocacaoExcluir = new MenuItem("Excluir");
    MenuItem menuLocacaoConsultar = new MenuItem("Consultar");
    MenuItem menuLocacaoFinalizar = new MenuItem("Finalizar");

    Menu menuConsultar = new Menu("Consultar");
    MenuItem menuConsultarCarros = new MenuItem("Carros Locados");
    MenuItem menuConsultarClientes = new MenuItem("Clientes com carros Locados");

    Menu menuSair = new Menu("SAIR");


    public static void main(String[] args) {

        new Tela();
    }

    public Tela() {
        setTitle("Locação de carros: Piriri");
        getContentPane().setBackground(new Color(0xFFC801));
        setBounds(800, 300, 500, 500);
        setVisible(true);
        setLayout(null);
        setResizable(false);

        menuCarros.addActionListener(this);
        menuSair.addActionListener(this);

        lbNome.setFont(fonteMaior);
        lbNome.setForeground(new Color(0x6D49D5));
        lbNome.setOpaque(true);

        lbNome.setBounds(50, 100, 90, 30);
        add(lbNome);


        lbIdade.setBounds(50,150,90,30);
        lbIdade.setFont(fonteMaior);
        add(lbIdade);

        btnCadastrar.setBounds(50, 400, 110, 40);
        add(btnCadastrar);
        btnCadastrar.addActionListener(this);

        campoNome.setBounds(150, 100, 230, 30);
        campoNome.setFont(fonteMaior);
        add(campoNome);

        campoIdade.setBounds(150, 150, 230, 30);
        campoIdade.setFont(fonteMaior);
        add(campoIdade);




        //get: pega a informacao. set eu mudo a informacao
    }

    public void cadastraCliente() {
        String nome;
        int idade;
        nome = campoNome.getText();
        idade = Integer.parseInt(campoIdade.getText());
        JOptionPane.showMessageDialog(null,"Seu nome é " + nome + " e sua idade é " + idade,"RESULTADO ",JOptionPane.ERROR_MESSAGE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnCadastrar) {
            cadastraCliente();
        }
    }
}
