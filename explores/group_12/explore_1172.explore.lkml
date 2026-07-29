# Explore: explore_1172
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03517.view.lkml"
include: "/views/domain_19/view_03519.view.lkml"
include: "/views/domain_20/view_03520.view.lkml"
include: "/views/domain_21/view_03521.view.lkml"

explore: explore_1172 {
  label: "Explore Explore 1172"
  description: "Comprehensive analytics explore joining base view_03517 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03517
  
  always_filter: {
    filters: [view_03517.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03517.created_at_date: "7 days"]
    unless: [view_03517.id, view_03517.status]
  }

  join: view_03519 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03517.user_id} = ${view_03519.id} ;;
    required_joins: []
  }

  join: view_03520 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03517.account_id} = ${view_03520.account_id} ;;
    required_joins: [view_03519]
  }

  join: view_03521 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03517.category} = ${view_03521.category} ;;
  }

  access_filter: {
    field: view_03517.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03517.is_deleted} = false ;;
}
