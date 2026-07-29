# Explore: explore_1950
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05851.view.lkml"
include: "/views/domain_03/view_05853.view.lkml"
include: "/views/domain_04/view_05854.view.lkml"
include: "/views/domain_05/view_05855.view.lkml"

explore: explore_1950 {
  label: "Explore Explore 1950"
  description: "Comprehensive analytics explore joining base view_05851 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05851
  
  always_filter: {
    filters: [view_05851.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05851.created_at_date: "7 days"]
    unless: [view_05851.id, view_05851.status]
  }

  join: view_05853 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05851.user_id} = ${view_05853.id} ;;
    required_joins: []
  }

  join: view_05854 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05851.account_id} = ${view_05854.account_id} ;;
    required_joins: [view_05853]
  }

  join: view_05855 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05851.category} = ${view_05855.category} ;;
  }

  access_filter: {
    field: view_05851.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05851.is_deleted} = false ;;
}
