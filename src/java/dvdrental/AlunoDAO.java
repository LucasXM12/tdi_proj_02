package dvdrental;

import org.hibernate.*;

public class AlunoDAO {

    Session session = null;

    public AlunoDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public void fecha() {
        if (this.session.isConnected()) {
            this.session.disconnect();
        }
        
        if (this.session.isOpen()) {
            this.session.close();
        }
    }

    public Aluno getAlunoByRA(int ra) {
        Transaction tx = this.session.beginTransaction();

        SQLQuery q = this.session.createSQLQuery("select * from Aluno where ra=:ra");
        q.addEntity(Aluno.class);
        q.setInteger("ra", ra);

        Aluno aluno = (Aluno) q.uniqueResult();

        return aluno;
    }

    public void excluiAlunoByRA(int ra) {
        Transaction tx = this.session.beginTransaction();

        SQLQuery q = this.session.createSQLQuery("delete from Aluno where ra=:ra");
        q.setInteger("ra", ra);

        q.executeUpdate();
        tx.commit();
    }

    public void insere(Aluno aluno) {
        Transaction tx = this.session.beginTransaction();

        this.session.save(aluno);

        tx.commit();
    }

    public void altera(Aluno aluno) {
        Transaction tx = this.session.beginTransaction();

        SQLQuery q = this.session.createSQLQuery("update Aluno set nome=:nome, curso=:curso where ra=:ra");
        q.setString("nome", aluno.getNome());
        q.setString("curso", aluno.getCurso());

        q.setInteger("ra", aluno.getRa());

        q.executeUpdate();
        tx.commit();
    }
}
