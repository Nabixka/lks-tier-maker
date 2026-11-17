provider "aws" {
    alias   = "virginia"
    region  = var.requester_region
}

provider "aws" {
    alias   = "oregon"
    region  = var.accepter_region
}

resource "aws_vpc_peering_connection" "peering" {
  provider = aws.virginia
  vpc_id        = var.requester_vpc_id  
  peer_vpc_id   = var.accepter_vpc_id
  peer_region   = var.accepter_region
  auto_accept   = false

  tags = {
    Name = "lks-${var.requester_region_name}-peering"
  }
}

resource "aws_vpc_peering_connection_accepter" "peering" {
  provider = aws.oregon
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept               = true

  tags = {
    Name = "lks-${var.accepter_region_name}-peering"
  }
}

