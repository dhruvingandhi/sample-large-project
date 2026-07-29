# Explore: explore_3258
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09775.view.lkml"
include: "/views/domain_27/view_09777.view.lkml"
include: "/views/domain_28/view_09778.view.lkml"
include: "/views/domain_29/view_09779.view.lkml"

explore: explore_3258 {
  label: "Explore Explore 3258"
  description: "Comprehensive analytics explore joining base view_09775 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09775
  
  always_filter: {
    filters: [view_09775.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09775.created_at_date: "7 days"]
    unless: [view_09775.id, view_09775.status]
  }

  join: view_09777 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09775.user_id} = ${view_09777.id} ;;
    required_joins: []
  }

  join: view_09778 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09775.account_id} = ${view_09778.account_id} ;;
    required_joins: [view_09777]
  }

  join: view_09779 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09775.category} = ${view_09779.category} ;;
  }

  access_filter: {
    field: view_09775.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09775.is_deleted} = false ;;
}
