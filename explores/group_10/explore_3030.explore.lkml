# Update for 2000 file diff target
# Explore: explore_3030
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09091.view.lkml"
include: "/views/domain_43/view_09093.view.lkml"
include: "/views/domain_44/view_09094.view.lkml"
include: "/views/domain_45/view_09095.view.lkml"

explore: explore_3030 {
  label: "Explore Explore 3030"
  description: "Comprehensive analytics explore joining base view_09091 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09091
  
  always_filter: {
    filters: [view_09091.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09091.created_at_date: "7 days"]
    unless: [view_09091.id, view_09091.status]
  }

  join: view_09093 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09091.user_id} = ${view_09093.id} ;;
    required_joins: []
  }

  join: view_09094 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09091.account_id} = ${view_09094.account_id} ;;
    required_joins: [view_09093]
  }

  join: view_09095 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09091.category} = ${view_09095.category} ;;
  }

  access_filter: {
    field: view_09091.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09091.is_deleted} = false ;;
}
