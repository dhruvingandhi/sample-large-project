# Explore: explore_1752
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05257.view.lkml"
include: "/views/domain_09/view_05259.view.lkml"
include: "/views/domain_10/view_05260.view.lkml"
include: "/views/domain_11/view_05261.view.lkml"

explore: explore_1752 {
  label: "Explore Explore 1752"
  description: "Comprehensive analytics explore joining base view_05257 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05257
  
  always_filter: {
    filters: [view_05257.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05257.created_at_date: "7 days"]
    unless: [view_05257.id, view_05257.status]
  }

  join: view_05259 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05257.user_id} = ${view_05259.id} ;;
    required_joins: []
  }

  join: view_05260 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05257.account_id} = ${view_05260.account_id} ;;
    required_joins: [view_05259]
  }

  join: view_05261 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05257.category} = ${view_05261.category} ;;
  }

  access_filter: {
    field: view_05257.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05257.is_deleted} = false ;;
}
