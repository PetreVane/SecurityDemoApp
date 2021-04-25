package AppContainer.DAO;

import AppContainer.Models.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Customer> theQuery = currentSession.createQuery("from Customer order by firstName", Customer.class);
        return theQuery.getResultList();
    }

    @Override
    public void saveCustomer(Customer theCustomer) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theCustomer);
    }

    @Override
    public Customer getCustomer(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Customer.class, theId);
    }

    @Override
    public void deleteCustomer(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Customer customerToBeDeleted = session.get(Customer.class, theId);
        session.delete(customerToBeDeleted);
    }

    @Override
    public List<Customer> searchCustomer(String customerName) {
        Session session = sessionFactory.getCurrentSession();

        Query searchQuery = null;
        if (customerName != null && customerName.trim().length() > 0) {
            searchQuery = session.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName", Customer.class);
            searchQuery.setParameter("theName", "%" + customerName.toLowerCase() + "%");
        } else {
            searchQuery = session.createQuery("from Customer", Customer.class);
        }

        List<Customer> customers = searchQuery.getResultList();
        return customers;
    }
}
