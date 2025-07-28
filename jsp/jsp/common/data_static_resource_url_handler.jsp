<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
  $(function() {
    $(document).on('click', '[data-static-resource-url]', function(e) {
      e.preventDefault();
      window.open($(this).data('static-resource-url'), '_blank');
    });
  })
</script>
