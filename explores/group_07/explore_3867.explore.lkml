# Explore: explore_3867
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11602.view.lkml"
include: "/views/domain_04/view_11604.view.lkml"
include: "/views/domain_05/view_11605.view.lkml"
include: "/views/domain_06/view_11606.view.lkml"

explore: explore_3867 {
  label: "Explore Explore 3867"
  description: "Comprehensive analytics explore joining base view_11602 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11602
  
  always_filter: {
    filters: [view_11602.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11602.created_at_date: "7 days"]
    unless: [view_11602.id, view_11602.status]
  }

  join: view_11604 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11602.user_id} = ${view_11604.id} ;;
    required_joins: []
  }

  join: view_11605 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11602.account_id} = ${view_11605.account_id} ;;
    required_joins: [view_11604]
  }

  join: view_11606 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11602.category} = ${view_11606.category} ;;
  }

  access_filter: {
    field: view_11602.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11602.is_deleted} = false ;;
}
