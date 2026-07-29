# Explore: explore_2923
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08770.view.lkml"
include: "/views/domain_22/view_08772.view.lkml"
include: "/views/domain_23/view_08773.view.lkml"
include: "/views/domain_24/view_08774.view.lkml"

explore: explore_2923 {
  label: "Explore Explore 2923"
  description: "Comprehensive analytics explore joining base view_08770 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08770
  
  always_filter: {
    filters: [view_08770.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08770.created_at_date: "7 days"]
    unless: [view_08770.id, view_08770.status]
  }

  join: view_08772 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08770.user_id} = ${view_08772.id} ;;
    required_joins: []
  }

  join: view_08773 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08770.account_id} = ${view_08773.account_id} ;;
    required_joins: [view_08772]
  }

  join: view_08774 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08770.category} = ${view_08774.category} ;;
  }

  access_filter: {
    field: view_08770.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08770.is_deleted} = false ;;
}
