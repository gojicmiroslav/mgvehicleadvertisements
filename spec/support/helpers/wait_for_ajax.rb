module WaitForAjax
	def wait_for_ajax
		Timeout.timeout(Capybara.default_max_wait_time) do
   			loop until finished_all_ajax_requests?
 		end
   	end
 
   	def finished_all_ajax_requests?
	  	request_count = page.evaluate_script("$.active").to_i
	  	request_count && request_count.zero?
		rescue Timeout::Error
	end
end