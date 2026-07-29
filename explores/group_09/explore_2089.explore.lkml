# Explore: explore_2089
# Auto-generated LookML Explore File

include: "/views/domain_18/view_06268.view.lkml"
include: "/views/domain_20/view_06270.view.lkml"
include: "/views/domain_21/view_06271.view.lkml"
include: "/views/domain_22/view_06272.view.lkml"

explore: explore_2089 {
  label: "Explore Explore 2089"
  description: "Comprehensive analytics explore joining base view_06268 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06268
  
  always_filter: {
    filters: [view_06268.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06268.created_at_date: "7 days"]
    unless: [view_06268.id, view_06268.status]
  }

  join: view_06270 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06268.user_id} = ${view_06270.id} ;;
    required_joins: []
  }

  join: view_06271 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06268.account_id} = ${view_06271.account_id} ;;
    required_joins: [view_06270]
  }

  join: view_06272 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06268.category} = ${view_06272.category} ;;
  }

  access_filter: {
    field: view_06268.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06268.is_deleted} = false ;;
}
