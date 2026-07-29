# Explore: explore_2529
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07588.view.lkml"
include: "/views/domain_40/view_07590.view.lkml"
include: "/views/domain_41/view_07591.view.lkml"
include: "/views/domain_42/view_07592.view.lkml"

explore: explore_2529 {
  label: "Explore Explore 2529"
  description: "Comprehensive analytics explore joining base view_07588 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07588
  
  always_filter: {
    filters: [view_07588.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07588.created_at_date: "7 days"]
    unless: [view_07588.id, view_07588.status]
  }

  join: view_07590 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07588.user_id} = ${view_07590.id} ;;
    required_joins: []
  }

  join: view_07591 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07588.account_id} = ${view_07591.account_id} ;;
    required_joins: [view_07590]
  }

  join: view_07592 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07588.category} = ${view_07592.category} ;;
  }

  access_filter: {
    field: view_07588.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07588.is_deleted} = false ;;
}
