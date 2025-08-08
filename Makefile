init_block_logs:
	gzip -kfd data/2015_07_22_mktplace_shop_web_log_sample.log.gz

init_stream_logs:
	cat < /dev/null > stream.log

delete_results:
	rm -rf batch-*
	rm -rf results/
	rm -rf users-*
	rm average-session-time.txt

TIMESTAMP=$(shell date +%s)
backup_results:
	mkdir $(TIMESTAMP)
	mv results/ $(TIMESTAMP)/
	mv users-*/ $(TIMESTAMP)/
	mv average-session-time.txt $(TIMESTAMP)/

run_socket:
	jupyter-nbconvert --debug --execute --ExecutePreprocessor.timeout=21600 Socket-Text-Stream.ipynb

run_socket_lines:
	jupyter-nbconvert --debug --execute --ExecutePreprocessor.timeout=21600 Socket-Text-Lines.ipynb

run_balancer:
	jupyter-nbconvert --debug --execute --ExecutePreprocessor.timeout=21600 AWS-Elastic-Load-Balancer.ipynb
