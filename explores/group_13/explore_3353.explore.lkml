# Explore: explore_3353
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10060.view.lkml"
include: "/views/domain_12/view_10062.view.lkml"
include: "/views/domain_13/view_10063.view.lkml"
include: "/views/domain_14/view_10064.view.lkml"

explore: explore_3353 {
  label: "Explore Explore 3353"
  description: "Comprehensive analytics explore joining base view_10060 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10060
  
  always_filter: {
    filters: [view_10060.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10060.created_at_date: "7 days"]
    unless: [view_10060.id, view_10060.status]
  }

  join: view_10062 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10060.user_id} = ${view_10062.id} ;;
    required_joins: []
  }

  join: view_10063 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10060.account_id} = ${view_10063.account_id} ;;
    required_joins: [view_10062]
  }

  join: view_10064 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10060.category} = ${view_10064.category} ;;
  }

  access_filter: {
    field: view_10060.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10060.is_deleted} = false ;;
}
