import dao.DAOImpl;

public class Runner {
    public static void main(String[] args) {
        DAOImpl dao=new DAOImpl();
        System.out.println(dao.selectAll().get(0).getName());
    }
}
