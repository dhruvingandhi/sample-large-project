# Explore: explore_1590
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04771.view.lkml"
include: "/views/domain_23/view_04773.view.lkml"
include: "/views/domain_24/view_04774.view.lkml"
include: "/views/domain_25/view_04775.view.lkml"

explore: explore_1590 {
  label: "Explore Explore 1590"
  description: "Comprehensive analytics explore joining base view_04771 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04771
  
  always_filter: {
    filters: [view_04771.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04771.created_at_date: "7 days"]
    unless: [view_04771.id, view_04771.status]
  }

  join: view_04773 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04771.user_id} = ${view_04773.id} ;;
    required_joins: []
  }

  join: view_04774 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04771.account_id} = ${view_04774.account_id} ;;
    required_joins: [view_04773]
  }

  join: view_04775 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04771.category} = ${view_04775.category} ;;
  }

  access_filter: {
    field: view_04771.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04771.is_deleted} = false ;;
}
