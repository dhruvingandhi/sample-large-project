# Explore: explore_2834
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08503.view.lkml"
include: "/views/domain_05/view_08505.view.lkml"
include: "/views/domain_06/view_08506.view.lkml"
include: "/views/domain_07/view_08507.view.lkml"

explore: explore_2834 {
  label: "Explore Explore 2834"
  description: "Comprehensive analytics explore joining base view_08503 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08503
  
  always_filter: {
    filters: [view_08503.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08503.created_at_date: "7 days"]
    unless: [view_08503.id, view_08503.status]
  }

  join: view_08505 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08503.user_id} = ${view_08505.id} ;;
    required_joins: []
  }

  join: view_08506 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08503.account_id} = ${view_08506.account_id} ;;
    required_joins: [view_08505]
  }

  join: view_08507 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08503.category} = ${view_08507.category} ;;
  }

  access_filter: {
    field: view_08503.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08503.is_deleted} = false ;;
}
