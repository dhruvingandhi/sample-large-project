# Explore: explore_3166
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09499.view.lkml"
include: "/views/domain_01/view_09501.view.lkml"
include: "/views/domain_02/view_09502.view.lkml"
include: "/views/domain_03/view_09503.view.lkml"

explore: explore_3166 {
  label: "Explore Explore 3166"
  description: "Comprehensive analytics explore joining base view_09499 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09499
  
  always_filter: {
    filters: [view_09499.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09499.created_at_date: "7 days"]
    unless: [view_09499.id, view_09499.status]
  }

  join: view_09501 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09499.user_id} = ${view_09501.id} ;;
    required_joins: []
  }

  join: view_09502 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09499.account_id} = ${view_09502.account_id} ;;
    required_joins: [view_09501]
  }

  join: view_09503 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09499.category} = ${view_09503.category} ;;
  }

  access_filter: {
    field: view_09499.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09499.is_deleted} = false ;;
}
