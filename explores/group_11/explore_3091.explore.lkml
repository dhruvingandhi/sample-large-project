# Explore: explore_3091
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09274.view.lkml"
include: "/views/domain_26/view_09276.view.lkml"
include: "/views/domain_27/view_09277.view.lkml"
include: "/views/domain_28/view_09278.view.lkml"

explore: explore_3091 {
  label: "Explore Explore 3091"
  description: "Comprehensive analytics explore joining base view_09274 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09274
  
  always_filter: {
    filters: [view_09274.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09274.created_at_date: "7 days"]
    unless: [view_09274.id, view_09274.status]
  }

  join: view_09276 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09274.user_id} = ${view_09276.id} ;;
    required_joins: []
  }

  join: view_09277 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09274.account_id} = ${view_09277.account_id} ;;
    required_joins: [view_09276]
  }

  join: view_09278 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09274.category} = ${view_09278.category} ;;
  }

  access_filter: {
    field: view_09274.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09274.is_deleted} = false ;;
}
