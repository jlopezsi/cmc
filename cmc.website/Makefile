all:
	pandoc pages.md/index.md --template=pages.md/template.html -o pages/index.html

upload:
	sudo cp -r assets bower_components docs img pages index.php /var/www/html/
	sudo chown -R apache:apache /var/www/html/

