# Explore: explore_2752
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08257.view.lkml"
include: "/views/domain_09/view_08259.view.lkml"
include: "/views/domain_10/view_08260.view.lkml"
include: "/views/domain_11/view_08261.view.lkml"

explore: explore_2752 {
  label: "Explore Explore 2752"
  description: "Comprehensive analytics explore joining base view_08257 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08257
  
  always_filter: {
    filters: [view_08257.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08257.created_at_date: "7 days"]
    unless: [view_08257.id, view_08257.status]
  }

  join: view_08259 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08257.user_id} = ${view_08259.id} ;;
    required_joins: []
  }

  join: view_08260 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08257.account_id} = ${view_08260.account_id} ;;
    required_joins: [view_08259]
  }

  join: view_08261 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08257.category} = ${view_08261.category} ;;
  }

  access_filter: {
    field: view_08257.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08257.is_deleted} = false ;;
}
