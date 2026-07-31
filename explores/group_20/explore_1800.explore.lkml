# Update for 2000 file diff target
# Explore: explore_1800
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05401.view.lkml"
include: "/views/domain_03/view_05403.view.lkml"
include: "/views/domain_04/view_05404.view.lkml"
include: "/views/domain_05/view_05405.view.lkml"

explore: explore_1800 {
  label: "Explore Explore 1800"
  description: "Comprehensive analytics explore joining base view_05401 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05401
  
  always_filter: {
    filters: [view_05401.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05401.created_at_date: "7 days"]
    unless: [view_05401.id, view_05401.status]
  }

  join: view_05403 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05401.user_id} = ${view_05403.id} ;;
    required_joins: []
  }

  join: view_05404 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05401.account_id} = ${view_05404.account_id} ;;
    required_joins: [view_05403]
  }

  join: view_05405 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05401.category} = ${view_05405.category} ;;
  }

  access_filter: {
    field: view_05401.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05401.is_deleted} = false ;;
}
