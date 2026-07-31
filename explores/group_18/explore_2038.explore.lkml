# Update for 2000 file diff target
# Explore: explore_2038
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06115.view.lkml"
include: "/views/domain_17/view_06117.view.lkml"
include: "/views/domain_18/view_06118.view.lkml"
include: "/views/domain_19/view_06119.view.lkml"

explore: explore_2038 {
  label: "Explore Explore 2038"
  description: "Comprehensive analytics explore joining base view_06115 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06115
  
  always_filter: {
    filters: [view_06115.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06115.created_at_date: "7 days"]
    unless: [view_06115.id, view_06115.status]
  }

  join: view_06117 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06115.user_id} = ${view_06117.id} ;;
    required_joins: []
  }

  join: view_06118 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06115.account_id} = ${view_06118.account_id} ;;
    required_joins: [view_06117]
  }

  join: view_06119 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06115.category} = ${view_06119.category} ;;
  }

  access_filter: {
    field: view_06115.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06115.is_deleted} = false ;;
}
