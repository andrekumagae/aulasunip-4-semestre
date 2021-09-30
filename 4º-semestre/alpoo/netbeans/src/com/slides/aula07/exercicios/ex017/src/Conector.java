
import java.sql.*;
import javax.swing.JOptionPane;

public class Conector {

    public static Connection conector() {
        Connection conexao = null;
        String url = "jdbc:mysql://localhost:3306/petshop";
        String usuario = "root";
        String senha = "";

        try {
            conexao = DriverManager.getConnection(url, usuario, senha);
            System.out.println("Conexao OK");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,
                    "Falha ao se conectar. Confirme as informações do seu banco" + ex);
        }
        return conexao;
    }
}
