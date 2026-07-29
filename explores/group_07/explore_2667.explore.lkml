# Explore: explore_2667
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08002.view.lkml"
include: "/views/domain_04/view_08004.view.lkml"
include: "/views/domain_05/view_08005.view.lkml"
include: "/views/domain_06/view_08006.view.lkml"

explore: explore_2667 {
  label: "Explore Explore 2667"
  description: "Comprehensive analytics explore joining base view_08002 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08002
  
  always_filter: {
    filters: [view_08002.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08002.created_at_date: "7 days"]
    unless: [view_08002.id, view_08002.status]
  }

  join: view_08004 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08002.user_id} = ${view_08004.id} ;;
    required_joins: []
  }

  join: view_08005 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08002.account_id} = ${view_08005.account_id} ;;
    required_joins: [view_08004]
  }

  join: view_08006 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08002.category} = ${view_08006.category} ;;
  }

  access_filter: {
    field: view_08002.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08002.is_deleted} = false ;;
}
