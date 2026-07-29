# Explore: explore_0356
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01069.view.lkml"
include: "/views/domain_21/view_01071.view.lkml"
include: "/views/domain_22/view_01072.view.lkml"
include: "/views/domain_23/view_01073.view.lkml"

explore: explore_0356 {
  label: "Explore Explore 0356"
  description: "Comprehensive analytics explore joining base view_01069 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01069
  
  always_filter: {
    filters: [view_01069.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01069.created_at_date: "7 days"]
    unless: [view_01069.id, view_01069.status]
  }

  join: view_01071 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01069.user_id} = ${view_01071.id} ;;
    required_joins: []
  }

  join: view_01072 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01069.account_id} = ${view_01072.account_id} ;;
    required_joins: [view_01071]
  }

  join: view_01073 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01069.category} = ${view_01073.category} ;;
  }

  access_filter: {
    field: view_01069.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01069.is_deleted} = false ;;
}
