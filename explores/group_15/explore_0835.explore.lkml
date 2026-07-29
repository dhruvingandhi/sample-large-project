# Explore: explore_0835
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02506.view.lkml"
include: "/views/domain_08/view_02508.view.lkml"
include: "/views/domain_09/view_02509.view.lkml"
include: "/views/domain_10/view_02510.view.lkml"

explore: explore_0835 {
  label: "Explore Explore 0835"
  description: "Comprehensive analytics explore joining base view_02506 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02506
  
  always_filter: {
    filters: [view_02506.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02506.created_at_date: "7 days"]
    unless: [view_02506.id, view_02506.status]
  }

  join: view_02508 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02506.user_id} = ${view_02508.id} ;;
    required_joins: []
  }

  join: view_02509 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02506.account_id} = ${view_02509.account_id} ;;
    required_joins: [view_02508]
  }

  join: view_02510 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02506.category} = ${view_02510.category} ;;
  }

  access_filter: {
    field: view_02506.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02506.is_deleted} = false ;;
}
