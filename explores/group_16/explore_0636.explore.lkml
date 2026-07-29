# Explore: explore_0636
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01909.view.lkml"
include: "/views/domain_11/view_01911.view.lkml"
include: "/views/domain_12/view_01912.view.lkml"
include: "/views/domain_13/view_01913.view.lkml"

explore: explore_0636 {
  label: "Explore Explore 0636"
  description: "Comprehensive analytics explore joining base view_01909 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01909
  
  always_filter: {
    filters: [view_01909.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01909.created_at_date: "7 days"]
    unless: [view_01909.id, view_01909.status]
  }

  join: view_01911 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01909.user_id} = ${view_01911.id} ;;
    required_joins: []
  }

  join: view_01912 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01909.account_id} = ${view_01912.account_id} ;;
    required_joins: [view_01911]
  }

  join: view_01913 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01909.category} = ${view_01913.category} ;;
  }

  access_filter: {
    field: view_01909.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01909.is_deleted} = false ;;
}
