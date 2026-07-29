# Explore: explore_1226
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03679.view.lkml"
include: "/views/domain_31/view_03681.view.lkml"
include: "/views/domain_32/view_03682.view.lkml"
include: "/views/domain_33/view_03683.view.lkml"

explore: explore_1226 {
  label: "Explore Explore 1226"
  description: "Comprehensive analytics explore joining base view_03679 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03679
  
  always_filter: {
    filters: [view_03679.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03679.created_at_date: "7 days"]
    unless: [view_03679.id, view_03679.status]
  }

  join: view_03681 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03679.user_id} = ${view_03681.id} ;;
    required_joins: []
  }

  join: view_03682 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03679.account_id} = ${view_03682.account_id} ;;
    required_joins: [view_03681]
  }

  join: view_03683 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03679.category} = ${view_03683.category} ;;
  }

  access_filter: {
    field: view_03679.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03679.is_deleted} = false ;;
}
