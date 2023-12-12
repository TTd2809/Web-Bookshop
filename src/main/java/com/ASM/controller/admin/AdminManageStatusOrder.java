package com.ASM.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ASM.dao.OrderDAO;
import com.ASM.entity.Category;
import com.ASM.entity.Order;
import com.ASM.entity.Product;
import com.ASM.service.OrderService;

@Controller
public class AdminManageStatusOrder {
	 @Autowired
	    OrderDAO orderDao;

	    @Autowired
	    OrderService orderservice;

	    @GetMapping("/bill")
	    public String billpaid(Model model, @RequestParam("page") Optional<Integer> page) {
	        int currentPage = page.orElse(1);
	        int pageSize = 10; // Number of items per page

	        Page<Order> orderPage = orderDao.findAll(PageRequest.of(currentPage - 1, pageSize));

	        model.addAttribute("orderPage", orderPage);

	        int totalPages = orderPage.getTotalPages();
	        if (totalPages > 0) {
	            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
	                    .boxed()
	                    .collect(Collectors.toList());
	            model.addAttribute("pageNumbers", pageNumbers);
	        }

	        return "/admin/product/order";
	    }

	    @PostMapping("/bill/{id}")
	    public String updateStatus(
	            @PathVariable("id") Long id,
	            @RequestParam("stt") Integer status
	    ) {
	        System.out.println(" Updating status for order with id: " + id);

	        Optional<Order> optionalOrder = orderDao.findById(id);

	        optionalOrder.ifPresent(order -> {
	            order.setStatus(status);
	            orderDao.save(order);
	            System.out.println(" Order status updated successfully: " + order);
	        });

	        return "redirect:/bill";
	    }
	
}
