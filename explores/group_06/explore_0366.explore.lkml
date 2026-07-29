# Explore: explore_0366
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01099.view.lkml"
include: "/views/domain_01/view_01101.view.lkml"
include: "/views/domain_02/view_01102.view.lkml"
include: "/views/domain_03/view_01103.view.lkml"

explore: explore_0366 {
  label: "Explore Explore 0366"
  description: "Comprehensive analytics explore joining base view_01099 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01099
  
  always_filter: {
    filters: [view_01099.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01099.created_at_date: "7 days"]
    unless: [view_01099.id, view_01099.status]
  }

  join: view_01101 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01099.user_id} = ${view_01101.id} ;;
    required_joins: []
  }

  join: view_01102 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01099.account_id} = ${view_01102.account_id} ;;
    required_joins: [view_01101]
  }

  join: view_01103 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01099.category} = ${view_01103.category} ;;
  }

  access_filter: {
    field: view_01099.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01099.is_deleted} = false ;;
}
