# Explore: explore_1089
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03268.view.lkml"
include: "/views/domain_20/view_03270.view.lkml"
include: "/views/domain_21/view_03271.view.lkml"
include: "/views/domain_22/view_03272.view.lkml"

explore: explore_1089 {
  label: "Explore Explore 1089"
  description: "Comprehensive analytics explore joining base view_03268 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03268
  
  always_filter: {
    filters: [view_03268.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03268.created_at_date: "7 days"]
    unless: [view_03268.id, view_03268.status]
  }

  join: view_03270 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03268.user_id} = ${view_03270.id} ;;
    required_joins: []
  }

  join: view_03271 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03268.account_id} = ${view_03271.account_id} ;;
    required_joins: [view_03270]
  }

  join: view_03272 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03268.category} = ${view_03272.category} ;;
  }

  access_filter: {
    field: view_03268.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03268.is_deleted} = false ;;
}
