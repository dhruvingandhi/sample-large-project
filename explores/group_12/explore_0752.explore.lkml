# Explore: explore_0752
# Auto-generated LookML Explore File

include: "/views/domain_07/view_02257.view.lkml"
include: "/views/domain_09/view_02259.view.lkml"
include: "/views/domain_10/view_02260.view.lkml"
include: "/views/domain_11/view_02261.view.lkml"

explore: explore_0752 {
  label: "Explore Explore 0752"
  description: "Comprehensive analytics explore joining base view_02257 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02257
  
  always_filter: {
    filters: [view_02257.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02257.created_at_date: "7 days"]
    unless: [view_02257.id, view_02257.status]
  }

  join: view_02259 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02257.user_id} = ${view_02259.id} ;;
    required_joins: []
  }

  join: view_02260 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02257.account_id} = ${view_02260.account_id} ;;
    required_joins: [view_02259]
  }

  join: view_02261 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02257.category} = ${view_02261.category} ;;
  }

  access_filter: {
    field: view_02257.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02257.is_deleted} = false ;;
}
