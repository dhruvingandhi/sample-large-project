# Explore: explore_0834
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02503.view.lkml"
include: "/views/domain_05/view_02505.view.lkml"
include: "/views/domain_06/view_02506.view.lkml"
include: "/views/domain_07/view_02507.view.lkml"

explore: explore_0834 {
  label: "Explore Explore 0834"
  description: "Comprehensive analytics explore joining base view_02503 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02503
  
  always_filter: {
    filters: [view_02503.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02503.created_at_date: "7 days"]
    unless: [view_02503.id, view_02503.status]
  }

  join: view_02505 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02503.user_id} = ${view_02505.id} ;;
    required_joins: []
  }

  join: view_02506 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02503.account_id} = ${view_02506.account_id} ;;
    required_joins: [view_02505]
  }

  join: view_02507 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02503.category} = ${view_02507.category} ;;
  }

  access_filter: {
    field: view_02503.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02503.is_deleted} = false ;;
}
