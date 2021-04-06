data "aws_ecs_task_definition" "nginx" {
  task_definition = aws_ecs_task_definition.nginx.family
}

resource "aws_ecs_task_definition" "nginx" {
  family                = "nginx"
  container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "image": "nginx:latest",
    "essential": true,
    "portMappings": [
        {
          "containerPort": 80,
          "protocol": "tcp"
        }
      ],
    "memory": 500,
    "cpu": 10
  }
]
DEFINITION
}
