# Explore: explore_1733
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05200.view.lkml"
include: "/views/domain_02/view_05202.view.lkml"
include: "/views/domain_03/view_05203.view.lkml"
include: "/views/domain_04/view_05204.view.lkml"

explore: explore_1733 {
  label: "Explore Explore 1733"
  description: "Comprehensive analytics explore joining base view_05200 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05200
  
  always_filter: {
    filters: [view_05200.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05200.created_at_date: "7 days"]
    unless: [view_05200.id, view_05200.status]
  }

  join: view_05202 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05200.user_id} = ${view_05202.id} ;;
    required_joins: []
  }

  join: view_05203 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05200.account_id} = ${view_05203.account_id} ;;
    required_joins: [view_05202]
  }

  join: view_05204 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05200.category} = ${view_05204.category} ;;
  }

  access_filter: {
    field: view_05200.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05200.is_deleted} = false ;;
}
