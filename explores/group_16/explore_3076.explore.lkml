# Explore: explore_3076
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09229.view.lkml"
include: "/views/domain_31/view_09231.view.lkml"
include: "/views/domain_32/view_09232.view.lkml"
include: "/views/domain_33/view_09233.view.lkml"

explore: explore_3076 {
  label: "Explore Explore 3076"
  description: "Comprehensive analytics explore joining base view_09229 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09229
  
  always_filter: {
    filters: [view_09229.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09229.created_at_date: "7 days"]
    unless: [view_09229.id, view_09229.status]
  }

  join: view_09231 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09229.user_id} = ${view_09231.id} ;;
    required_joins: []
  }

  join: view_09232 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09229.account_id} = ${view_09232.account_id} ;;
    required_joins: [view_09231]
  }

  join: view_09233 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09229.category} = ${view_09233.category} ;;
  }

  access_filter: {
    field: view_09229.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09229.is_deleted} = false ;;
}
