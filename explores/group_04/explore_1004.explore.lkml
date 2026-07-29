# Explore: explore_1004
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03013.view.lkml"
include: "/views/domain_15/view_03015.view.lkml"
include: "/views/domain_16/view_03016.view.lkml"
include: "/views/domain_17/view_03017.view.lkml"

explore: explore_1004 {
  label: "Explore Explore 1004"
  description: "Comprehensive analytics explore joining base view_03013 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03013
  
  always_filter: {
    filters: [view_03013.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03013.created_at_date: "7 days"]
    unless: [view_03013.id, view_03013.status]
  }

  join: view_03015 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03013.user_id} = ${view_03015.id} ;;
    required_joins: []
  }

  join: view_03016 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03013.account_id} = ${view_03016.account_id} ;;
    required_joins: [view_03015]
  }

  join: view_03017 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03013.category} = ${view_03017.category} ;;
  }

  access_filter: {
    field: view_03013.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03013.is_deleted} = false ;;
}
