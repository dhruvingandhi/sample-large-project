# Explore: explore_1750
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05251.view.lkml"
include: "/views/domain_03/view_05253.view.lkml"
include: "/views/domain_04/view_05254.view.lkml"
include: "/views/domain_05/view_05255.view.lkml"

explore: explore_1750 {
  label: "Explore Explore 1750"
  description: "Comprehensive analytics explore joining base view_05251 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05251
  
  always_filter: {
    filters: [view_05251.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05251.created_at_date: "7 days"]
    unless: [view_05251.id, view_05251.status]
  }

  join: view_05253 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05251.user_id} = ${view_05253.id} ;;
    required_joins: []
  }

  join: view_05254 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05251.account_id} = ${view_05254.account_id} ;;
    required_joins: [view_05253]
  }

  join: view_05255 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05251.category} = ${view_05255.category} ;;
  }

  access_filter: {
    field: view_05251.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05251.is_deleted} = false ;;
}
