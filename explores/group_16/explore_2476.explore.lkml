# Explore: explore_2476
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07429.view.lkml"
include: "/views/domain_31/view_07431.view.lkml"
include: "/views/domain_32/view_07432.view.lkml"
include: "/views/domain_33/view_07433.view.lkml"

explore: explore_2476 {
  label: "Explore Explore 2476"
  description: "Comprehensive analytics explore joining base view_07429 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07429
  
  always_filter: {
    filters: [view_07429.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07429.created_at_date: "7 days"]
    unless: [view_07429.id, view_07429.status]
  }

  join: view_07431 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07429.user_id} = ${view_07431.id} ;;
    required_joins: []
  }

  join: view_07432 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07429.account_id} = ${view_07432.account_id} ;;
    required_joins: [view_07431]
  }

  join: view_07433 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07429.category} = ${view_07433.category} ;;
  }

  access_filter: {
    field: view_07429.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07429.is_deleted} = false ;;
}
