# Update for 500 file diff target
# Explore: explore_2105
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06316.view.lkml"
include: "/views/domain_18/view_06318.view.lkml"
include: "/views/domain_19/view_06319.view.lkml"
include: "/views/domain_20/view_06320.view.lkml"

explore: explore_2105 {
  label: "Explore Explore 2105"
  description: "Comprehensive analytics explore joining base view_06316 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06316
  
  always_filter: {
    filters: [view_06316.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06316.created_at_date: "7 days"]
    unless: [view_06316.id, view_06316.status]
  }

  join: view_06318 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06316.user_id} = ${view_06318.id} ;;
    required_joins: []
  }

  join: view_06319 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06316.account_id} = ${view_06319.account_id} ;;
    required_joins: [view_06318]
  }

  join: view_06320 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06316.category} = ${view_06320.category} ;;
  }

  access_filter: {
    field: view_06316.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06316.is_deleted} = false ;;
}
