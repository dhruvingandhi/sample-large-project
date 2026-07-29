# Explore: explore_1623
# Auto-generated LookML Explore File

include: "/views/domain_20/view_04870.view.lkml"
include: "/views/domain_22/view_04872.view.lkml"
include: "/views/domain_23/view_04873.view.lkml"
include: "/views/domain_24/view_04874.view.lkml"

explore: explore_1623 {
  label: "Explore Explore 1623"
  description: "Comprehensive analytics explore joining base view_04870 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04870
  
  always_filter: {
    filters: [view_04870.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04870.created_at_date: "7 days"]
    unless: [view_04870.id, view_04870.status]
  }

  join: view_04872 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04870.user_id} = ${view_04872.id} ;;
    required_joins: []
  }

  join: view_04873 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04870.account_id} = ${view_04873.account_id} ;;
    required_joins: [view_04872]
  }

  join: view_04874 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04870.category} = ${view_04874.category} ;;
  }

  access_filter: {
    field: view_04870.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04870.is_deleted} = false ;;
}
