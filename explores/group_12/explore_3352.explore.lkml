# Explore: explore_3352
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10057.view.lkml"
include: "/views/domain_09/view_10059.view.lkml"
include: "/views/domain_10/view_10060.view.lkml"
include: "/views/domain_11/view_10061.view.lkml"

explore: explore_3352 {
  label: "Explore Explore 3352"
  description: "Comprehensive analytics explore joining base view_10057 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10057
  
  always_filter: {
    filters: [view_10057.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10057.created_at_date: "7 days"]
    unless: [view_10057.id, view_10057.status]
  }

  join: view_10059 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10057.user_id} = ${view_10059.id} ;;
    required_joins: []
  }

  join: view_10060 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10057.account_id} = ${view_10060.account_id} ;;
    required_joins: [view_10059]
  }

  join: view_10061 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10057.category} = ${view_10061.category} ;;
  }

  access_filter: {
    field: view_10057.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10057.is_deleted} = false ;;
}
