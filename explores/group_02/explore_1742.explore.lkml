# Explore: explore_1742
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05227.view.lkml"
include: "/views/domain_29/view_05229.view.lkml"
include: "/views/domain_30/view_05230.view.lkml"
include: "/views/domain_31/view_05231.view.lkml"

explore: explore_1742 {
  label: "Explore Explore 1742"
  description: "Comprehensive analytics explore joining base view_05227 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05227
  
  always_filter: {
    filters: [view_05227.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05227.created_at_date: "7 days"]
    unless: [view_05227.id, view_05227.status]
  }

  join: view_05229 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05227.user_id} = ${view_05229.id} ;;
    required_joins: []
  }

  join: view_05230 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05227.account_id} = ${view_05230.account_id} ;;
    required_joins: [view_05229]
  }

  join: view_05231 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05227.category} = ${view_05231.category} ;;
  }

  access_filter: {
    field: view_05227.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05227.is_deleted} = false ;;
}
