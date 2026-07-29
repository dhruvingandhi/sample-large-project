# Explore: explore_3226
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09679.view.lkml"
include: "/views/domain_31/view_09681.view.lkml"
include: "/views/domain_32/view_09682.view.lkml"
include: "/views/domain_33/view_09683.view.lkml"

explore: explore_3226 {
  label: "Explore Explore 3226"
  description: "Comprehensive analytics explore joining base view_09679 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09679
  
  always_filter: {
    filters: [view_09679.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09679.created_at_date: "7 days"]
    unless: [view_09679.id, view_09679.status]
  }

  join: view_09681 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09679.user_id} = ${view_09681.id} ;;
    required_joins: []
  }

  join: view_09682 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09679.account_id} = ${view_09682.account_id} ;;
    required_joins: [view_09681]
  }

  join: view_09683 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09679.category} = ${view_09683.category} ;;
  }

  access_filter: {
    field: view_09679.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09679.is_deleted} = false ;;
}
