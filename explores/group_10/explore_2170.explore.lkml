# Explore: explore_2170
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06511.view.lkml"
include: "/views/domain_13/view_06513.view.lkml"
include: "/views/domain_14/view_06514.view.lkml"
include: "/views/domain_15/view_06515.view.lkml"

explore: explore_2170 {
  label: "Explore Explore 2170"
  description: "Comprehensive analytics explore joining base view_06511 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06511
  
  always_filter: {
    filters: [view_06511.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06511.created_at_date: "7 days"]
    unless: [view_06511.id, view_06511.status]
  }

  join: view_06513 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06511.user_id} = ${view_06513.id} ;;
    required_joins: []
  }

  join: view_06514 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06511.account_id} = ${view_06514.account_id} ;;
    required_joins: [view_06513]
  }

  join: view_06515 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06511.category} = ${view_06515.category} ;;
  }

  access_filter: {
    field: view_06511.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06511.is_deleted} = false ;;
}
