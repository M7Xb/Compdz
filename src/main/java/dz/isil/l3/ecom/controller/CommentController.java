package dz.isil.l3.ecom.controller;
import dz.isil.l3.ecom.entity.Comment;
import dz.isil.l3.ecom.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;


    @PostMapping("/save-comment")
    public String saveComment(Comment comment) {
        commentService.saveComment(comment);
        return "redirect:/admin";
    }

    @GetMapping("/comments")
    public String listComments(Model model) {
        List<Comment> comments = commentService.getAllComments();
        model.addAttribute("comments", comments);
        return "redirect:/admin";
    }

    @GetMapping("/delete-comment/{id}")
    public String deleteComment(@PathVariable("id") Long commentId, RedirectAttributes redirectAttributes) {
        try {
            commentService.deleteCommentById(commentId);
            redirectAttributes.addFlashAttribute("successMessage", "Comment deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting comment.");
        }
        return "redirect:/admin";
    }


    @PostMapping("/edit-comment/{id}")
    public String editComment(@PathVariable("id") Long commentId,
                              @RequestParam("name") String name,
                              @RequestParam("description") String description,
                              @RequestParam("career") String career,
                              RedirectAttributes redirectAttributes) {
        Comment comment = commentService.getCommentById(commentId);
        if (comment != null) {
            comment.setName(name);
            comment.setDescription(description);
            comment.setCareer(career);
            commentService.saveComment(comment);
            redirectAttributes.addFlashAttribute("successMessage", "Comment updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Comment not found.");
        }
        return "redirect:/admin";
    }
}
