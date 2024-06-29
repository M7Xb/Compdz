package dz.isil.l3.ecom.repository;

import dz.isil.l3.ecom.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}

