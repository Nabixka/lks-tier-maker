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
    Name = "lks-peering-${var.requester_region_name}"
  }
}

resource "aws_vpc_peering_connection_accepter" "peering" {
  provider = aws.oregon
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept               = true

  tags = {
    Name = "lks-peering-${var.accepter_region_name}"
  }
}

resource "aws_route" "requester_route" {
  count = length(var.requester_rtb_id)
  route_table_id            = var.requester_rtb_ids[count.index]
  destination_cidr_block    = var.accepter_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}

resource "aws_route" "accepter_route" {
  count = length(var.accepter_rtb_id)
  route_table_id            = var.accepter_rtb_ids[count.index]
  destination_cidr_block    = var.requester_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}