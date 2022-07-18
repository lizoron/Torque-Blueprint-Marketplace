resource "aws_instance" "javaspringwebsite" {
depends_on = [aws_route53_record.DNSRecordjavaspringwebsite]
ami = "ami-f90a4880"
instance_type = "t2.nano"

  tags = {"Key": "Name","Value": "java-spring-website"}
  user_data = base64encode(join("",["",
                                "#!/bin/sh\n",
                                "apt-get update -y\n",
                                "apt-get install default-jdk -y\n",
                                "apt-get install tomcat8 -y\n",
                                "apt-get install tomcat8 -y\n",
                                "apt-get install tomcat8-admin -y\n",
                                "mkdir /home/artifacts\n",
                                "cd /home/artifacts || exit\n",
                                "git clone https://github.com/cloudshell-colony/sample_java_spring_source.git\n",
                                "mkdir /home/user/.config/colony-java-spring-sample -p\n",
                                "bash -c 'cat >> /home/user/.config/colony-java-spring-sample/app.properties' <<EOL\n",
                                "# Dadabase connection settings:\n",
                                "jdbc.url=jdbc:mysql://mysql.$DOMAIN_NAME:3306/$DB_NAME\n",
                                "jdbc.username=$DB_USER\n",
                                "jdbc.password=$DB_PASS\n",
                                "EOL\n",
                                "echo 'Deploy to TomCat'\n",
                                "rm -rf /var/lib/tomcat8/webapps/ROOT\n",
                                "cp sample_java_spring_source/artifacts/colony-java-spring-sample-1.0.0-BUILD-SNAPSHOT.war /var/lib/tomcat8/webapps/ROOT.war\n",
                                "systemctl start tomcat8\n"
                            ]))
}
                    