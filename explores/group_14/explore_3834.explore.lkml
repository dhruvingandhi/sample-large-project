# Explore: explore_3834
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11503.view.lkml"
include: "/views/domain_05/view_11505.view.lkml"
include: "/views/domain_06/view_11506.view.lkml"
include: "/views/domain_07/view_11507.view.lkml"

explore: explore_3834 {
  label: "Explore Explore 3834"
  description: "Comprehensive analytics explore joining base view_11503 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11503
  
  always_filter: {
    filters: [view_11503.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11503.created_at_date: "7 days"]
    unless: [view_11503.id, view_11503.status]
  }

  join: view_11505 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11503.user_id} = ${view_11505.id} ;;
    required_joins: []
  }

  join: view_11506 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11503.account_id} = ${view_11506.account_id} ;;
    required_joins: [view_11505]
  }

  join: view_11507 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11503.category} = ${view_11507.category} ;;
  }

  access_filter: {
    field: view_11503.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11503.is_deleted} = false ;;
}
