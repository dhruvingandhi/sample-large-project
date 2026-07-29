# Explore: explore_2123
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06370.view.lkml"
include: "/views/domain_22/view_06372.view.lkml"
include: "/views/domain_23/view_06373.view.lkml"
include: "/views/domain_24/view_06374.view.lkml"

explore: explore_2123 {
  label: "Explore Explore 2123"
  description: "Comprehensive analytics explore joining base view_06370 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06370
  
  always_filter: {
    filters: [view_06370.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06370.created_at_date: "7 days"]
    unless: [view_06370.id, view_06370.status]
  }

  join: view_06372 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06370.user_id} = ${view_06372.id} ;;
    required_joins: []
  }

  join: view_06373 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06370.account_id} = ${view_06373.account_id} ;;
    required_joins: [view_06372]
  }

  join: view_06374 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06370.category} = ${view_06374.category} ;;
  }

  access_filter: {
    field: view_06370.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06370.is_deleted} = false ;;
}
