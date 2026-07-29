# Explore: explore_1261
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03784.view.lkml"
include: "/views/domain_36/view_03786.view.lkml"
include: "/views/domain_37/view_03787.view.lkml"
include: "/views/domain_38/view_03788.view.lkml"

explore: explore_1261 {
  label: "Explore Explore 1261"
  description: "Comprehensive analytics explore joining base view_03784 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03784
  
  always_filter: {
    filters: [view_03784.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03784.created_at_date: "7 days"]
    unless: [view_03784.id, view_03784.status]
  }

  join: view_03786 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03784.user_id} = ${view_03786.id} ;;
    required_joins: []
  }

  join: view_03787 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03784.account_id} = ${view_03787.account_id} ;;
    required_joins: [view_03786]
  }

  join: view_03788 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03784.category} = ${view_03788.category} ;;
  }

  access_filter: {
    field: view_03784.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03784.is_deleted} = false ;;
}
