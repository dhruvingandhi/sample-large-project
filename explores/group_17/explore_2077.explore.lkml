# Explore: explore_2077
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06232.view.lkml"
include: "/views/domain_34/view_06234.view.lkml"
include: "/views/domain_35/view_06235.view.lkml"
include: "/views/domain_36/view_06236.view.lkml"

explore: explore_2077 {
  label: "Explore Explore 2077"
  description: "Comprehensive analytics explore joining base view_06232 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06232
  
  always_filter: {
    filters: [view_06232.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06232.created_at_date: "7 days"]
    unless: [view_06232.id, view_06232.status]
  }

  join: view_06234 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06232.user_id} = ${view_06234.id} ;;
    required_joins: []
  }

  join: view_06235 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06232.account_id} = ${view_06235.account_id} ;;
    required_joins: [view_06234]
  }

  join: view_06236 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06232.category} = ${view_06236.category} ;;
  }

  access_filter: {
    field: view_06232.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06232.is_deleted} = false ;;
}
