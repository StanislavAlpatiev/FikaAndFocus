//package com.dsv.pvt.fikafocus.user;
package com.dsv.pvt.fikafocus.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
    public boolean existsByNameAndEmail(String name, String email);
    // public boolean existsById(long id);
    //public UserEntity findById(int id);
}
