# Explore: explore_2130
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06391.view.lkml"
include: "/views/domain_43/view_06393.view.lkml"
include: "/views/domain_44/view_06394.view.lkml"
include: "/views/domain_45/view_06395.view.lkml"

explore: explore_2130 {
  label: "Explore Explore 2130"
  description: "Comprehensive analytics explore joining base view_06391 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06391
  
  always_filter: {
    filters: [view_06391.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06391.created_at_date: "7 days"]
    unless: [view_06391.id, view_06391.status]
  }

  join: view_06393 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06391.user_id} = ${view_06393.id} ;;
    required_joins: []
  }

  join: view_06394 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06391.account_id} = ${view_06394.account_id} ;;
    required_joins: [view_06393]
  }

  join: view_06395 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06391.category} = ${view_06395.category} ;;
  }

  access_filter: {
    field: view_06391.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06391.is_deleted} = false ;;
}
