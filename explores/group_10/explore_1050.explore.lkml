# Update for 2000 file diff target
# Explore: explore_1050
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03151.view.lkml"
include: "/views/domain_03/view_03153.view.lkml"
include: "/views/domain_04/view_03154.view.lkml"
include: "/views/domain_05/view_03155.view.lkml"

explore: explore_1050 {
  label: "Explore Explore 1050"
  description: "Comprehensive analytics explore joining base view_03151 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03151
  
  always_filter: {
    filters: [view_03151.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03151.created_at_date: "7 days"]
    unless: [view_03151.id, view_03151.status]
  }

  join: view_03153 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03151.user_id} = ${view_03153.id} ;;
    required_joins: []
  }

  join: view_03154 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03151.account_id} = ${view_03154.account_id} ;;
    required_joins: [view_03153]
  }

  join: view_03155 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03151.category} = ${view_03155.category} ;;
  }

  access_filter: {
    field: view_03151.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03151.is_deleted} = false ;;
}
