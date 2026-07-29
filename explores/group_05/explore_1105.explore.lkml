# Explore: explore_1105
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03316.view.lkml"
include: "/views/domain_18/view_03318.view.lkml"
include: "/views/domain_19/view_03319.view.lkml"
include: "/views/domain_20/view_03320.view.lkml"

explore: explore_1105 {
  label: "Explore Explore 1105"
  description: "Comprehensive analytics explore joining base view_03316 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03316
  
  always_filter: {
    filters: [view_03316.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03316.created_at_date: "7 days"]
    unless: [view_03316.id, view_03316.status]
  }

  join: view_03318 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03316.user_id} = ${view_03318.id} ;;
    required_joins: []
  }

  join: view_03319 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03316.account_id} = ${view_03319.account_id} ;;
    required_joins: [view_03318]
  }

  join: view_03320 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03316.category} = ${view_03320.category} ;;
  }

  access_filter: {
    field: view_03316.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03316.is_deleted} = false ;;
}
