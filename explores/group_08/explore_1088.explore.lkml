# Explore: explore_1088
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03265.view.lkml"
include: "/views/domain_17/view_03267.view.lkml"
include: "/views/domain_18/view_03268.view.lkml"
include: "/views/domain_19/view_03269.view.lkml"

explore: explore_1088 {
  label: "Explore Explore 1088"
  description: "Comprehensive analytics explore joining base view_03265 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03265
  
  always_filter: {
    filters: [view_03265.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03265.created_at_date: "7 days"]
    unless: [view_03265.id, view_03265.status]
  }

  join: view_03267 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03265.user_id} = ${view_03267.id} ;;
    required_joins: []
  }

  join: view_03268 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03265.account_id} = ${view_03268.account_id} ;;
    required_joins: [view_03267]
  }

  join: view_03269 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03265.category} = ${view_03269.category} ;;
  }

  access_filter: {
    field: view_03265.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03265.is_deleted} = false ;;
}
