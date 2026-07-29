# Explore: explore_3375
# Auto-generated LookML Explore File

include: "/views/domain_26/view_10126.view.lkml"
include: "/views/domain_28/view_10128.view.lkml"
include: "/views/domain_29/view_10129.view.lkml"
include: "/views/domain_30/view_10130.view.lkml"

explore: explore_3375 {
  label: "Explore Explore 3375"
  description: "Comprehensive analytics explore joining base view_10126 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10126
  
  always_filter: {
    filters: [view_10126.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10126.created_at_date: "7 days"]
    unless: [view_10126.id, view_10126.status]
  }

  join: view_10128 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10126.user_id} = ${view_10128.id} ;;
    required_joins: []
  }

  join: view_10129 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10126.account_id} = ${view_10129.account_id} ;;
    required_joins: [view_10128]
  }

  join: view_10130 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10126.category} = ${view_10130.category} ;;
  }

  access_filter: {
    field: view_10126.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10126.is_deleted} = false ;;
}
