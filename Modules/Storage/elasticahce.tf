resource "aws_elasticache_subnet_group" "redisSubnet" {
  name = "my-redis-subnet-group"
  subnet_ids = [
    for subnet in var.Subnets : subnet.id
    if subnet.tags["Type"] == "private"
  ]

  tags = {
    Name = "MyRedisSubnetGroup"
  }
}


resource "aws_elasticache_cluster" "redis" {
  cluster_id         = "redis-cluster"
  engine             = "redis"
  node_type          = "cache.t2.micro"
  num_cache_nodes    = 1
  subnet_group_name  = aws_elasticache_subnet_group.redisSubnet.name
  security_group_ids = [var.redis_SG]

  tags = {
    Name = "Redis Cluster"
  }
}
