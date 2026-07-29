# Explore: explore_0004
# Auto-generated LookML Explore File

include: "/views/domain_13/view_00013.view.lkml"
include: "/views/domain_15/view_00015.view.lkml"
include: "/views/domain_16/view_00016.view.lkml"
include: "/views/domain_17/view_00017.view.lkml"

explore: explore_0004 {
  label: "Explore Explore 0004"
  description: "Comprehensive analytics explore joining base view_00013 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00013
  
  always_filter: {
    filters: [view_00013.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00013.created_at_date: "7 days"]
    unless: [view_00013.id, view_00013.status]
  }

  join: view_00015 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00013.user_id} = ${view_00015.id} ;;
    required_joins: []
  }

  join: view_00016 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00013.account_id} = ${view_00016.account_id} ;;
    required_joins: [view_00015]
  }

  join: view_00017 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00013.category} = ${view_00017.category} ;;
  }

  access_filter: {
    field: view_00013.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00013.is_deleted} = false ;;
}
