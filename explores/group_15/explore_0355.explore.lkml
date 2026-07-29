# Explore: explore_0355
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01066.view.lkml"
include: "/views/domain_18/view_01068.view.lkml"
include: "/views/domain_19/view_01069.view.lkml"
include: "/views/domain_20/view_01070.view.lkml"

explore: explore_0355 {
  label: "Explore Explore 0355"
  description: "Comprehensive analytics explore joining base view_01066 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01066
  
  always_filter: {
    filters: [view_01066.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01066.created_at_date: "7 days"]
    unless: [view_01066.id, view_01066.status]
  }

  join: view_01068 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01066.user_id} = ${view_01068.id} ;;
    required_joins: []
  }

  join: view_01069 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01066.account_id} = ${view_01069.account_id} ;;
    required_joins: [view_01068]
  }

  join: view_01070 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01066.category} = ${view_01070.category} ;;
  }

  access_filter: {
    field: view_01066.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01066.is_deleted} = false ;;
}
