# Explore: explore_0776
# Auto-generated LookML Explore File

include: "/views/domain_29/view_02329.view.lkml"
include: "/views/domain_31/view_02331.view.lkml"
include: "/views/domain_32/view_02332.view.lkml"
include: "/views/domain_33/view_02333.view.lkml"

explore: explore_0776 {
  label: "Explore Explore 0776"
  description: "Comprehensive analytics explore joining base view_02329 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02329
  
  always_filter: {
    filters: [view_02329.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02329.created_at_date: "7 days"]
    unless: [view_02329.id, view_02329.status]
  }

  join: view_02331 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02329.user_id} = ${view_02331.id} ;;
    required_joins: []
  }

  join: view_02332 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02329.account_id} = ${view_02332.account_id} ;;
    required_joins: [view_02331]
  }

  join: view_02333 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02329.category} = ${view_02333.category} ;;
  }

  access_filter: {
    field: view_02329.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02329.is_deleted} = false ;;
}
