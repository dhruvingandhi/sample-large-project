# Update for 2000 file diff target
# Explore: explore_2750
# Auto-generated LookML Explore File

include: "/views/domain_01/view_08251.view.lkml"
include: "/views/domain_03/view_08253.view.lkml"
include: "/views/domain_04/view_08254.view.lkml"
include: "/views/domain_05/view_08255.view.lkml"

explore: explore_2750 {
  label: "Explore Explore 2750"
  description: "Comprehensive analytics explore joining base view_08251 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08251
  
  always_filter: {
    filters: [view_08251.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08251.created_at_date: "7 days"]
    unless: [view_08251.id, view_08251.status]
  }

  join: view_08253 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08251.user_id} = ${view_08253.id} ;;
    required_joins: []
  }

  join: view_08254 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08251.account_id} = ${view_08254.account_id} ;;
    required_joins: [view_08253]
  }

  join: view_08255 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08251.category} = ${view_08255.category} ;;
  }

  access_filter: {
    field: view_08251.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08251.is_deleted} = false ;;
}
