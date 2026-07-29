# Explore: explore_0474
# Auto-generated LookML Explore File

include: "/views/domain_23/view_01423.view.lkml"
include: "/views/domain_25/view_01425.view.lkml"
include: "/views/domain_26/view_01426.view.lkml"
include: "/views/domain_27/view_01427.view.lkml"

explore: explore_0474 {
  label: "Explore Explore 0474"
  description: "Comprehensive analytics explore joining base view_01423 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01423
  
  always_filter: {
    filters: [view_01423.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01423.created_at_date: "7 days"]
    unless: [view_01423.id, view_01423.status]
  }

  join: view_01425 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01423.user_id} = ${view_01425.id} ;;
    required_joins: []
  }

  join: view_01426 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01423.account_id} = ${view_01426.account_id} ;;
    required_joins: [view_01425]
  }

  join: view_01427 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01423.category} = ${view_01427.category} ;;
  }

  access_filter: {
    field: view_01423.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01423.is_deleted} = false ;;
}
